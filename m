From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 10:18:54 +0200
Subject: [Buildroot] [git commit] package/libwebsockets: add support for
 unix-domain sockets
Message-ID: <20200614081936.4DD2682AA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6524317ecdfe620c5ee47ccce756e67e64c5acfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libwebsockets allows the usage of unix-domain-sockets since 2016, so
explicitly enable it (size increase is a ridiculous 12 bytes on ARM).

Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
[yann.morin.1998 at free.fr: always enable, don't add a menuconfig entry]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libwebsockets/libwebsockets.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index dedd03347d..3af34a61ab 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -10,7 +10,10 @@ LIBWEBSOCKETS_LICENSE = LGPL-2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
-LIBWEBSOCKETS_CONF_OPTS = -DLWS_WITHOUT_TESTAPPS=ON -DLWS_IPV6=ON
+LIBWEBSOCKETS_CONF_OPTS = \
+	-DLWS_WITHOUT_TESTAPPS=ON \
+	-DLWS_IPV6=ON \
+	-DLWS_UNIX_SOCK=ON
 
 # If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
 # in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
