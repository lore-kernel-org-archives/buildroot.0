From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jan 2016 19:48:47 +0100
Subject: [Buildroot] [git commit] dillo: fix jpeg dependency
Message-ID: <20160101185048.8B5E182751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d222f6d06e1799778fc2ffde53f011370c3e3ea6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dillo was explicitly pulling in libjpeg instead of the virtual 'jpeg'
package, even though it also works with jpeg-turbo.

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dillo/dillo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index 8eb8d88..01ab4f5 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -32,7 +32,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 DILLO_CONF_OPTS += --enable-jpeg
-DILLO_DEPENDENCIES += libjpeg
+DILLO_DEPENDENCIES += jpeg
 else
 DILLO_CONF_OPTS += --disable-jpeg
 endif
