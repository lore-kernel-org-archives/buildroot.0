From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 19:19:46 +0200
Subject: [Buildroot] [git commit] package/janus-gateway: remove stray REST
 comment
Message-ID: <20200329170712.C887E88F56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1487840ffc8c37b6313764e33e6d1c7919c7246
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 80f3622bc7 (package/libmicrohttpd: remove dependency on
threads) removed BR2_TOOLCHAIN_HAS_THREADS dependency from
BR2_PACKAGE_JANUS_GATEWAY_REST but forgot to remove comment.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
