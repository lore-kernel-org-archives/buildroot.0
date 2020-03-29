From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Mar 2020 18:44:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: remove wrong REST
 comment
Message-ID: <20200329164423.4097287-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 80f3622bc78d7d2c404a5e4d960686bd03c82450 removed
BR2_TOOLCHAIN_HAS_THREADS dependency from BR2_PACKAGE_JANUS_GATEWAY_REST
but forgot to remove comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/janus-gateway/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 989ae26055..fc32546717 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -79,9 +79,6 @@ config BR2_PACKAGE_JANUS_GATEWAY_REST
 	bool "REST (HTTP/HTTPS)"
 	select BR2_PACKAGE_LIBMICROHTTPD
 
-comment "REST transport needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_JANUS_GATEWAY_UNIX_SOCKETS
 	bool "Unix Sockets"
 	default y
-- 
2.25.1
