From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 10 Oct 2017 22:30:15 +0300
Subject: [Buildroot] [PATCH 2/2] lvm2: optionally depend on libselinux
In-Reply-To: <dd465954531e2cfa6d0ca76ece7b6384f642ea59.1507663815.git.baruch@tkos.co.il>
References: <dd465954531e2cfa6d0ca76ece7b6384f642ea59.1507663815.git.baruch@tkos.co.il>
Message-ID: <e2b73c341c75a31612f5a7e72db1cf9867ce9b0d.1507663815.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lvm2/lvm2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 79691ddec6f6..20e0dd0d5c36 100644
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
-- 
2.14.2
