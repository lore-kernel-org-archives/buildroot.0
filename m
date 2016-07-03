From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:24:02 +0200
Subject: [Buildroot] [git commit] mtools: remove empty host dependencies
	definition
Message-ID: <20160703082409.982507FE9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2c6ca7da778b27f2e3002652b1b6553518c99e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtools/mtools.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index fc145c0..adba1fc 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -22,11 +22,9 @@ HOST_MTOOLS_CONF_ENV = \
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MTOOLS_DEPENDENCIES += libiconv
 MTOOLS_CONF_ENV += LIBS=-liconv
-# We have no host dependencies
-HOST_MTOOLS_DEPENDENCIES =
 endif
 
-#??Package does not build in parallel due to improper make rules
+# Package does not build in parallel due to improper make rules
 MTOOLS_MAKE = $(MAKE1)
 
 $(eval $(autotools-package))
