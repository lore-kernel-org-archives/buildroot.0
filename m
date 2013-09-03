From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 Sep 2013 15:28:56 +0200
Subject: [Buildroot] [git commit] gcc: re-disable info documentation
Message-ID: <20130903134743.7E6E89B6D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09b74417e3de932cdb5a1ab97101434bed9cc989
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The documentation of older GCC versions (E.G. 4.3.x) contain constructs
that are no longer accepted by recent (5.x) versions of makeinfo, breaking
the build.

The documentation isn't really needed, and takes up extra space/build time,
so work around it by disabling documentation, like we had before the
conversion of the toolchain to the package infrastructure.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/gcc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index cd6efed..782217f 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -97,6 +97,7 @@ HOST_GCC_COMMON_CONF_OPT = \
 	--disable-multilib \
 	--with-gmp=$(HOST_DIR)/usr \
 	--with-mpfr=$(HOST_DIR)/usr \
+	MAKEINFO=missing
 
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
 # Workaround until it's fixed in 4.5.4 or later
