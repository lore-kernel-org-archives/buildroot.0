From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 12:53:16 +0200
Subject: [Buildroot] [git commit] package/libilbc: new package
Message-ID: <20150901083108.80F4D7F95A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=838af7ac04d60c5deb4c91401a6c69fa1165c6e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/libilbc/Config.in  |    7 +++++++
 package/libilbc/libilbc.mk |   15 +++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index eb4215d..d9dfb34 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -702,6 +702,7 @@ menu "Audio/Sound"
 	source "package/libcuefile/Config.in"
 	source "package/libg7221/Config.in"
 	source "package/libid3tag/Config.in"
+	source "package/libilbc/Config.in"
 	source "package/liblo/Config.in"
 	source "package/libmad/Config.in"
 	source "package/libmodplug/Config.in"
diff --git a/package/libilbc/Config.in b/package/libilbc/Config.in
new file mode 100644
index 0000000..89d5db2
--- /dev/null
+++ b/package/libilbc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBILBC
+	bool "libilbc"
+	help
+	  iLBC (internet Low Bitrate Codec) is a FREE speech codec
+	  suitable for robust voice communication over IP.
+
+	  http://www.webrtc.org/license-rights/ilbc-freeware
diff --git a/package/libilbc/libilbc.mk b/package/libilbc/libilbc.mk
new file mode 100644
index 0000000..06d94eb
--- /dev/null
+++ b/package/libilbc/libilbc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libilbc
+#
+################################################################################
+
+LIBILBC_VERSION = 829b08c7902ceb87a261279fabb36b6d523c6e07
+LIBILBC_SITE = https://freeswitch.org/stash/scm/sd/libilbc.git
+LIBILBC_SITE_METHOD = git
+LIBILBC_LICENSE = Global IP Sound iLBC Public License v2.0
+LIBILBC_LICENSE_FILES = gips_iLBClicense.pdf
+LIBILBC_AUTORECONF = YES
+LIBILBC_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
