From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Nov 2014 11:04:46 +0100
Subject: [Buildroot] [git commit] libwebsockets: needs host-openssl when
	built with openssl support
Message-ID: <20141103100523.B2334B2F53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=037a5d3655a78176deebd466c42b1fbdf6d837e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/d01/d0190a6e5c6b5aa78cfefc29e4e8a4e4b135450b/
http://autobuild.buildroot.net/results/9bb/9bb8defedb8024de83eb3a609ab584efb5d0d2b0/
http://autobuild.buildroot.net/results/e4a/e4a1b298e7e158d3614b89e61d40ef9a00e7ff67/
http://autobuild.buildroot.net/results/5e2/5e24a90058111f7d5618047410f809b45bc165f6/

And many others.

The build system wants to create a ssl key for testing using host-openssl,
so ensure it is available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libwebsockets/libwebsockets.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 71a520d..e1a1aa3 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -21,7 +21,7 @@ LIBWEBSOCKETS_CONF_OPTS += -DLWS_IPV6=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBWEBSOCKETS_DEPENDENCIES += openssl
+LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
 else
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=OFF
