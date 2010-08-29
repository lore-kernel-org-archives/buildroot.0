From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Aug 2010 21:51:07 +0200
Subject: [Buildroot] [git commit master 1/1] samba: avahi support needs
	avahi-daemon / dbus
Message-ID: <20100829195129.A4E2F8A301@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c06b3891ff9ff2f6780e7547a54d2688dafa016c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

./configure checks for libavahi-client.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    2 +-
 package/samba/Config.in |    7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0b24e51..e68adf0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,7 +18,7 @@
 	fs: old-style squashfs for big endian archs fixed.
 
 	Updated/fixed packages: busybox, imagemagick, libglib2, lua,
-	luafilesystem, lzo, netcat, php, qt, startup-notification,
+	luafilesystem, lzo, netcat, php, qt, samba, startup-notification,
 	sysvinit, util-linux
 
 	Issues resolved (http://bugs.uclibc.org):
diff --git a/package/samba/Config.in b/package/samba/Config.in
index a7a0b34..58a84f3 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -241,12 +241,13 @@ config BR2_PACKAGE_SAMBA_AVAHI
 	bool "support avahi"
 	default y
 	depends on BR2_PACKAGE_SAMBA
-	depends on BR2_PACKAGE_AVAHI
+	depends on BR2_PACKAGE_AVAHI_DAEMON
+	depends on BR2_PACKAGE_DBUS
 	help
 	  Include support for avahi
 
-comment "support avahi - disabled (requires avahi)"
-	depends on !BR2_PACKAGE_AVAHI
+comment "support avahi - disabled (requires avahi-daemon/dbus)"
+	depends on !BR2_PACKAGE_AVAHI_DAEMON || !BR2_PACKAGE_DBUS
 
 config BR2_PACKAGE_SAMBA_GAMIN
 	bool "support gamin"
-- 
1.7.1
