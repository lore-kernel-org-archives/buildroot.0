Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF76C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1095F417AA;
	Thu, 16 Dec 2021 18:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ErWrPq6wRFqf; Thu, 16 Dec 2021 18:25:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E1BE417AF;
	Thu, 16 Dec 2021 18:25:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0915B1BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5DEA83F09
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id toLPbkGkU8bm for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F75883F0A
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AB56182293; Thu, 16 Dec 2021 18:19:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 19:08:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54d962b7685c98b7975ad4db61e11b329a5dba58
X-Git-Newrev: d8bee3950aa851620d6a954aebad1f984caa105a
X-Patchwork-Hint: ignore
Message-Id: <20211216181916.AB56182293@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/guile: bump to version 3.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8bee3950aa851620d6a954aebad1f984caa105a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libtool is not a dependency since version 3.0.6 and
https://git.savannah.gnu.org/cgit/guile.git/commit/?id=2e26538d6a51bdd6c2e68ad4539ab3750ef8670a

https://git.savannah.gnu.org/cgit/guile.git/tree/NEWS?h=v3.0.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/guile/Config.in  | 1 -
 package/guile/guile.hash | 2 +-
 package/guile/guile.mk   | 5 ++---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/guile/Config.in b/package/guile/Config.in
index c26c296e47..b1182a4cee 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_GUILE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_BDWGC
-	select BR2_PACKAGE_LIBTOOL
 	help
 	  Guile is an interpreter and compiler for the Scheme
 	  programming language, a clean and elegant dialect of Lisp.
diff --git a/package/guile/guile.hash b/package/guile/guile.hash
index a163f59fce..c2719fa7f2 100644
--- a/package/guile/guile.hash
+++ b/package/guile/guile.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  6b7947dc2e3d115983846a268b8f5753c12fd5547e42fbf2b97d75a3b79f0d31  guile-3.0.4.tar.xz
+sha256  f57d86c70620271bfceb7a9be0c81744a033f08adc7ceba832c9917ab3e691b7  guile-3.0.7.tar.xz
 # Locally computed
 sha256  b51c6f20e6d029cb5b3e5bf235ac562c9a188c5bdc4ffcdc663897772d6e0260  LICENSE
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index b62d06e704..c74325252f 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUILE_VERSION = 3.0.4
+GUILE_VERSION = 3.0.7
 GUILE_SOURCE = guile-$(GUILE_VERSION).tar.xz
 GUILE_SITE = $(BR2_GNU_MIRROR)/guile
 GUILE_INSTALL_STAGING = YES
@@ -15,8 +15,7 @@ GUILE_LICENSE = LGPL-3.0+
 GUILE_LICENSE_FILES = LICENSE COPYING COPYING.LESSER
 GUILE_CPE_ID_VENDOR = gnu
 
-# libtool dependency is needed because guile uses libltdl
-GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf libtool
+GUILE_DEPENDENCIES = host-guile libunistring libffi gmp bdwgc host-pkgconf
 HOST_GUILE_DEPENDENCIES = host-libunistring host-libffi host-gmp host-bdwgc host-flex host-pkgconf host-gettext
 
 # The HAVE_GC* CFLAGS specify that we will use internal callbacks
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
