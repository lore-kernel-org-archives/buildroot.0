Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CCBE78482
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 18:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39054820FE;
	Sun,  1 Oct 2023 18:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39054820FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BrxgZgOWGbYv; Sun,  1 Oct 2023 18:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FF2C82161;
	Sun,  1 Oct 2023 18:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FF2C82161
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D71D91BF8A8
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2CE960C0C
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 18:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2CE960C0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id reX4Z3OND5vG for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 18:48:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B326F60670
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 18:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B326F60670
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A387183F4D; Sun,  1 Oct 2023 18:48:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 20:27:18 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: eb907f77646ab337e79c9d6ddedb29937ce8c26a
X-Git-Newrev: 59989e79d6ccc1bafe2d64a70a31a6360c4e5817
X-Patchwork-Hint: ignore
Message-Id: <20231001184812.A387183F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/suricata:
 security bump to version 6.0.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=59989e79d6ccc1bafe2d64a70a31a6360c4e5817
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- Fix CVE-2023-35852: In Suricata before 6.0.13 (when there is an
  adversary who controls an external source of rules), a dataset
  filename, that comes from a rule, may trigger absolute or relative
  directory traversal, and lead to write access to a local filesystem.
  This is addressed in 6.0.13 by requiring allow-absolute-filenames and
  allow-write (in the datasets rules configuration section) if an
  installation requires traversal/writing in this situation.
- Fix CVE-2023-35853: In Suricata before 6.0.13, an adversary who
  controls an external source of Lua rules may be able to execute Lua
  code. This is addressed in 6.0.13 by disabling Lua unless allow-rules
  is true in the security lua configuration section.
- Drop first patch (not needed since
  https://github.com/OISF/suricata/commit/c8a3aa608eaae1acbaf33dba8a7c1a3cbfeb4285)

https://github.com/OISF/suricata/blob/suricata-6.0.14/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ce17f93e828a07292e03653be04a49480250f23f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-allow-the-user-to-override-RUST_TARGET.patch} |  0
 ...n-ensure-proper-shabang-on-python-scripts.patch | 47 ----------------------
 package/suricata/suricata.hash                     |  2 +-
 package/suricata/suricata.mk                       |  5 +--
 4 files changed, 3 insertions(+), 51 deletions(-)

diff --git a/package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch b/package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
similarity index 100%
rename from package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
rename to package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
diff --git a/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch b/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
deleted file mode 100644
index 424b30d317..0000000000
--- a/package/suricata/0001-python-ensure-proper-shabang-on-python-scripts.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 44fe2328b715db25134ee095526d2fa47e6cd834 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Wed, 1 Jan 2020 15:25:57 +0100
-Subject: [PATCH] python: ensure proper shabang on python scripts
-
-When instlling python scripts, distutils would use the python used to
-run setup.py as shabang for the scripts it installs.
-
-However, when cross-compiling, this is most often not correct.
-
-Instead, using '/usr/bin/env python' is guaranteed to find the proper
-python in the PATH, so we need to instruct setyup.py to use that as the
-executable.
-
-[yann.morin.1998@free.fr:
-  - author did not provide their SoB, but it's simple enough to
-    not require it for once
-  - provide proper commit log
-]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-[Fabrice: update for 6.0.0]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- python/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 59d195f29..a41604f72 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -6,11 +6,11 @@ EXTRA_DIST =	setup.py \
- if HAVE_PYTHON_DISTUTILS
- all-local:
- 	cd $(srcdir) && \
--		$(HAVE_PYTHON) setup.py build --build-base "$(abs_builddir)"
-+		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base "$(abs_builddir)"
- 
- install-exec-local:
- 	cd $(srcdir) && \
--		$(HAVE_PYTHON) setup.py build --build-base "$(abs_builddir)" \
-+		$(HAVE_PYTHON) setup.py build -e "/usr/bin/env python" --build-base "$(abs_builddir)" \
- 		install --prefix $(DESTDIR)$(prefix)
- 
- uninstall-local:
--- 
-2.20.1
-
diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 38ab5e9cd3..49341984a2 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  00173634fa76aee636e38a90b1c02616c903e42173107d47b4114960b5fbe839  suricata-6.0.6.tar.gz
+sha256  cfa93de900d0fd8ba67c79fddec58fb7afb8f6c45b0773040035a15407b796ce  suricata-6.0.14.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 72b72cc94d..2aa5a0c5ed 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.6
+SURICATA_VERSION = 6.0.14
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
 SURICATA_CPE_ID_VENDOR = oisf
-# 0001-python-ensure-proper-shabang-on-python-scripts.patch
-# 0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
+# 0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
 SURICATA_AUTORECONF = YES
 
 SURICATA_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
