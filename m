From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Nov 2009 23:24:14 +0100
Subject: [Buildroot] [git commit master] package/directfb: don't prepend
	$arch-linux- to programs
Message-ID: <20091122222605.13908777E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4eb64901e0e542a86565d94d3ed4155a41055def
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Directfb users: Do all those applications even make sense to install to
target?

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index b611c92..eb492cd 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -128,6 +128,7 @@ DIRECTFB_CONF_OPT = \
 	--enable-static \
 	--enable-shared \
 	--disable-explicit-deps \
+	--program-prefix='' \
 	$(DIRECTFB_MULTI) \
 	$(DIRECTFB_DEBUG) \
 	$(DIRECTFB_TRACE) \
-- 
1.6.3.3
