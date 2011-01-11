From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jan 2011 10:50:13 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: let buildroot handle
	stripping
Message-ID: <20110111113707.A2E848A4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ca2b65a6515800991dae49d1815b7bb933f4015c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some ABI's (like FLAT), we cannot strip busybox as the file format
does not support it and strip will abort with errors like 'File format
not recognized'.  Since the toplevel already takes care of stripping
things, simply disable the busybox step.

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 342819a..38897f7 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -21,7 +21,8 @@ BUSYBOX_MAKE_OPTS = \
 	PREFIX="$(TARGET_DIR)" \
 	EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
-	CONFIG_PREFIX="$(TARGET_DIR)"
+	CONFIG_PREFIX="$(TARGET_DIR)" \
+	SKIP_STRIP=y
 
 ifndef BUSYBOX_CONFIG_FILE
 	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
-- 
1.7.2.2
