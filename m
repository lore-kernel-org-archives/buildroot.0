Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8448CC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 09:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F374C6079C;
	Sat,  1 Jun 2024 09:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LHMlAuOL1B6; Sat,  1 Jun 2024 09:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CE46605AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CE46605AE;
	Sat,  1 Jun 2024 09:37:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D1E81BF841
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 09:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1631760598
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 09:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8s1AFpU597GP for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 09:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95895605A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95895605A2
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 09:37:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4198C877A3; Sat,  1 Jun 2024 09:37:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jun 2024 11:34:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cf9cd968a3a6a01fe72fae01bb6ea0dcccf9795f
X-Git-Newrev: 42fad03182ed53de8003b66d50e893f42b72145e
X-Patchwork-Hint: ignore
Message-Id: <20240601093750.4198C877A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] packages: bump skalibs-related
 packages
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
Content-Type: multipart/mixed; boundary="===============6515710309504142084=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6515710309504142084==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=42fad03182ed53de8003b66d50e893f42b72145e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update all skarnet.org packages to their current upstream version:
  - execline
  - mdevd
  - s6
  - s6-dns
  - s6-linux-init
  - s6-linux-utils
  - s6-networking
  - s6-portable-utils
  - s6-rc
  - skalibs

This patch(set) updates the packages from skarnet.org. It is one commit
to avoid build failures due to incompatible versions: for example, when
only skalibs are updated, execline fails to build; conversely, bumping
execline before skalibs also yields build failures.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
[yann.morin.1998@free.fr:
  - cleanup commit title
  - reword commit log
  - include explanations why all bumps are done at once
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 package/execline/execline.hash                     |  4 +--
 package/execline/execline.mk                       |  4 +--
 package/mdevd/mdevd.hash                           |  4 +--
 package/mdevd/mdevd.mk                             |  4 +--
 package/s6-dns/s6-dns.hash                         |  4 +--
 package/s6-dns/s6-dns.mk                           |  4 +--
 package/s6-linux-init/s6-linux-init.hash           |  4 +--
 package/s6-linux-init/s6-linux-init.mk             |  4 +--
 ...inux-utils-rngseed.c-fix-build-with-glibc.patch | 39 ----------------------
 package/s6-linux-utils/s6-linux-utils.hash         |  4 +--
 package/s6-linux-utils/s6-linux-utils.mk           |  4 +--
 package/s6-networking/s6-networking.hash           |  4 +--
 package/s6-networking/s6-networking.mk             |  4 +--
 package/s6-portable-utils/s6-portable-utils.hash   |  4 +--
 package/s6-portable-utils/s6-portable-utils.mk     |  4 +--
 package/s6-rc/s6-rc.hash                           |  4 +--
 package/s6-rc/s6-rc.mk                             |  4 +--
 package/s6/s6.hash                                 |  4 +--
 package/s6/s6.mk                                   |  4 +--
 package/skalibs/skalibs.hash                       |  4 +--
 package/skalibs/skalibs.mk                         |  4 +--
 22 files changed, 40 insertions(+), 80 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 543b6f33cf..8345b6db95 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1379,7 +1379,6 @@ package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
 package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/s6-linux-init/0001-configure-add-D_GNU_SOURCE.patch lib_patch.Upstream
-package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch lib_patch.Upstream
 package/safeclib/0001-fix-armv7-asm-inline-error-GH-115.patch lib_patch.Upstream
 package/samba4/0001-libreplace-disable-libbsd-support.patch lib_patch.Upstream
 package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch lib_patch.Upstream
diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 1d72e2cb49..3f9ff8a138 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  01260fcaf80ffbca2a94aa55ea474dfb9e39b3033b55c8af88126791879531f6  execline-2.9.0.1.tar.gz
-sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
+sha256  df750035d0fb21c7265bffb7ed7e1b661de1e842944a2252bdcddc32d0d97217  execline-2.9.5.1.tar.gz
+sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 38f4570ba4..842ded6b88 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.9.0.1
-EXECLINE_SITE = http://skarnet.org/software/execline
+EXECLINE_VERSION = 2.9.5.1
+EXECLINE_SITE = https://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
 EXECLINE_INSTALL_STAGING = YES
diff --git a/package/mdevd/mdevd.hash b/package/mdevd/mdevd.hash
index dea2f14978..9436ed8b01 100644
--- a/package/mdevd/mdevd.hash
+++ b/package/mdevd/mdevd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  33cf2b118634538fd24f302b30f52cc8aa28ea68b414916ce482b54a4ee57283  mdevd-0.1.6.0.tar.gz
-sha256  7fe938b5e0fec18848955ca8081c532e24ae77310beb730b301e1f77bad3d390  COPYING
+sha256  f6ecf0ef7cd48d04efc75acb2dad967d850bc8815bdb0098f1c9ef043394d430  mdevd-0.1.6.3.tar.gz
+sha256  b2edd59a202a710440522f05dcbf418b0493540120efcb407876772ee42d2c7c  COPYING
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index 9997cb5275..c92659d961 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MDEVD_VERSION = 0.1.6.0
-MDEVD_SITE = http://skarnet.org/software/mdevd
+MDEVD_VERSION = 0.1.6.3
+MDEVD_SITE = https://skarnet.org/software/mdevd
 MDEVD_LICENSE = ISC
 MDEVD_LICENSE_FILES = COPYING
 MDEVD_INSTALL_STAGING = YES
diff --git a/package/s6-dns/s6-dns.hash b/package/s6-dns/s6-dns.hash
index 5083024520..334ea1667c 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  76af222472c4754f83cdc59ad354255ce1b1e6f6833a059328463f8e51f4db43  s6-dns-2.3.5.4.tar.gz
-sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
+sha256  cf0258574ec7d62b654e0c2ad78af4c7d67ac4c9cb37f781480f597e54b30f6d  s6-dns-2.3.7.1.tar.gz
+sha256  aafa4f6a12b5b24ab2ae8ead5174e1ec03aecb5eb0e82012d74fd47ccfc57607  COPYING
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index 1b7d65570f..a848f2e6c0 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-S6_DNS_VERSION = 2.3.5.4
-S6_DNS_SITE = http://skarnet.org/software/s6-dns
+S6_DNS_VERSION = 2.3.7.1
+S6_DNS_SITE = https://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING
 S6_DNS_INSTALL_STAGING = YES
diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
index f70a4f87b5..25292c35b2 100644
--- a/package/s6-linux-init/s6-linux-init.hash
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  92055a7964cf66604066ad964a2c2392ee7c5e64821be03146c1341e0d8c3dc6  s6-linux-init-1.0.8.0.tar.gz
-sha256  1898df1e8703bd9c1350d2ec3397880b9b4c1451038a9ce5e1c4b2e58622da39  COPYING
+sha256  11ae08d0a66210b5e56b6baee0f6b9b1b69fbedb05fda1285b115a31ca46c77f  s6-linux-init-1.1.2.0.tar.gz
+sha256  f68451e55e6686dc187df1ca427c574d9ac0d6f6926e1bdb909ad8b657668fe5  COPYING
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index 6aec220de4..ae2bcdb8d8 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-S6_LINUX_INIT_VERSION = 1.0.8.0
-S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
+S6_LINUX_INIT_VERSION = 1.1.2.0
+S6_LINUX_INIT_SITE = https://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
 S6_LINUX_INIT_DEPENDENCIES = s6 s6-linux-utils s6-portable-utils
diff --git a/package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch b/package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch
deleted file mode 100644
index 2df8a99700..0000000000
--- a/package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3ab8bdc1c657f91a2a96f4e6db308d17098de0c4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 23 Feb 2023 12:09:11 +0100
-Subject: [PATCH] src/s6-linux-utils/rngseed.c: fix build with glibc <
-
-getrandom and sys/random.h are only available since glibc 2.25 resulting
-in the following build failure since version 2.6.0.0 and
-https://github.com/skarnet/s6-linux-utils/commit/ad5973028c42d947440cdae5e4f106152c3dda28:
-
-src/minutils/rngseed.c:15:24: fatal error: sys/random.h: No such file or directory
- #include <sys/random.h>
-                        ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/214bcecfc389cb412b68627c831300478d614a3a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/skarnet/s6-linux-utils/pull/2]
----
- src/s6-linux-utils/rngseed.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/minutils/rngseed.c b/src/minutils/rngseed.c
-index 2b1772c..223f50a 100644
---- a/src/minutils/rngseed.c
-+++ b/src/minutils/rngseed.c
-@@ -12,7 +12,9 @@
- #include <unistd.h>
- #include <sys/stat.h>
- #include <sys/ioctl.h>
-+#ifdef SKALIBS_HASGETRANDOM
- #include <sys/random.h>
-+#endif
- #include <linux/random.h>
- 
- #include <skalibs/types.h>
--- 
-2.39.1
-
diff --git a/package/s6-linux-utils/s6-linux-utils.hash b/package/s6-linux-utils/s6-linux-utils.hash
index c932a4363a..97a67c674e 100644
--- a/package/s6-linux-utils/s6-linux-utils.hash
+++ b/package/s6-linux-utils/s6-linux-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  6c7132734a0c8287002ee6910c469f175a97d766a8023c0c33af8ba92643ed59  s6-linux-utils-2.6.0.0.tar.gz
-sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
+sha256  8f944633ca87d3d23e0f03c9c383d1502d508c9bac16d38c3fbf723a5eab2bb7  s6-linux-utils-2.6.2.0.tar.gz
+sha256  aafa4f6a12b5b24ab2ae8ead5174e1ec03aecb5eb0e82012d74fd47ccfc57607  COPYING
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index ffa3ffac5b..f83f47ac3e 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-S6_LINUX_UTILS_VERSION = 2.6.0.0
-S6_LINUX_UTILS_SITE = http://skarnet.org/software/s6-linux-utils
+S6_LINUX_UTILS_VERSION = 2.6.2.0
+S6_LINUX_UTILS_SITE = https://skarnet.org/software/s6-linux-utils
 S6_LINUX_UTILS_LICENSE = ISC
 S6_LINUX_UTILS_LICENSE_FILES = COPYING
 S6_LINUX_UTILS_DEPENDENCIES = skalibs
