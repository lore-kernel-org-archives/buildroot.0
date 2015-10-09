From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:26:08 +0200
Subject: [Buildroot] [git commit] picocom: bump to version 2.0
Message-ID: <20151009132700.F1FD881F52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbc4463d10d3875eb344a497db097205ce63eced
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump to version 2.0
- Switch the download site to GitHub
- Apply an upstream patch to fix a missing define
- Add a hash file
- Rewrap the help text to 72 characters length
- Change the official website

[Thomas: fix s/MAKE_ENV/TARGET_MAKE_ENV/.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/picocom/Config.in    |    7 +++----
 package/picocom/picocom.hash |    3 +++
 package/picocom/picocom.mk   |    7 ++++---
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/picocom/Config.in b/package/picocom/Config.in
index 5a7d583..671d01f 100644
--- a/package/picocom/Config.in
+++ b/package/picocom/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_PICOCOM
 	bool "picocom"
 	depends on BR2_USE_MMU # fork()
 	help
-	  picocom is a minimal dumb-terminal emulation program. It
-	  is, in principle, very much like minicom, only it's pico
-	  instead of mini!
+	  picocom is a minimal dumb-terminal emulation program. It is, in
+	  principle, very much like minicom, only it's pico instead of mini!
 
-	  http://code.google.com/p/picocom/
+	  https://github.com/npat-efault/picocom/
diff --git a/package/picocom/picocom.hash b/package/picocom/picocom.hash
new file mode 100644
index 0000000..7eada03
--- /dev/null
+++ b/package/picocom/picocom.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 e0f7095c118f43c1c09787a16ef5c7d4c4ad4457dd3b1281efcc4cdb8906af9a  picocom-2.0.tar.gz
+sha256 37746613c05ecf4058c989ef7042b85ef0308886f3731a9dfffdadd19cc9ecfb  2c4c2317592daac97aac6669fd7b68e07a3dbec6.patch
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index 7858d2b..106de94 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PICOCOM_VERSION = 1.7
-PICOCOM_SITE = http://picocom.googlecode.com/files
+PICOCOM_VERSION = 2.0
+PICOCOM_SITE = $(call github,npat-efault,picocom,$(PICOCOM_VERSION))
 PICOCOM_LICENSE = GPLv2+
 PICOCOM_LICENSE_FILES = LICENSE.txt
+PICOCOM_PATCH = https://github.com/npat-efault/picocom/commit/2c4c2317592daac97aac6669fd7b68e07a3dbec6.patch
 
 define PICOCOM_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 define PICOCOM_INSTALL_TARGET_CMDS
