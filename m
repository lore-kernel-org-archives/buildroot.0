From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Jan 2019 20:15:32 +0100
Subject: [Buildroot] [git commit] libupnpp: remove AUTORECONF
Message-ID: <20190120191627.8B8938050E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7de183b7702c5818b79e53ee0cb5130597035bcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9b551dacf74445d58aaefef349e2817e009c9d5d removed patch on
configure.ac so remove uneeded LIBUPNPP_AUTORECONF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnpp/libupnpp.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 31a066a648..3619050f10 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -11,8 +11,6 @@ LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
 LIBUPNPP_DEPENDENCIES = expat libcurl \
 	$(if $(BR2_PACKAGE_LIBUPNP),libupnp,libupnp18)
-# We're patching configure.ac
-LIBUPNPP_AUTORECONF = YES
 
 # configure script fails to link against the dependencies of libupnp
 # and libcurl causing detection to fail when statically linking
