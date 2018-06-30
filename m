From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:46:38 +0200
Subject: [Buildroot] [git commit] libostree: fix libsoup configure option
 name
Message-ID: <20180630164420.5D24083838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8c3ec57e7f60be86e6d5613848f67b1a700ad39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option used by configure script is actually
--with-soup/--without-soup.

Fixes:

  http://autobuild.buildroot.net/results/cf8ab76b8ea1a555d42f0625df1d58543e88efb1/

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libostree/libostree.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index bf5118413b..d9739b7901 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -40,7 +40,7 @@ endif
 
 #cURL support depends on libsoup
 ifeq ($(BR2_PACKAGE_LIBSOUP),y)
-LIBOSTREE_CONF_OPTS += --with-libsoup
+LIBOSTREE_CONF_OPTS += --with-soup
 LIBOSTREE_DEPENDENCIES += libsoup
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBOSTREE_CONF_OPTS += --with-curl
@@ -49,7 +49,7 @@ else
 LIBOSTREE_CONF_OPTS += --without-curl
 endif
 else
-LIBOSTREE_CONF_OPTS += --without-libsoup --without-curl
+LIBOSTREE_CONF_OPTS += --without-soup --without-curl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
