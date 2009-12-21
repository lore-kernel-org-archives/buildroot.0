From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Dec 2009 10:00:40 +0100
Subject: [Buildroot] [git commit master] Install uuid.h into staging as some
	other apps like xfsprogs need it
Message-ID: <20091221091617.BCFCB763B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=17524208071a4440a1eaad37c43903aa4e5dc179
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: cleanup, only install header if libuuid is installed]
Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    2 +-
 package/e2fsprogs/e2fsprogs.mk |    3 +++
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4d439bc..3e9979a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
-	directfb, gst-plugins-bad, hal, iw, libfuse, libpcap,
+	directfb, e2fsprogs, gst-plugins-bad, hal, iw, libfuse, libpcap,
 	lighttpd, mesa, mpg123, mtd-utils, neon, pcre, qt, sshfs,
 	tremor, u-boot, usbutils
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index fd03f02..0f8119b 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -91,5 +91,8 @@ endif
 ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
 	ln -sf e2label ${TARGET_DIR}/usr/sbin/findfs
 endif
+ifeq ($(BR2_PACKAGE_E2FSPROGS_LIBUUID),y)
+	install -D ${E2FSPROGS_SRCDIR}/lib/uuid/uuid.h ${STAGING_DIR}/usr/include/uuid/uuid.h
+endif
 	touch $@
 
-- 
1.6.3.3
