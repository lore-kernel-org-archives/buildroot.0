From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jun 2016 21:34:07 +0200
Subject: [Buildroot] [git commit] package/libmicrohttpd: Fix build with !C99
	compilers
Message-ID: <20160613193926.22C8581898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c65b074bc42eca7c1d968508d7dee683d532b9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The code assumes C99 mode for loop variables, so ensure it is used.

Fixes
http://autobuild.buildroot.net/results/734/734652bbdd7b6b18a8d67a30fe03bed62cd644e7/
http://autobuild.buildroot.net/results/d03/d03d36bfd4a97ff8091a815a45b4670bff992233/

[Peter: fixup/extend commit message]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/libmicrohttpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 84bb6b1..c53676f 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -9,6 +9,7 @@ LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
+LIBMICROHTTPD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPLv2.1+
