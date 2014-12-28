From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 22:04:17 +0100
Subject: [Buildroot] [git commit] sdparm: bump to version 1.09
Message-ID: <20141228210425.48015804FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09a3e7545f12d588cfb4ff1428d6bf4943e34072
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.
And make the libsgutils2 support (from sg3_utils) deterministic.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sdparm/sdparm.hash |    2 ++
 package/sdparm/sdparm.mk   |   10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/sdparm/sdparm.hash b/package/sdparm/sdparm.hash
new file mode 100644
index 0000000..ff5e7b6
--- /dev/null
+++ b/package/sdparm/sdparm.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	0f5e07438ef56e045443bd827008a38076e029558b00adbfc45f9cc8a5c75349	sdparm-1.09.tar.xz
diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index 1b3ec4b..4aff25d 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -4,10 +4,16 @@
 #
 ################################################################################
 
-SDPARM_VERSION = 1.08
-SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
+SDPARM_VERSION = 1.09
+SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tar.xz
 SDPARM_SITE = http://sg.danny.cz/sg/p
 SDPARM_LICENSE = BSD-3c
 SDPARM_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_SG3_UTILS),y)
+SDPARM_DEPENDENCIES += sg3_utils
+else
+SDPARM_CONF_OPTS += --disable-libsgutils
+endif
+
 $(eval $(autotools-package))
