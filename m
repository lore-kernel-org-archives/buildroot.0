From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Nov 2010 10:42:45 +0100
Subject: [Buildroot] [git commit master 1/1] directfb: don't build tools for
	target
Message-ID: <20101107094406.355B48DBFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=267022d7f7cb1f043bda11800a658802c35d78f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Normally these aren't needed, and some of them (mkdgifft) needs C++
support.

Alternatively we could add an option (depending on HAVE_DEVFILES) to
build these.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index fc0e7fe..9192dc5 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -26,7 +26,8 @@ DIRECTFB_CONF_OPT = \
 	--disable-vnc \
 	--disable-osx \
 	--disable-video4linux \
-	--disable-video4linux2
+	--disable-video4linux2 \
+	--without-tools
 
 DIRECTFB_DEPENDENCIES = freetype zlib
 
-- 
1.7.1
