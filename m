From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:54:14 -0000
Subject: [Buildroot] [git commit branch/next] package/Makefile.in: link
	statically when BR2_PREFER_STATIC_LIB
Message-ID: <20120802195246.CCF1B8E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb421a8433a44504c79e06ccdd5a69a9792ee77f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
