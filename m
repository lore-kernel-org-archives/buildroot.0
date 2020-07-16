From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:03:03 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/libxmlrpc: fix
 check-package warnings
Message-ID: <20200716150352.A68317FD90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98524be8d29a722bfea5d37ff1b5fff6090404e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Assignment in conditional blocks must use append-assignment.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 92d73f31b2ffdbbdb7049a9c25669c973766d7f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxmlrpc/libxmlrpc.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index f9925b74ca..4b30ecd381 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -40,10 +40,10 @@ LIBXMLRPC_STATIC_OPTS = SHARED_LIB_TYPE=NONE MUST_BUILD_SHLIB=N
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBXMLRPC_DEPENDENCIES = host-pkgconf openssl
-LIBXMLRPC_CONF_OPTS = --enable-abyss-openssl
+LIBXMLRPC_DEPENDENCIES += host-pkgconf openssl
+LIBXMLRPC_CONF_OPTS += --enable-abyss-openssl
 else
-LIBXMLRPC_CONF_OPTS = --disable-abyss-openssl
+LIBXMLRPC_CONF_OPTS += --disable-abyss-openssl
 endif
 
 LIBXMLRPC_MAKE_OPTS += $(LIBXMLRPC_STATIC_OPTS)
