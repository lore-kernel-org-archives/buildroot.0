From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  4 Jun 2021 10:00:19 +0300
Subject: [Buildroot] [PATCH next] package/libssh2: requires RIPEMD160 in
 openssl
Message-ID: <2a3232b207a3fc5f9f7c21a1fc923096aca662cf.1622790019.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable RIPEMD160 in openssl for libssh2 to avoid link time failure.

Fixes:
http://autobuild.buildroot.net/results/c6e031fca123865138d18c96d895778c03b639be/
http://autobuild.buildroot.net/results/4284098c0f29fdb7a4df9acbc23986e685c542d2/
http://autobuild.buildroot.net/results/a457bf27dfc0029cbfc2fdbf371aad1e2efa5b83/

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libssh2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
index 90c38813b35f..ce2dd303fa35 100644
--- a/package/libssh2/Config.in
+++ b/package/libssh2/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_LIBSSH2_LIBGCRYPT
 config BR2_PACKAGE_LIBSSH2_OPENSSL
 	bool "openssl"
 	depends on BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 
 endchoice
 endif
-- 
2.30.2
