From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 11 Mar 2015 18:03:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/Makefile.in: Do not add
	--enable-debug flag.
Message-ID: <1426093401-23108-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding this flag when BR2_ENABLE_DEBUG is activated make several
packages to produce binaries that do not work as expected (e.g., dhcp,
lame, nano). Moreover, the help message of BR2_ENABLE_DEBUG does not
say it is adding this flag. It is supposed to build packages with
debugging symbols enabled. So, let it do that only.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Makefile.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 803b162..2995222 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -387,9 +387,7 @@ ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 TARGET_CONFIGURE_OPTS += CXX=false
 endif
 
-ifeq ($(BR2_ENABLE_DEBUG),y)
-ENABLE_DEBUG := --enable-debug
-else
+ifneq ($(BR2_ENABLE_DEBUG),y)
 ENABLE_DEBUG := --disable-debug
 endif
 
-- 
2.1.0
