From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2020 11:57:26 +0200
Subject: [Buildroot] [git commit] package/libuhttpd: disable test plugin
Message-ID: <20200424094517.4F65D8FE9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bf84a79b862edd84ca7a36b65dd49fd1728c19a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

test plugin needs dynamic library support

Fixes:
 - http://autobuild.buildroot.org/results/ce7c69ceac3390f6d22f777e4cf908188486c6b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libuhttpd/libuhttpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 59a8b45c07..9c026cff02 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -10,6 +10,7 @@ LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
 LIBUHTTPD_INSTALL_STAGING = YES
 LIBUHTTPD_DEPENDENCIES = libev
+LIBUHTTPD_CONF_OPTS = -DBUILD_TEST_PLUGIN=OFF
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUHTTPD_DEPENDENCIES += openssl
