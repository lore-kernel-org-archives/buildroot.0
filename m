From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:47:42 +0100
Subject: [Buildroot] [git commit] atk: remove unused host variant
Message-ID: <20130112215438.13276996EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b19ee5cbdf8978d593805483a92b4c9d00c0da76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The atk package is used as a dependency in the libglade and libgtk2
packages.

The libglade package has no host variant, and does not depend on
host-atk.

The libgtk2 package depends on atk, and has a host variant, but the
host variant of libgtk2 overrides HOST_LIBGTK2_DEPENDENCIES to limit
the number of dependencies, and host-atk is not amongst those
dependencies.

Therefore, host-atk is useless and can be removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/atk/atk.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 0453acb..2a85edd 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -43,8 +43,4 @@ ATK_CONF_OPT =  --disable-glibtest --enable-explicit-deps=no \
 
 ATK_DEPENDENCIES = libglib2 host-pkgconf
 
-HOST_ATK_CONF_OPT = \
-		--disable-glibtest
-
 $(eval $(autotools-package))
-$(eval $(host-autotools-package))
