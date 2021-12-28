Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1711FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 20:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F4740100;
	Tue, 28 Dec 2021 20:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RYiHMomU0iQo; Tue, 28 Dec 2021 20:21:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D707F40889;
	Tue, 28 Dec 2021 20:21:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BE5E1BF344
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89E00400AB
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQlN-0hjzN59 for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 20:21:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C4F740012
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 20:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 50BBF82A1B; Tue, 28 Dec 2021 20:15:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 21:20:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ad6a3a428831b343823ee3bd95d8d5813a0697c
X-Git-Newrev: 22ad0f2569ff849dd2eefdd6c0412d961c762f95
X-Patchwork-Hint: ignore
Message-Id: <20211228201531.50BBF82A1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlpp: bump to version 5.0.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=22ad0f2569ff849dd2eefdd6c0412d961c762f95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to meson-package as configure is not shipped anymore

This bump will fix the following build failure raised since bump of
glibmm to version 2.68.2 in commit
dddb65efbdf2c7952f22a1e51009f17f1676db4a:

Package 'glibmm-2.4', required by 'virtual:world', not found

https://github.com/libxmlplusplus/libxmlplusplus/blob/5.0.1/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/ab3c3ace6d9409a70a4a8c1e27dfa9b915be10fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxmlpp/libxmlpp.hash |  4 ++--
 package/libxmlpp/libxmlpp.mk   | 10 +++++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/libxmlpp/libxmlpp.hash b/package/libxmlpp/libxmlpp.hash
index 7a59880e7e..50238eff00 100644
--- a/package/libxmlpp/libxmlpp.hash
+++ b/package/libxmlpp/libxmlpp.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/3.2/libxml++-3.2.0.sha256sum
-sha256  b786fae7fd7820d356698069a787d107995c3efcbef50d8f4efd3766ab768e4f  libxml++-3.2.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/5.0/libxml++-5.0.1.sha256sum
+sha256  15c38307a964fa6199f4da6683a599eb7e63cc89198545b36349b87cf9aa0098  libxml++-5.0.1.tar.xz
 
 # Hash for license file
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index 98cba2a5a2..874577eb1f 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -4,13 +4,17 @@
 #
 ################################################################################
 
-LIBXMLPP_VERSION_MAJOR = 3.2
-LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).0
+LIBXMLPP_VERSION_MAJOR = 5.0
+LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).1
 LIBXMLPP_LICENSE = LGPL-2.1 (library), LGPL-2.0+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
 LIBXMLPP_SITE = http://ftp.gnome.org/pub/GNOME/sources/libxml++/$(LIBXMLPP_VERSION_MAJOR)
 LIBXMLPP_INSTALL_STAGING = YES
 LIBXMLPP_DEPENDENCIES = libxml2 glibmm host-pkgconf
+LIBXMLPP_CONF_OPTS = \
+	-Dbuild-examples=false \
+	-Dbuild-tests=false \
+	-Dvalidation=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
