From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 22:54:16 +0100
Subject: [Buildroot] [git commit] host util-linux: disable login and su
	since they depend on PAM
Message-ID: <20130318215922.DFBDD9B171@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4123d76e76e26ab8af351b8f9af5fa8eb38bae2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following errors when building util-linux v2.22.2 for
the host in case the PAM headers are missing:

  configure: error: login selected, but required PAM header file not available
  configure: error: su selected, but required PAM header file not available

Signed-off-by: Christophe Vu-Brugier <cvubrugier@lacie.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/util-linux.mk |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 5e88206..b562206 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -79,11 +79,12 @@ UTIL_LINUX_CONF_OPT += \
 # and none of the util-linux utilities, so we disable all of them.
 HOST_UTIL_LINUX_CONF_OPT += \
 	--enable-libuuid \
-	--disable-mount --disable-fsck --disable-libmount \
-	--disable-uuidd --disable-libblkid --disable-agetty \
-	--disable-cramfs --disable-switch_root --disable-pivot_root \
-	--disable-fallocate --disable-unshare --disable-rename \
-	--disable-schedutils --disable-wall --disable-partx
+	--disable-agetty --disable-cramfs --disable-fallocate \
+	--disable-fsck --disable-libblkid --disable-libmount \
+	--disable-login --disable-mount --disable-partx \
+	--disable-pivot_root --disable-rename --disable-schedutils \
+	--disable-su --disable-switch_root --disable-unshare \
+	--disable-uuidd --disable-wall
 
 # Avoid building the tools if they are disabled since we can't install on
 # a per-directory basis.
