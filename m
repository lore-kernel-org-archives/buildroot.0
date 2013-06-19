From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Jun 2013 23:56:41 +0200
Subject: [Buildroot] [git commit] wvstreams: fix openssl detection when
	statically linking
Message-ID: <20130619220720.15EAA9AF76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa60e76c02f21edb461f16ae4a7f62ea3b2c1d0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The openssl tests need to link against libz as libcrypto references it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wvstreams/wvstreams.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
index d363f4c..65f48d4 100644
--- a/package/wvstreams/wvstreams.mk
+++ b/package/wvstreams/wvstreams.mk
@@ -24,6 +24,9 @@ WVSTREAMS_CONF_OPT += \
 	--without-pam \
 	--disable-warnings
 
+# needed for openssl detection when statically linking (as ssl needs lz)
+WVSTREAMS_CONF_ENV += LIBS=-lz
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	WVSTREAMS_DEPENDENCIES += dbus
 	WVSTREAMS_CONF_OPT += --with-dbus
