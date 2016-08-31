From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Sep 2016 00:18:27 +0200
Subject: [Buildroot] [git commit] libshout: add optional openssl support
Message-ID: <20160831224016.C4F10800EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1442ff3c19e6e82e97fc0da325405c19ec777d97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libshout/libshout.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 7c07909..bf85595 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -28,4 +28,11 @@ else
 LIBSHOUT_CONF_OPTS += --disable-speex
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBSHOUT_CONF_OPTS += --with-openssl
+LIBSHOUT_DEPENDENCIES += openssl
+else
+LIBSHOUT_CONF_OPTS += --without-openssl
+endif
+
 $(eval $(autotools-package))
