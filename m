From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 13:52:12 +0200
Subject: [Buildroot] [git commit] directfb: do not use inexistant configure
	options
Message-ID: <20150910122136.832D681F74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87f7ace1b55ebd1c6ed2209af20a5ba677e59550
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The --disable-sysfs and --disable-explicit-deps options are not
supported by DirectFB anymore, so don't use them.

[Thomas: rework commit log.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb/directfb.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index c27e982..da12acb 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -14,11 +14,9 @@ DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_AUTORECONF = YES
 
 DIRECTFB_CONF_OPTS = \
-	--disable-explicit-deps \
 	--enable-zlib \
 	--enable-freetype \
 	--enable-fbdev \
-	--disable-sysfs \
 	--disable-sdl \
 	--disable-vnc \
 	--disable-osx \