diff --git a/package/s6-networking/s6-networking.hash b/package/s6-networking/s6-networking.hash
index 1890f95221..df65274b3d 100644
--- a/package/s6-networking/s6-networking.hash
+++ b/package/s6-networking/s6-networking.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  7ac79d4de3d9c13532e444ab7497c4e04ad0fa7229d502984d9dc7d48aa64418  s6-networking-2.5.1.1.tar.gz
-sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
+sha256  c33c6f1b2be16f89a21af946cfd06242a12f98184c898b755ddb24338671ceb1  s6-networking-2.7.0.2.tar.gz
+sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index f740f22635..239d8a679e 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-S6_NETWORKING_VERSION = 2.5.1.1
-S6_NETWORKING_SITE = http://skarnet.org/software/s6-networking
+S6_NETWORKING_VERSION = 2.7.0.2
+S6_NETWORKING_SITE = https://skarnet.org/software/s6-networking
 S6_NETWORKING_LICENSE = ISC
 S6_NETWORKING_LICENSE_FILES = COPYING
 S6_NETWORKING_INSTALL_STAGING = YES
diff --git a/package/s6-portable-utils/s6-portable-utils.hash b/package/s6-portable-utils/s6-portable-utils.hash
index aa38c8b5da..2454e91a4d 100644
--- a/package/s6-portable-utils/s6-portable-utils.hash
+++ b/package/s6-portable-utils/s6-portable-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ebb39f8934fd36f25d31352e61bbd94dc02b1e9f04411850d2fd9658bd916e36  s6-portable-utils-2.2.5.0.tar.gz
-sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
+sha256  3e4492055d160c25fb90153f0efc277d7d52bf981bbe3ea2e9dfe51c493561ff  s6-portable-utils-2.3.0.3.tar.gz
+sha256  aafa4f6a12b5b24ab2ae8ead5174e1ec03aecb5eb0e82012d74fd47ccfc57607  COPYING
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
index 8cdb4fa965..c40100b06c 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-S6_PORTABLE_UTILS_VERSION = 2.2.5.0
-S6_PORTABLE_UTILS_SITE = http://skarnet.org/software/s6-portable-utils
+S6_PORTABLE_UTILS_VERSION = 2.3.0.3
+S6_PORTABLE_UTILS_SITE = https://skarnet.org/software/s6-portable-utils
 S6_PORTABLE_UTILS_LICENSE = ISC
 S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
 S6_PORTABLE_UTILS_DEPENDENCIES = skalibs
diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index 0a84345e36..a09c08ba3c 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  4f24a4966a4aa353d2bd1a8afca9b88c7b7bd29c46b3a1a7f5305686b9d6e038  s6-rc-0.5.3.2.tar.gz
-sha256  1898df1e8703bd9c1350d2ec3397880b9b4c1451038a9ce5e1c4b2e58622da39  COPYING
+sha256  00bdfa596fa7161512e972ec9282a2abd8fd0e31f09177bad7a2bc3d8f283982  s6-rc-0.5.4.2.tar.gz
+sha256  f68451e55e6686dc187df1ca427c574d9ac0d6f6926e1bdb909ad8b657668fe5  COPYING
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 85b047883b..61090c9a27 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.5.3.2
-S6_RC_SITE = http://skarnet.org/software/s6-rc
+S6_RC_VERSION = 0.5.4.2
+S6_RC_SITE = https://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
 S6_RC_INSTALL_STAGING = YES
diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 3c5ce4265a..fb5e74e403 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  6c1474be3e889dac392cee307abe015cd4be0c85c725c84ea7f184f0e34503a2  s6-2.11.1.2.tar.gz
-sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
+sha256  c95d51787602e0c8c8e4f92a710cbdaa4ee797ee886e71342727e2974f95c06b  s6-2.12.0.4.tar.gz
+sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 78962ed159..fb4910e28b 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-S6_VERSION = 2.11.1.2
-S6_SITE = http://skarnet.org/software/s6
+S6_VERSION = 2.12.0.4
+S6_SITE = https://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
 S6_INSTALL_STAGING = YES
diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index dd202b97fb..d871ee6503 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  3e228f72f18d88c17f6c4e0a66881d6d3779427b7e7e889f3142b6f26da30285  skalibs-2.12.0.1.tar.gz
-sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
+sha256  b6b79b816f4ba0b6801676b0ed4179b59c8c7809eeffe26db672e404636befc3  skalibs-2.14.1.1.tar.gz
+sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 0ff449a5ba..67e3c694fc 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.12.0.1
-SKALIBS_SITE = http://skarnet.org/software/skalibs
+SKALIBS_VERSION = 2.14.1.1
+SKALIBS_SITE = https://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
 SKALIBS_INSTALL_STAGING = YES

--===============6515710309504142084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6515710309504142084==--
