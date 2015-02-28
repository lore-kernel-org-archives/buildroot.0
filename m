From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 12:29:49 +0100
Subject: [Buildroot] [git commit] libsrtp: openssl handling needs shared
	library support
Message-ID: <20150228120508.3CFC680504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67cebbdf5f349cc176037fa15c281a9462dae591
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ab8/ab80094080c18602a2adb266981f53ebe0647f63/
http://autobuild.buildroot.net/results/a77/a770318af841610e0c10f61cf61bdae298aa59a8/
http://autobuild.buildroot.net/results/ce2/ce27f5b81b74320f4d2efbbaa4754c23fb2feeab/
http://autobuild.buildroot.net/results/57f/57f54c6f00953e8b7da70f4467f38cc9dfca2380/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsrtp/libsrtp.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index 5e62255..e5cf47b 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -25,7 +25,8 @@ endif
 # host-pkgconf to make sure pkg-config is installed.
 LIBSRTP_DEPENDENCIES = host-pkgconf
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+# openssl handling needs libdl support
+ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
 LIBSRTP_DEPENDENCIES += openssl
 LIBSRTP_CONF_OPTS += --enable-openssl
 else
