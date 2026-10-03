Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C44CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4079D60F21;
	Sat,  3 Oct 2026 13:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AO2REmuViHR3; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 78D3360675
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035817;
	b=F36+xbR+hSE9IDh30BzWqyw6gRfwqc3ojeyuwyYJ+5OAAWp1GsxHl317G3BLIMIVZdtK
	 tEPqK3FzAxKvw3396YewJW977FIIesz6c1wdLmF/eo+TjahgUEDEAIf1VSjJGeCV93eEJ
	 l7m87YUO9JhV6urTQv6i3qVuvAQ9fbDy9W2BPac64bMjLq9ZOFVrTNHF/9rR/gWoX+JT/
	 O4n1x6HAzxsDSeFbgG34tNaO9SdLBju4A1Bcg9wk4GtxRSGEjMg4wW/WtMRvIdFUljhrJ
	 GlDSAewILNgwTM3Iq/dNpKaGm9WNC/BSiNbQvFQjghj0Jtx7GE7EmDO7s82NP25jKyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035817;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fm3uhmKf9i8ESwBTdWIFK5xXbUOTI078hnkCmAFSlCo=;
	b=B21rlCfCpzq8cFFx8d0gTi3lTSfOLb18UvBcjXq+HTHykK0+7LZFtuZH6w+rgUqXJQHp
	 n+kceFX/4t8/ENfue2zVu8pguCFZMAU35jvvPygclIiUOLtKBp6/W//YCPzvJKBY3gZsG
	 +mHxFtCDcWHOMOIkgIQ/HZuar8LaYY4ufbHTvkAfasL/Y7al6WIX82c5dF+g6rclO0X51
	 3BbT6MANQRfTBejk5XruprS2usMP1NqEFLkQpEqTHgL8nSPhk6IP6TsU9gaL76usZ4hl/
	 X0j1Tw2xS5BC6XI3KVIzsziZeLvzLoeVDgxWnl7tJrf80/U/6fl9rsE+NOaE2mwjtaQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035817;
	bh=fm3uhmKf9i8ESwBTdWIFK5xXbUOTI078hnkCmAFSlCo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GAZl5sqHMFj0b5tBO25x/Wd66M0142kJX7/zz46FHBZzOFEHhfQJNLyJ5rFFWdbct
	 /OL63RYoPFLf4A1xriFp6Vwuqxg+8f+UEH1xmiq9c8FUHRgZpakNsAjJmlesFRGb2R
	 7jOtp7Jdk7hmFNmuZrDahtOHYyIwJ7pXz33fZ2Grnn4vFO4wRPyY0qV1Z2y3wxFl5p
	 LlKXoZ354zL1aVGf3qMWv5VtB89oIcylIetDj5l6cY1cqp5YtQzi3sMeVKiUZj8kft
	 RxVX4ZGsPXfFuBrr69wFLVRNqjU4fRy3XSwKapyCD+DE4jqqEo8EtLVIWVanSA+tQW
	 sqgIKLPOy082g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78D3360675;
	Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92B40179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9004F81457
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0BUXdNK0ciT for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DB67281455
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035814;
 b=pRCKAOMb/rvdt5Q2OZ5eOlqzGLBgQ1jABO3u6qSkYvGBjY4DpCoAMGH9XZN6URh3Hk6r
 sYN9OkD0Wz+Vdca9qoUeiIrb0Sfk3Lf/Or8oUu/9U0rlRsaOfzcJAtxmgIRl1aE04bzmo
 pojlgDJB04e8WWTIw0p/87/cQV/aIkJGccZdnxjgyW9r0uyMylL1skGWIQvyJKDM4nzoR
 0jAVD/fKb50kLTw+wuEFsE1l4o91fW1wBiDCJOl6oo2zibOirAqmGyxW5k0eaRAzMna7p
 W0f6KlyBOpuVw46h0SHKtf+T6Uj1MpPetkmNPX7FHy0Uz8LE6ZzRPTv+Cgilj2vPVLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035814;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XYQ8Tbu403t81nKZPlmC6V1EDH3I+bKX48Gb3aZafi8=;
 b=GeTEs1eBSclx8QO9PmFIkCswUEhqAUFOQJs1CUxnO3ohRa3uz1bZAt0Ks/xSFhA7aTvH
 1mr9D9k7RzaCjzasb+4ty74ypxuhfHBjjDaZb7CQEqIHZErMz+/CkRR7kJrH7nqW1OalT
 s9ZwMw4Le6wMy5dzl1It+vUONwRbTzQlYjXnVkfDBBeoBqAdbF0iSznCHNSOZQ09wGA4F
 ycoB3LoPmcsOxsdIVhu6+blVUk1rtopRCtGSEjYr/ZdOzevY4KMAfVJkJOcL1JeVIxXGB
 uiD6ICIoB1emlwQTJWY0u0xA/BR5fihi7htovj/kGXqt0n73gfNRxIqCS5Fry4kNg2A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB67281455
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FF508A318; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d15e44c4a841e626035ca21aae117db9f23adf7
X-Git-Newrev: 96cb3581c0f65945a4b5a4458737e250e5c55b83
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.1FF508A318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohappyeyeballs: bump to
 version 2.7.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/96cb3581c0f65945a4b5a4458737e250e5c55b83
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash | 4 ++--
 package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
index 10d3d5cadc..fe41296d66 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohappyeyeballs/json
-md5  2fa845a1ce2f7730045fa763aa9987f8  aiohappyeyeballs-2.6.1.tar.gz
-sha256  c3f9d0113123803ccadfdf3f0faa505bc78e6a72d1cc4806cbd719826e943558  aiohappyeyeballs-2.6.1.tar.gz
+md5  0f2e6f584d94d4d21d7d6911f584fb2c  aiohappyeyeballs-2.7.1.tar.gz
+sha256  065665c041c42a5938ed220bdcd7230f22527fbec085e1853d2402c8a3615d9d  aiohappyeyeballs-2.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
index 8dcc59a77b..6b2140c39d 100644
--- a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.6.1
+PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.7.1
 PYTHON_AIOHAPPYEYEBALLS_SOURCE = aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
-PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/26/30/f84a107a9c4331c14b2b586036f40965c128aa4fee4dda5d3d51cb14ad54
+PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/ce/f4/eec0465c2f67b2664688d0240b3212d5196fd89e741df67ddb81f8d35658
 PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = poetry
 PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
 PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
