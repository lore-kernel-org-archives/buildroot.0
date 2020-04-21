From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:12:37 +0200
Subject: [Buildroot] [git commit] package/collectd: fix dependency of
 network-gcrypt
Message-ID: <20200421195857.06BC88FB55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a71b9a111fdf308e0d2c8384f360ef2b29e7a553
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c8b8744a1aeebeba4035fdba9556226696ac2abd forgot to propagate
libgcrypt reverse dependency

Fixes:
 - http://autobuild.buildroot.org/results/98c7734dccb4e01c02f4680cfbdf82ee59e17935

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 1b6b3384c4..188be3c0fb 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -592,6 +592,7 @@ config BR2_PACKAGE_COLLECTD_NETWORK
 
 config BR2_PACKAGE_COLLECTD_NETWORK_GCRYPT
 	bool "crypto support"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_PACKAGE_COLLECTD_NETWORK
 	select BR2_PACKAGE_LIBGCRYPT
 	help
