Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F04C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 21:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DE658188A;
	Mon, 28 Feb 2022 21:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zgq133qetTbK; Mon, 28 Feb 2022 21:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6348817BA;
	Mon, 28 Feb 2022 21:34:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 339571BF2FF
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2228A60E6C
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:34:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6KBeJJ7_fAoc for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 21:34:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3156560E59
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 21:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tytDT7NrARTnGS9rSRwB+MhoB5ojK7kKJdrmAhjVt2E=; b=RQ7/7e0HkwKz987lLE8R/DIPnq
 Kb3lNxoPNzJGGfes6+b+yPcek1Ex9XFq7EMXNiZKNSiAELFqQ3E3q8BjOtcN9mmkAxMot7xi+cxjo
 0mKLPVz7xT3/u8lrWxaTmGDzFzjceN9q4eHtrRQfGH3EB014OOR1Rydq0NG8fo/s7SPxpi7IQGVY0
 eTc2Uuh1zV8ndnUwA9vhNzQF2a12kjsrMrPjp3L36BGKvbPXsejGHoA6wQjaHJi0gKek9+ZQFYUqG
 gNlAX79c8xFnt6B95zSXC327QO765FNS4GQYRRiPXEeX5sFGoPqnzLCuR53514SmBVCe5BifaIw5a
 VDyti/sQ==;
Received: from 91-153-34-241.elisa-laajakaista.fi ([91.153.34.241] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nOnfG-0000Tv-Ui
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 22:34:43 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 904e7e6d
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 21:34:32 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 23:34:32 +0200
Message-Id: <20220228213432.3289480-1-aperez@igalia.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/seatd: security bump to version
 0.6.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release contains a security fix in seatd-launch which prevents
removal of files that the calling user did not have privileges to
remove. Release notes:

  https://git.sr.ht/~kennylevinsen/seatd/refs/0.6.4

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/seatd/seatd.hash | 2 +-
 package/seatd/seatd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/seatd/seatd.hash b/package/seatd/seatd.hash
index 18f65d3aeb..88793b6dd5 100644
--- a/package/seatd/seatd.hash
+++ b/package/seatd/seatd.hash
@@ -1,5 +1,5 @@
 # Calculated locally
-sha256  5226850c163b485aebe71da0d3f4941761637e146a5c9393cb40c52617ad84a8  0.6.3.tar.gz
+sha256  3d4ac288114219ba7721239cafee7bfbeb7cf8e1e7fd653602a369e4ad050bd8  0.6.4.tar.gz
 
 # License files
 sha256  282a494803d666616bd726e0279636b5f6a31387ae19a707459074050f2600d3  LICENSE
diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 27d3155b2b..5382cad39b 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEATD_VERSION = 0.6.3
+SEATD_VERSION = 0.6.4
 SEATD_SOURCE = $(SEATD_VERSION).tar.gz
 SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
