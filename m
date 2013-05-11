From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 09:36:46 +0200
Subject: [Buildroot] [git commit] wvstreams: disable warnings
Message-ID: <20130511073737.A83F69954A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b34cc0bcd9f223ba836882c9d08e1a3f95560bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During the compilation of wvstreams, a number of strict aliasing
related warnings are shown, making the build quite noisy. Turn
warnings off using the --disable-warnings option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wvstreams/wvstreams.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
index 341fc09..837c449 100644
--- a/package/wvstreams/wvstreams.mk
+++ b/package/wvstreams/wvstreams.mk
@@ -18,7 +18,11 @@ WVSTREAMS_MAKE = $(MAKE1)
 # Needed to work around problem with wvassert.h
 WVSTREAMS_CONF_OPT += CPPFLAGS=-DNDEBUG
 
-WVSTREAMS_CONF_OPT += --with-openssl --with-zlib --without-pam
+WVSTREAMS_CONF_OPT += \
+	--with-openssl \
+	--with-zlib \
+	--without-pam \
+	--disable-warnings
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	WVSTREAMS_DEPENDENCIES += dbus
