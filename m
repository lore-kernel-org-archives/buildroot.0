From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 10 Oct 2017 22:30:14 +0300
Subject: [Buildroot] [PATCH 1/2] lvm2: disable selinux for host
Message-ID: <dd465954531e2cfa6d0ca76ece7b6384f642ea59.1507663815.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no need for selinux support in the host lvm2 package.

Should fix:
http://autobuild.buildroot.net/results/6cd/6cde658da1fa815c157acf36b39c10a8d885e9a9/
http://autobuild.buildroot.net/results/430/43071433814a3176256687720c1d665f41748484/
http://autobuild.buildroot.net/results/ced/cedd7ff4b287d7b71612134444964dc847cc6062/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lvm2/lvm2.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 9880c12bf05e..79691ddec6f6 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -59,7 +59,8 @@ HOST_LVM2_CONF_OPTS = \
 	--disable-dmeventd \
 	--disable-applib \
 	--disable-fsadm \
-	--disable-readline
+	--disable-readline \
+	--disable-selinux
 HOST_LVM2_MAKE_OPTS = device-mapper
 HOST_LVM2_INSTALL_OPTS = install_device-mapper
 
-- 
2.14.2
