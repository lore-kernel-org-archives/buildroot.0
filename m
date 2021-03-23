From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Mar 2021 23:13:41 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/zstd: security
 bump to version 1.4.9
Message-ID: <20210323215015.3062E81173@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc415fd41710d378933ea47e50a9bcd4744ac946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix CVE-2021-24032: Beginning in v1.4.1 and prior to v1.4.9, due to an
incomplete fix for CVE-2021-24031, the Zstandard command-line utility
created output files with default permissions and restricted those
permissions immediately afterwards. Output files could therefore
momentarily be readable or writable to unintended parties.

https://github.com/facebook/zstd/releases/tag/v1.4.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 74ed1b5ca09ac02a354245dc662d4cd8d11727e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zstd/zstd.hash | 4 ++--
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index c370bf8c46..a979501e5f 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
-# From https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz.sha256
-sha256  32478297ca1500211008d596276f5367c54198495cf677e9439f4791a4c69f24  zstd-1.4.8.tar.gz
+# From https://github.com/facebook/zstd/releases/download/v1.4.9/zstd-1.4.9.tar.gz.sha256
+sha256  29ac74e19ea28659017361976240c4b5c5c24db3b89338731a6feb97c038d293  zstd-1.4.9.tar.gz
 
 # License files (locally computed)
 sha256  2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b  LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index e26e67f46b..fcfbe8c6d5 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = 1.4.8
+ZSTD_VERSION = 1.4.9
 ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
