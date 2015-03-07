From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Sat, 07 Mar 2015 17:23:18 +0100
Subject: [Buildroot] [PATCH v2 1/2] wine: Disable more configure options
Message-ID: <54FB25F6.7040908@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To avoid potential future problems.

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
v2: minor fixes

 package/wine/wine.mk | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 47c7259..e931c87 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -16,7 +16,22 @@ WINE_CONF_OPTS = \
 	--with-wine-tools=../host-wine-$(WINE_VERSION) \
 	--disable-tests \
 	--disable-win64 \
-	--without-opengl
+	--without-capi \
+	--without-coreaudio \
+	--without-gettext \
+	--without-gettextpo \
+	--without-gphoto \
+	--without-gsm \
+	--without-hal \
+	--without-ldap \
+	--without-netapi \
+	--without-openal \
+	--without-opencl \
+	--without-opengl \
+	--without-osmesa \
+	--without-oss \
+	--without-xshape \
+	--without-xshm
 
 # Wine uses a wrapper around gcc, and uses the value of --host to
 # construct the filename of the gcc to call.  But for external
