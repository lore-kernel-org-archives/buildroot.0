From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 May 2013 14:28:38 +0200
Subject: [Buildroot] [PATCH 2/2] wvstreams: disable warnings
In-Reply-To: <1368102518-14826-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368102518-14826-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368102518-14826-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During the compilation of wvstreams, a number of strict aliasing
related warnings are shown, making the build quite noisy. Turn
warnings off using the --disable-warnings option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wvstreams/wvstreams.mk |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

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
-- 
1.7.9.5
