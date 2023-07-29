Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86185C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 11:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED3F783AD2;
	Sat, 29 Jul 2023 11:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED3F783AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_i74fmokFxh; Sat, 29 Jul 2023 11:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA2683AD9;
	Sat, 29 Jul 2023 11:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EA2683AD9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 185C81BF82C
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 11:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5AE983AD9
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 11:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5AE983AD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MDxYIn6CQNS for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 11:56:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E338583AC0
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 11:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E338583AC0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAC8C83AE1; Sat, 29 Jul 2023 11:56:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 11:04:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2440b1a37e9dd886e1d74c1fc16d42b4cc8093b3
X-Git-Newrev: 3ac61eb9da891b791d47166929226ea73aa1c11f
X-Patchwork-Hint: ignore
Message-Id: <20230729115651.CAC8C83AE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: bump
 version to 1.76.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ac61eb9da891b791d47166929226ea73aa1c11f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gobject-introspection/0001-disable-tests.patch                | 2 +-
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch | 2 +-
 package/gobject-introspection/gobject-introspection.hash              | 4 ++--
 package/gobject-introspection/gobject-introspection.mk                | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gobject-introspection/0001-disable-tests.patch b/package/gobject-introspection/0001-disable-tests.patch
index 390707c10a..8de216c039 100644
--- a/package/gobject-introspection/0001-disable-tests.patch
+++ b/package/gobject-introspection/0001-disable-tests.patch
@@ -16,7 +16,7 @@ diff --git a/meson.build b/meson.build
 index c2cb577f..65ce7adf 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -232,12 +232,6 @@ else
+@@ -237,12 +237,6 @@ else
  endif
  subdir('docs')
  
diff --git a/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch b/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
index e21da42ce7..a8cf332f21 100644
--- a/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
+++ b/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
@@ -15,7 +15,7 @@ diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
 index cb97e76f..d29b28c8 100644
 --- a/giscanner/ccompiler.py
 +++ b/giscanner/ccompiler.py
-@@ -231,6 +231,8 @@ class CCompiler(object):
+@@ -266,6 +266,8 @@ class CCompiler(object):
  
          for envvar in runtime_path_envvar:
              if envvar in os.environ:
diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 0db5072c3b..063b96275d 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gobject-introspection/1.74/gobject-introspection-1.74.0.sha256sum
-sha256  347b3a719e68ba4c69ff2d57ee2689233ea8c07fc492205e573386779e42d653  gobject-introspection-1.74.0.tar.xz
+# From https://download.gnome.org/sources/gobject-introspection/1.76/gobject-introspection-1.76.1.sha256sum
+sha256  196178bf64345501dcdc4d8469b36aa6fe80489354efe71cb7cb8ab82a3738bf  gobject-introspection-1.76.1.tar.xz
 sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
 sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
 sha256  23f82cbc9808cdd8e902df38271434040ce0562ca382ac2a96f5e3bf807b6d31  giscanner/scannerlexer.l
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 9131e1eb73..f0c7fcd2ca 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.74
-GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.76
+GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).1
 GOBJECT_INTROSPECTION_SITE = https://download.gnome.org/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
 GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
