From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 29 Sep 2009 11:45:50 +0200
Subject: [Buildroot] [git commit master] pango: needs host version of pango
	for pango-querymodules
Message-ID: <20090929094614.4E24D77778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b5cbb760adc45f3b2da730c71ab0d46e4aaec2df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pango/pango.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 21c219f..cb81431 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -43,7 +43,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 PANGO_CONF_OPT = --enable-shared --enable-static \
 		--enable-explicit-deps=no --disable-debug
 
-PANGO_DEPENDENCIES = gettext libintl host-pkgconfig libglib2 cairo
+PANGO_DEPENDENCIES = gettext libintl host-pkgconfig host-pango libglib2 cairo
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
         PANGO_CONF_OPT += --with-x \
-- 
1.6.3.3
