Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B093B606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 18:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jA7dGOBN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=OvJQYRcW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F043605D9;
	Tue, 27 Oct 2026 18:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPQ5Di_43LTO; Tue, 27 Oct 2026 18:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 72781605F7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793124554;
	b=FUGpq2/3uuee1f9PUOu5lWHjqwESjT5loOpkhD1hZ40SwB9zY64TS+Up1/51ObHfb7aL
	 8YAjxArFBZ/b3PNNc6sP7WW6bCJvlbHX/A5zP7/OWYhi485B49NljcWRf3IYnXtC/yX+g
	 2aPp/4mbdS0Xm2TINS9zFH7r1sG5/0JJXEsRQLT5lS0UeGlFn2VWFS/Y/SqBvAa6/Rccc
	 ZMaWPtlY1PSBckAW9/EFcpI8zCKyrqsfaMMuOWcqkNZtbkRuaYwmMznwI/0ot/ANDPMGs
	 45UFpq2tnhLDv62F8gwr1Gzw0s3kZfTRXms+HstBYpS/bCFMvV8+LbMyO+g75xk22vA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793124554;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=erOO907z5oSazU0OOPCf4khhQm9mzYz341/HeEIx3oA=;
	b=Mbl9e6oidzoPE2EzTuMDlHzAqHsqZZZQHDfYBhkO6wIBANZ/szzMbi7hY1CxeLdTRo6l
	 4t6Lpc2g1bpF86FeJy2iqLradWOpMxjKnJ/8aMUstqtzI15d9/V4zkg3Qnaqjhw1OfWk7
	 XrQSs0OheNQGAehrvgUgc57ib1LMDJq/TNn9yFGr+p71BfLXUbbYvHw//Ap75/hupSOLr
	 dC0pZCrz6Jz6or98RhT0q5N6RO5fkP1Es+N2JxfH/TzkL4gYfhUhbLAfr2WAxOEwSVk+N
	 p85bd6LKmHqq3VHV3jXJRHYqBNdJ6i1PsltGmKZhpc8m4xTuO1UaKYW0pt4m908WASw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793124554;
	bh=erOO907z5oSazU0OOPCf4khhQm9mzYz341/HeEIx3oA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jA7dGOBN9i8UAkfrgq0v/lo0Kw2uRQXo4TnDEoqfajaiAp6QH5S3kyCo2FtjYrFB/
	 F8eMFngaI24iynFq/+1MmfPt/5NKx+cxXunU7F9x6i2oAQniXMbd98ac/X1Ii/net3
	 GS43UlXHglmwh/GSgvhjFYIlrtP/VSOzgvGJ/nX7a7OZG9JNGG9acwnsSwPx05vKwP
	 W/aTQyJw3cWp3WmQGYdaAoQLy+pozwbdCUplK8HTKoU4ioiCkueMZRawb8nBpPKgHf
	 OgrQBMJXyknrgwpurohpOSEYRLh8b5fpHxUVPzUkOgOTDXsluOpmNyHgWECb0XrTp/
	 EAqQZiEHKcS9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72781605F7;
	Tue, 27 Oct 2026 18:09:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E557E4D1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 18:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6F1380BB2
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 18:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9C5G7DykydS for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 18:09:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 602C080A68
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.132
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793124552;
 b=BsLVOF1B3NCMHEtktxZn+Gwk1YNQSUuTnwJePJseViUDYmgMOXddKnIj5XNPrfGk2uuW
 lQ6IAuTp9uCoozPXoGBi/NQ5wk74EWswx7PbQn9vserCpeWMhakBUmzNl7EdPsO+I+jxf
 mEPgk/YpO+F7GMkExlSY3k5j46HuD7wsa23+MQq5on3xa9d8Ma+Amu07W57WoXFmxEUOk
 BQQfAac4XOFQPSvl+4gXgNvoXBHx8R8vXD+WpiM4t7m4EHK20Hwo1eWmhZbAroEpw4evC
 rIBXVGkiZFxltlaBiZVjcdr9HsC63Md03cFbw9McCV4Yopxqogo8i+Q5xi5UnlKrvzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793124552;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=q3POgK09isVn/IwvzSnU9upOYb5X7TR0hu5pmgQuG+c=;
 b=tPmrV8xyxcWNdOzpBDeAtTv85w/NRPlGQN6FYfbZNbHa76OoiWN4cKEOOxP8KdXLNAEf
 GkOxmUGalE7tr4DbZPPYcQsaVZ/0FEMrpzZPUCuX8CyPmfAj6pODPP6bxkTDhCC7oKxUp
 uUZI0wSmUwaq7Oit1/8mIVtwTMnNROjrjHFhjg1tKHOIyyQZhshuATwsO6k7L05azhSsE
 dc2XX9jXU2IoP4qSJpzOgS4FYT8ln6u1ZXqRTvIBvnod+Sr0VazvoDOJyfHii2G4kGwzm
 UXgK3IN6Ld9FLtfsFFAGC3nBry1OAMHd4YUbuFn1dzh6odx0/jiiYwwFpiS027MjrnQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=benettiengineering.com;
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=OvJQYRcW; 
 arc=none smtp.remote-ip=62.149.158.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OvJQYRcW
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 602C080A68
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 18:09:09 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id LlbdxgxCntleFLlbexN4pq; Tue, 27 Oct 2026 19:09:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1793124546; bh=OKqu2RjaP3iQdt0CL1mzP5SMIg0RE/aGZIMbuSxUuVg=;
 h=From:To:Subject:Date:MIME-Version;
 b=OvJQYRcWj+tmq0yAATtur3GAR1cIh8ahn0q8RV6ezULFAX/lkS8aZBJOi+s/z5kf0
 TOg7qK7sgycQPK4oSQcB07wVl53PIdGuwWRQz+vRpPp1dhBt9TYaVB7Ni9fe58Tdbc
 fn+Z7sJHWzwWoxabT9JRZfLv2IvCchTxbwH0vYnRcHfCDNbwBdjqR4BVcu4BSHCM55
 ZtqJwqrIDmKAYooatmfaYWlOGtP3ScawALhr+m74rbIDP6M8vYUNY5ggbUNDzTt/Xk
 CRxNMeQcu1bHXO+7ImV8kr2NmtYiO4gCMlCTUcH8330zHsmRcqcmscbiz0K14MP8fQ
 x1pkpaTXSVjJw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 27 Oct 2026 19:09:05 +0100
