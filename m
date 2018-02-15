From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 22:35:36 +0100
Subject: [Buildroot] [git commit] libcpprestsdk: needs host-pkgconf
Message-ID: <20180215213744.7785687CE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e66d15646f886fed08c2bd59b06bc55bdecd38d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d2f0a9bba400 (libcpprestsdk: fix building as a static library)
changed libcpprestsdk to use pkg-config to find the linker flags for
openssl, so ensure it is available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcpprestsdk/libcpprestsdk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 4aafa6e593..4d30f07c39 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -9,7 +9,7 @@ LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(LIBCPPRESTSDK_VERSION)
 LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
 LIBCPPRESTSDK_SUBDIR = Release
-LIBCPPRESTSDK_DEPENDENCIES += boost openssl zlib
+LIBCPPRESTSDK_DEPENDENCIES += host-pkgconf boost openssl zlib
 LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF
 
 $(eval $(cmake-package))
