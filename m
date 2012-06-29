From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jun 2012 16:40:04 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: link statically when
	BR2_PREFER_STATIC_LIB
Message-ID: <20120629144806.834178EE23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb421a8433a44504c79e06ccdd5a69a9792ee77f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of explicitly adding it for each package.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 1d43aef..c5ad00a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -305,6 +305,7 @@ endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
+TARGET_LDFLAGS += -static
 else
 SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 endif