Message-ID: <20261027180905.2638208-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGkkHPCBcV0SDWO6N9C0g05SC3GTIxKfJKHFJqyLDEiYb016m3B8S+CzofiPHe/biIQUYJuhQRuWohS+w+L/x9TzphQdkcAF5xdvF1K7v/q11X4SfXfm
 S5Mb/ej0oNKqI9KLba+rQlXVEEACUFk5QLRR2AJObN0W3/ivuaDUDuT9kG7xuSQhNP5E2Xq0jpJzUlP005YQLTmfRQuf40wTAExEaZiNF9okeiBRstT2GsZq
 rAgC3GwJSeqetBhHypsgCgRF8BSdH5pF9XFgE2Ex6kU=
Subject: [Buildroot] [PATCH v2] package/rtl8723bu: fix build failure with
 Linux versions 7.1.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 99c3aee78f537afa3ccf5820c68857b2c10e9351 points to buggy commit
causing build to fail with Linux versions 7.1.x so let's update to
version 2026-10-27_2 to fix the bug.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fixed missing hash
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 4b2b71ddb2..aa420d3ea2 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  eaebe07d38931408c8f5dedb3a8c61e251862e0b8859b899d193f9d5cb77d748  rtl8723bu-8292ef94965fb61d3052ff2bf068fcd830e665c1.tar.gz
+sha256  d7e326c79ed9901050458df391cb569c401b8d345c2728509659c81c76b3897b  rtl8723bu-da429f4c3ec254bd4d02f0f6b595230deab4194f.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 4175d02d52..ae25661b1b 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = 8292ef94965fb61d3052ff2bf068fcd830e665c1
+RTL8723BU_VERSION = da429f4c3ec254bd4d02f0f6b595230deab4194f
 RTL8723BU_SITE = $(call github,benetti-engineering,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
