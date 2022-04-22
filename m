Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24653C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 18:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8440607EC;
	Fri, 22 Apr 2022 18:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apyXqURBowDy; Fri, 22 Apr 2022 18:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B843360757;
	Fri, 22 Apr 2022 18:44:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E12311C11A5
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF519606FF
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjvIgE-QVSne for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 18:44:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAD45606F5
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 18:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ApNfxvrtnDg5TwSlXmFqQBODOg9rVrxhoe1eb11hbMQ=; b=Xzgu8rLXFRPrBjDFmtLP6SW1yM
 8W0wQ4Lzk6Tvk1VZijimw3ux55KEaj8O66tejg1Y3P2AcZqaspNlFXZVpiwZdGngSPpJ0rjJ2HNCY
 QtobtCMtALdh7V3W1MWBR1G/d7eDvV5bLsYlRaYIv/iHHXJvQCM6H3kwd1gHzSUjg6YBRJw0IW5ae
 o8lxoaufsubBCtJ3tCLnhtJ2+yZ+ZJYhHHeB7JvvGADUObsR7jc/5bV/W8xphUKRqiF4KGXNVtPMU
 YQddHCsV2IjsjlLmrGvCSKy2pHmIEG3kSPa9EJmXZdmh8AHuVqZIMQuRTXfQIDEJVi3x5mRzZR+mE
 iNCespsg==;
Received: from 91-153-34-227.elisa-laajakaista.fi ([91.153.34.227] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nhyGs-000Bh2-9M; Fri, 22 Apr 2022 20:44:46 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 98758525;
 Fri, 22 Apr 2022 18:44:31 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 21:44:31 +0300
Message-Id: <20220422184431.3471788-1-aperez@igalia.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version 2.36.1
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release, with the usual flurry of correctness fixes, and a patch
to fix the build with the accessibility support disabled. Release notes:

  https://webkitgtk.org/2022/04/21/webkitgtk2.36.1-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 38068745ee..00a342ed7f 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.36.0.tar.xz.sums
-md5  1e3fe866ab6e41e7ec3deb80bd5b3a85  webkitgtk-2.36.0.tar.xz
-sha1  5b90bc59c2f442223de1a4d9dc8ff604888abb3c  webkitgtk-2.36.0.tar.xz
-sha256  b877cca1f105235f5dd57c7ac2b2c2be3c6b691ff444f93925c7254cf156c64d  webkitgtk-2.36.0.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.36.1.tar.xz.sums
+md5  e6100df7f82d95a4e65176b10f5ab011  webkitgtk-2.36.1.tar.xz
+sha1  36a95b906e54bcf94d2be04e1cbaac3584da7eb1  webkitgtk-2.36.1.tar.xz
+sha256  0149ea5fb1d20f2a9981677d45c952a047330001ea24a8dc29035239f12c0c8f  webkitgtk-2.36.1.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index eca175d1bd..9e85c5b78f 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.36.0
+WEBKITGTK_VERSION = 2.36.1
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
