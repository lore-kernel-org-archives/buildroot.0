From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:04:54 +0100
Subject: [Buildroot] [git commit] webkit: Add --enable-dependency-tracking
	to the configure options
Message-ID: <20141106220524.5CE58B2473@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8918cc50cb19af1e5cd51f2aa933ac755439d576
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--disable-dependency-tracking was added globally to
package/pkg-autotools.mk by this commit:

http://git.buildroot.net/buildroot/commit/?id=3e37b0fc6cbbe2245e39fedb247a381fb4e0d992

This causes a failure in webkit because some source files are generated
after the Makefile is created. To fix this, we add
--enable-dependency-tracking to the configure options.

Fixes:
  http://autobuild.buildroot.net/results/5beea967b02df202bca1d42afd6fa8c2c13383d5/

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkit/webkit.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index fae2e7e..98da1d6 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -40,6 +40,7 @@ WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config \
 	AR_FLAGS="cru"
 
 WEBKIT_CONF_OPTS += \
+	--enable-dependency-tracking \
 	--with-gtk=2.0 \
 	--disable-geolocation \
 	--disable-webkit2 \
