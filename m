From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  9 Jun 2021 21:52:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: requires RC4 support
 in openssl
Message-ID: <20210609195257.451055-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable RC4 in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/c658beb245cbf06786aa4155c7649c3e1a613e39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/transmission/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index dac4d1b330..28831d1a3c 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_TRANSMISSION
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Transmission is a cross-platform BitTorrent client.
 
-- 
2.30.2
