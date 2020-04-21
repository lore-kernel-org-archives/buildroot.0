From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 19:12:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix dependency of
 network-gcrypt
Message-ID: <20200421171220.4120564-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit c8b8744a1aeebeba4035fdba9556226696ac2abd forgot to propagate
libgcrypt reverse dependency

Fixes:
 - http://autobuild.buildroot.org/results/98c7734dccb4e01c02f4680cfbdf82ee59e17935

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 54b218754a..dd4e6cc173 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -614,6 +614,7 @@ config BR2_PACKAGE_COLLECTD_NETWORK
 
 config BR2_PACKAGE_COLLECTD_NETWORK_GCRYPT
 	bool "crypto support"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_PACKAGE_COLLECTD_NETWORK
 	select BR2_PACKAGE_LIBGCRYPT
 	help
-- 
2.25.1
