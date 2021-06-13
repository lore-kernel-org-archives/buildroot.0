From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 22:02:42 +0200
Subject: [Buildroot] [git commit] package/proftpd: requires RMD160 support
 in openssl
Message-ID: <20210613193436.300E68D452@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b84d5677727f3ce3a4ba9118ad7abbb1ed254530
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable RMD160 in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/4c3e7a77d8d6c326135fe467bfcae627df4a9b9b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/proftpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 4898f49dd2..83094028a0 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -29,6 +29,7 @@ config BR2_PACKAGE_PROFTPD_MOD_REDIS
 config BR2_PACKAGE_PROFTPD_MOD_SFTP
 	bool "mod_sftp support"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Compile ProFTPD with mod_sftp support
 
