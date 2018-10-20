From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 18:03:08 +0200
Subject: [Buildroot] [git commit] gvfs: add optional libusb support
Message-ID: <20181020160911.66C0D84381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1703a851d74a5e7c3dd7d3752c8a3e8c1839e853
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/gvfs.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 19747b4cb0..b62923a500 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -99,6 +99,13 @@ else
 GVFS_CONF_OPTS += --disable-http
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+GVFS_DEPENDENCIES += libusb
+GVFS_CONF_OPTS += --enable-libusb
+else
+GVFS_CONF_OPTS += --disable-libusb
+endif
+
 ifeq ($(BR2_PACKAGE_SAMBA4),y)
 GVFS_DEPENDENCIES += samba4
 GVFS_CONF_OPTS += \
