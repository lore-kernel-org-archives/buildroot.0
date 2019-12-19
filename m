From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Dec 2019 18:08:05 +0100
Subject: [Buildroot] [git commit] package/tcping: bump to version 1.3.6
Message-ID: <20191219170213.04A818CA5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9758b8a203fcc95314c4b4096f76b383725e05d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched to latest version on GitHub as linuxco.de is no longer
active. The appropriate entry for tcping on release-monitoring.org
has been updated and a new mapping has been added for the Buildroot
project.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tcping/Config.in   | 2 +-
 package/tcping/tcping.hash | 5 +++--
 package/tcping/tcping.mk   | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/tcping/Config.in b/package/tcping/Config.in
index e72df096c3..c963e681de 100644
--- a/package/tcping/Config.in
+++ b/package/tcping/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_TCPING
 	  desired port is reachable and then start connection
 	  establishment.
 
-	  http://linuxco.de/tcping/tcping.html
+	  https://github.com/mkirchner/tcping
diff --git a/package/tcping/tcping.hash b/package/tcping/tcping.hash
index de42775cc1..49f6e5ba0b 100644
--- a/package/tcping/tcping.hash
+++ b/package/tcping/tcping.hash
@@ -1,2 +1,3 @@
-# Locally calculated after checking pgp signature
-sha256	1ad52e904094d12b225ac4a0bc75297555e931c11a1501445faa548ff5ecdbd0	tcping-1.3.5.tar.gz
+# Locally calculated
+sha256	a731f0e48ff931d7b2a0e896e4db40867043740fe901dd225780f2164fdbdcf3	tcping-1.3.6.tar.gz
+sha256	4a35620e27ddb8de27898e4206c8f93633d877c1e128e98e95a035f760d94428	LICENSE
diff --git a/package/tcping/tcping.mk b/package/tcping/tcping.mk
index 7edf45ebba..5eaf702ef0 100644
--- a/package/tcping/tcping.mk
+++ b/package/tcping/tcping.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TCPING_VERSION = 1.3.5
-TCPING_SITE = http://linuxco.de/tcping
-TCPING_LICENSE = GPL-3.0+
+TCPING_VERSION = 1.3.6
+TCPING_SITE = $(call github,mkirchner,tcping,$(TCPING_VERSION))
+TCPING_LICENSE = MIT
 TCPING_LICENSE_FILES = LICENSE
 
 define TCPING_BUILD_CMDS
