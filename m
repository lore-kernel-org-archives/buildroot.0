From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Nov 2016 22:36:00 +0100
Subject: [Buildroot] [git commit] jasper: bump version to 1.900.31 (security)
Message-ID: <20161129223029.8AB25802C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97f8aa4005be8456af52cacd5cfb4b077e55b5fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed CVEs:
 - CVE-2016-9387
 - CVE-2016-9388
 - CVE-2016-9389
 - CVE-2016-9390
 - CVE-2016-9391
 - CVE-2016-9392
 - CVE-2016-9393
 - CVE-2016-9394
 - CVE-2016-9395
 - CVE-2016-9396
 - CVE-2016-9397
 - CVE-2016-9398
 - CVE-2016-9399
 - CVE-2016-9557
 - CVE-2016-9560

Changes to jasper.mk:
 - Switched site method to GitHub. 1.900.31 is not released as a tarball
   in the official website.
 - Autoreconf necessary since there isn't any configure script. We need
   to generate it.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index fdadbb2..64ddfa4 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	6c942ae79108cd6a359e5bc34ea03565bd33ac20f6814cb09c4f92298b6b1cb8	jasper-1.900.22.tar.gz
+sha256 0099084dce9fa0a318b48a5ed2a12ac7cff3324f3fd4459833e6fe2ff583fb2c  jasper-version-1.900.31.tar.gz
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index bacb1a6..e8b8aaa 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,12 +4,16 @@
 #
 ################################################################################
 
-JASPER_VERSION = 1.900.22
-JASPER_SITE = http://www.ece.uvic.ca/~frodo/jasper/software
+JASPER_VERSION = version-1.900.31
+JASPER_SITE = $(call github,mdadams,jasper,$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_DEPENDENCIES = jpeg
 JASPER_LICENSE = JasPer License Version 2.0
 JASPER_LICENSE_FILES = LICENSE
+
+# No configure script included. We need to generate it.
+JASPER_AUTORECONF = YES
+
 JASPER_CONF_OPTS = --disable-strict
 
 # Xtensa gcc is unable to generate correct code with -O0 enabled by
