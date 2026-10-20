Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E91606A31D
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bio2L3Id
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7E14810B5;
	Tue, 20 Oct 2026 10:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqqR0p2wb6Xx; Tue, 20 Oct 2026 10:21:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B118E810E2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792491692;
	b=kQaA7tOgz4saXYwVJu9xxGs6Trd/6W4M+pEbPj/wvj7Q3W3+ZK2WeChn3rpf42Seu/I+
	 aQbmpJtVbfQiShVkqdbIdF4+2jMBXtp6AKKpHupVllMLSSagudExcwieEt1+WvQNdWMmE
	 fnEmoELGNcXoPx5KH+otxUYc/O4LVxSU8he60SdH9S4F6m5VU+QZ/cwriKLQ6XW9x3X27
	 WIpMxd/OzK7aGMHsd+C043Irg2gC8+5Tzn4aNxzgsn4l4VHee0Rsh1q/WKZnP2Rn6mlnr
	 Q86HPrbSvjqREg2rVi0DoFo1BotKp4X7EyadNed/oaYuNcD/7OYR7QueGVBnRJYpl6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792491692;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=Evi6krOvfNDgB88AEDAYbBvdlTC1QTFrGeLxr51O5D8=;
	b=qSmR0Tct16oGs+OF3zn9gR+NK4ZqtYNdyGMyynT4N1tBS8G+Yzy0jGp5iE4YzdHPqr/4
	 /z99fNzsZO6njYjf285LWpeylsS2tbvYHtOxqV9muqNTd6UHnYJdRt0QKHRDjBES0BP3Q
	 jvyMJP0AoEEMAoExLom0ztR0wheGeqzpUc9aVsP2pwh52wkufWjzMN7DXqBtEXTzVSaIi
	 mLZXmGG8uTyoURXefkBqlGCH7P3ediYUk49Mga68/l1q8BgVDEOCrwZHZQP+FPeiARqhB
	 hzz0LMc/E6Y0YtqgaQQyqNXO9yrc+alJqRCDppQJyDLpY5RiTlCZKc97rajzjOTlV+Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792491692;
	bh=Evi6krOvfNDgB88AEDAYbBvdlTC1QTFrGeLxr51O5D8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bio2L3IdzAllSZQq3qX+CTvNUtOLLu+PjEPAlCZqj9E5SfaxE1XQFbLr7eY9CVHna
	 hhVk+YlIW1A4a7lPtB6qdARw9i50xhaRwWcs9F6HmunB46dDzDokAMyJ+Eg0nPz1Om
	 ASBM+JOOZr7qT6v8o1e55GNjWCw/HE1beSvOtIu6KXEBYDmvUwLVgjcD/07Eu+TVhX
	 I2KQOYMA0XbxA4PMuer9eundMNfvkC7b6Wex+OH8KZE37cT8wmG0S98B0CHPPkrzUa
	 GREyNCnL5HadfiO897HqAPV2jVYzCeebD3S5BdzqAbiODwSmPFQbtChNkwOdQbzSik
	 L9kkNf5pszN8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B118E810E2;
	Tue, 20 Oct 2026 10:21:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D32DC1AB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4D4D60830
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAnk1sCwK8bC for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0391E60825
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792491687;
 b=Nb9P/T8nh3/rvJtrLTa90JmfmkpQS7hDaJEMPh53+HjFUsiuWqa0sMgoXwNJlCInB9zV
 k0BfsN7DN5PVMEDRU0JMzBYN//80+EXJcXR9pKk20rLY0W1U9AH233jLzE3dENsxjfJU1
 iYSFH3MrZ13OmdsgybDUh8w/Haig9P/r6F1WQTVs+/UR51tLN/Wq6P6umbdz7P3jG3Vgh
 g/3Jv/RGj0s5VPA9DmRN/aRTSf5OqcuALATHOz4w8ydzop1SXIMfzD65yKJLyy6V8kPV3
 g4RVNE0atao0w4P3YZ1vS84YoGbqwPLruu8V4d9i1yEO6Xqa808wqfB3OB3HLPPHtbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792491687;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qTpcSL55Sc5hGqKZbDfqe9Y7D65NPUAuCrjTajLujXs=;
 b=h6kWbXUXRHGmBQVoQHNlyAJirFJQWWIPNX/lPd7QvDzqqB0dio9vfWzZN59ACq6AB8/o
 wIwBomW6XwXHEPACjUuzpozsPs8leQ/o/YM7IaXp5RgD2oUO4A962NlqBSd7rAZ4Kf1p+
 gIGKb7qI8IqFdEixDEIyg9Qcf+aG5MEIKKHexxxqgby4kAJ834h4XiIyshYD9JKXDky79
 NtU/cAJ+Sibn3hWF2JrO/ubtJpgH9F0QuPEb9fdKmgpi+0nu1CX2siJmIFieI0umLZZOu
 UrAiZjNoheumnJNiiCIWK/w0V1iwqZoWt2hn352fw6NQNIeXpGDsWynwWb1VYnUtitg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0391E60825
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 008B799715; Tue, 20 Oct 2026 10:20:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 12:20:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b89d3a408f87b4638bb1ec802decf11c23193445
X-Git-Newrev: af83dd919177a7bbef22ed315eed696705d01afe
X-Patchwork-Hint: ignore
Message-Id: <20261020102004.008B799715@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-ele-imx:
 bump to version 2.0.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/af83dd919177a7bbef22ed315eed696705d01afe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

To match the NXP BSP version LF6.18.37_2.1.0.

License hashes changed because the LA_OPT_NXP_Software_License changed from
"v63 May 2025" to "v64.2 May 2026".

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash | 6 +++---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
index f064ef1830..ea2405cf52 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c3ae4a1e1a41da441bd61483ef011ac24bf624aa6bad36f879b5dfa435647b4c  firmware-ele-imx-2.0.4-93492e0.bin
-sha256  3001cf84018c5cb10d183a678f6ec8a928c797616ba06b398d7ca93c0779aaa2  COPYING
-sha256  a829b109a0a406a6a2fec19975a332feca225098ce66bfab2220c6608db8fce5  EULA
+sha256  a24f0e6be783a09281d44b0c2fb26ed719038387441e7ef325b9d4c514592b1d  firmware-ele-imx-2.0.7-0265375.bin
+sha256  09fc7cbaffd4b91cb3b464be0a71f420bc84c2b674de9c1895a292dbb326b3c6  COPYING
+sha256  402244fa32bbd3d061688096049229c224b296a294c147984bfd2de306755340  EULA
 sha256  8721a617a5d4c7f366aaf857ebda21eb4c9fc9175dc92b70f627c611d403ec8e  SCR.txt
diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
index a844ca0d94..5756b422ba 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FIRMWARE_ELE_IMX_VERSION = 2.0.4
-FIRMWARE_ELE_IMX_REVISION = 93492e0
+FIRMWARE_ELE_IMX_VERSION = 2.0.7
+FIRMWARE_ELE_IMX_REVISION = 0265375
 FIRMWARE_ELE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_ELE_IMX_SOURCE = firmware-ele-imx-$(FIRMWARE_ELE_IMX_VERSION)-$(FIRMWARE_ELE_IMX_REVISION).bin
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
