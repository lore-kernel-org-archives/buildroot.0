Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFD2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 12:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7012281A39;
	Tue, 22 Feb 2022 12:00:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHcJ00knva3B; Tue, 22 Feb 2022 12:00:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9911481A3B;
	Tue, 22 Feb 2022 12:00:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F03681BF865
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 12:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC1D5409A0
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 12:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bujxwky_B0G9 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 12:00:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAD374099E
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 12:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TnJmhSf1q7ZMT0FHWVYwbWg4ktJztzfDHY9+GIzY3l0=; b=IayHWM1+HrgzFJ/zuR8+IXLBDB
 lGzauoRU2bHt3ab0Sv4+FTod5aZZvS6f+YD50kZpff5EAR8ndgSgTo28XpKH6wxobDImDAdMvFfPq
 ITJ8OJgmCSEEAAPwwfWfnbcA6sI7C5dgwT2HnJPHrz2T85jzKD0kCK0ea80H1QUcxWwFcp1JeCi59
 l043/uEHv31QgqFBl4qm2COeuVxAeVC7VfKhtT4iPc8Vbs3fp9+8sRo+t44JrxAZq1MGgU8607GAY
 8BlhD2kSKLK3z3C3xU/xOHZrg0P4IeRrwvK89B34hgbwMo4eOx79PeD5h7DeXI/nc/BFTCi7dBwST
 JHjSYOgQ==;
Received: from 91-153-34-133.elisa-laajakaista.fi ([91.153.34.133] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nMTqW-0003zk-6C
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 13:00:44 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 590b1029
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 12:00:34 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 14:00:34 +0200
Message-Id: <20220222120034.1748652-1-aperez@igalia.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/glib-networking: security bump to
 version 2.70.1
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

This is a minor release which fixes a couple of crashes and an incorrect
case of TLS certificate velidation when built with the OpenSSL backend.
Release notes:

  https://gitlab.gnome.org/GNOME/glib-networking/-/blob/b0d45b17f745088256c9ad1ae9a7e2467dec6286/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/glib-networking/glib-networking.hash | 4 ++--
 package/glib-networking/glib-networking.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 6a53b436b0..347ef6777c 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,3 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.70/glib-networking-2.70.0.sha256sum
-sha256  66b408e7afa86c582fe38963db56133869ab4b57d34e48ec56aba621940d6f35  glib-networking-2.70.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.70/glib-networking-2.70.1.sha256sum
+sha256  2a16bfc2d271ccd3266e3fb462bc8a4103c02e81bbb339aa92d6fb060592d7bc  glib-networking-2.70.1.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 53280700bc..f74e520d31 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GLIB_NETWORKING_VERSION_MAJOR = 2.70
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
