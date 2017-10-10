From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Oct 2017 22:04:22 +0200
Subject: [Buildroot] [git commit] lvm2: optionally depend on libselinux
Message-ID: <20171010195717.8A25D81144@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11683002c69ea8b243980e68f5cad3f79b268757
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lvm2/lvm2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 79691dd..20e0dd0 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -35,6 +35,13 @@ else
 LVM2_CONF_OPTS += --disable-readline
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LVM2_CONF_OPTS += --enable-selinux
+LVM2_DEPENDENCIES += libselinux
+else
+LVM2_CONF_OPTS += --disable-selinux
+endif
+
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),)
 LVM2_MAKE_OPTS = device-mapper
 LVM2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install_device-mapper
