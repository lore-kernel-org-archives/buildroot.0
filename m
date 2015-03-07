From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 17:37:21 +0100
Subject: [Buildroot] [git commit] wine: Disable more configure options
Message-ID: <20150307163728.425138075F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e982dcb7cc8cb7b62941f4f24ae55daa59b06860
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To avoid potential future problems.

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/wine.mk |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

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
