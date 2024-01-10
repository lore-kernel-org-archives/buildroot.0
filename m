Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C55C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4315435DF;
	Wed, 10 Jan 2024 21:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4315435DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOMlwfREqH1t; Wed, 10 Jan 2024 21:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9568143744;
	Wed, 10 Jan 2024 21:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9568143744
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27C311BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F220E4226E
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F220E4226E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id We12UnwKIG-C for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:12:27 +0000 (UTC)
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 209BA42258
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 209BA42258
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Nfs8rVGdOnb7jNfs8rhRsu; Wed, 10 Jan 2024 22:12:24 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:12:21 +0100
Message-Id: <20240110211223.791548-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJCNQuiw48y4aCsbOT02MhBJdrN1x+dbShA0N4DiFAiErFLSX0rNCu60pAkS9No4qSOuFEiNhaC65NOi5PdXfNXCouHjh6XtDWep8Ucn0rkBkXoI8ZIg
 JFIrFBesJQpT6pP418lr2VwNCLLXtVUYJ5f4PsdaYx29KtToZD5hkT7EUTNsc24LyvwbG8OM4BvVEiG9xbcot3pb/APme9Cbg3dDM0P1CQycXJnU94SIWOEV
 aS6pNZCJdI/Mr6d5dCpZxJzWe/GBSdqptLYKYndn85yM6DJ0PKj3mVEhvX8085f/D/KIGNGFFenNZ24VgYa4sfQscRpkRXkwwCkTR+4BxPu0e8o6KGdGb6Lb
 1PzAcoHp
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1704921145; bh=AmskFylcX7GUrSjVsq6a/gNN3YEGoTb2vMJ4dHeDZQo=;
 h=From:To:Subject:Date:MIME-Version;
 b=J057mL0aZ7OP/FkAtVgfLgJNHj6/52QhQ0i2VO+iqctt8CJLUAZL3zgXAOY85R0TQ
 JlyD1bwh7hdtl+xsY+7btbr961hjLxzj9/MNbZTLS/sDUvqutiURt4bwOAbXvS+qo9
 tHvfSQjjPuBQMj3X/oXrWWHjgu2z9Cy7JBcsTfXHG7xVCVqpTp7JZPLvLh5CUF+GfU
 MazqHaELSaP3Ssn042ha3wETsiRQLCU+K37ar1orlRsNslk0KnDy/PuQ+zwLjJOK3r
 QlmRWdwyZgqRCLJDFiUdaAZU/IQqe3gD+grmQ41ZKM421rWl8AqQ+voo8T8jWuCZBo
 XKaMEBp7ri1kg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=J057mL0a
Subject: [Buildroot] [PATCH v2 1/3] package/libtracefs: bump to version 1.8.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's drop local patch thas has been upstreamed but another one to fix
linking failure due to meson and Makefile unalignment. Also, now libtracefs
samples require pthread, but we don't want samples to be built to save
target size and reduce dependencies counot, so let's disable it by setting
meson samples variable to false in LIBTRACEFS_CONF_OPTS.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add patch
---
 ...-add-option-to-disable-documentation.patch | 51 -------------------
 ...-meson-build-tracefs-mmap-by-default.patch | 30 +++++++++++
 package/libtracefs/libtracefs.hash            |  2 +-
 package/libtracefs/libtracefs.mk              |  5 +-
 4 files changed, 34 insertions(+), 54 deletions(-)
 delete mode 100644 package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch
 create mode 100644 package/libtracefs/0001-libtracefs-meson-build-tracefs-mmap-by-default.patch

diff --git a/package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch b/package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch
deleted file mode 100644
index 70e7e61310..0000000000
--- a/package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 881e23ed774360f93ca81f820d7897bd9bbd6d63 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sat, 30 Sep 2023 22:40:08 +0200
-Subject: [PATCH] libtracefs: add option to disable documentation
-
-On some Linux environment builder(i.e. Buildroot) host asciidoc is not
-provided since by default all man/docs are not installed to target but
-meson.build at the moment build ascii and html documentation and
-requires asciidoc making the building to fail. So let's add doc option
-set to true by default to let the user to override it and not produce
-the documentation.
-
-Upstream: https://patchwork.kernel.org/project/linux-trace-devel/patch/20230930204008.2528607-1-giulio.benetti@benettiengineering.com/
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- meson.build       | 3 +++
- meson_options.txt | 2 ++
- 2 files changed, 5 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index 9d42d78..f1e492e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -39,6 +39,8 @@ if cunit_dep.found()
-     subdir('utest')
- endif
- subdir('samples')
-+
-+if get_option('doc')
- subdir('Documentation')
-
- custom_target(
-@@ -46,3 +48,4 @@ custom_target(
-     output: 'docs',
-     depends: [html, man],
-     command: ['echo'])
-+endif
-diff --git a/meson_options.txt b/meson_options.txt
-index 1d92c28..5533a88 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -14,3 +14,5 @@ option('man-bold-literal', type : 'boolean', value : false,
-        description : 'enable bold literals')
- option('docbook-suppress-sp', type : 'boolean', value : false,
-        description : 'docbook suppress sp')
-+option('doc', type : 'boolean', value: true,
-+       description : 'produce documentation')
---
-2.34.1
-
diff --git a/package/libtracefs/0001-libtracefs-meson-build-tracefs-mmap-by-default.patch b/package/libtracefs/0001-libtracefs-meson-build-tracefs-mmap-by-default.patch
new file mode 100644
index 0000000000..caa8b1a05e
--- /dev/null
+++ b/package/libtracefs/0001-libtracefs-meson-build-tracefs-mmap-by-default.patch
@@ -0,0 +1,30 @@
+From 2ff02ff91b5dc81b7cc253f88c9fce15664daeba Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 10 Jan 2024 21:38:51 +0100
+Subject: [PATCH] libtracefs meson: build tracefs-mmap by default
+
+Accordingly to Makefile let's add tracefs-mmap.c to build, this is needed
+for linking by other object files.
+
+Upstream: https://patchwork.kernel.org/project/linux-trace-devel/patch/20240110203925.266999-1-giulio.benetti@benettiengineering.com/
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/meson.build b/src/meson.build
+index 5b76554..f7a98b9 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -11,6 +11,7 @@ sources= [
+    'tracefs-instance.c',
+    'tracefs-kprobes.c',
+    'tracefs-marker.c',
++   'tracefs-mmap.c',
+    'tracefs-record.c',
+    'tracefs-sqlhist.c',
+    'tracefs-tools.c',
+-- 
+2.34.1
+
diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
index 040467af08..ebc562eb40 100644
--- a/package/libtracefs/libtracefs.hash
+++ b/package/libtracefs/libtracefs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  411fcbf3434ecbaefa6c2b1bf092266293a672e2d7ee46fdd6b402753cb8bd16  libtracefs-1.7.0.tar.gz
+sha256  f92475d5c4cb509983697fb359ee615bef4f08ed8bdc9c690f6118ba68886de0  libtracefs-1.8.0.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index 1e6e19a234..ed45fcbc50 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEFS_VERSION = 1.7.0
+LIBTRACEFS_VERSION = 1.8.0
 LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
 LIBTRACEFS_INSTALL_STAGING = YES
 LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
@@ -13,6 +13,7 @@ LIBTRACEFS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
 LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
 
 LIBTRACEFS_CONF_OPTS = \
-	-Ddoc=false
+	-Ddoc=false \
+	-Dsamples=false
 
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
