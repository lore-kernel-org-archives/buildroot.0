From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 12:02:31 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] libostree: fix libsoup
 configure option name
Message-ID: <20180719100626.11FBB88E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36e4be597b0b0d7aac19a1159db8b2f324b62f25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

The option used by configure script is actually
--with-soup/--without-soup.

Fixes:

  http://autobuild.buildroot.net/results/cf8ab76b8ea1a555d42f0625df1d58543e88efb1/

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b8c3ec57e7f60be86e6d5613848f67b1a700ad39)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libostree/libostree.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index ba6379d7e7..d4e0a80b35 100644
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
