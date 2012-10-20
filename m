From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 20 Oct 2012 21:11:06 +0200
Subject: [Buildroot] [git commit] package/lttng-babeltrace: Bump version to
	1.0.0-rc6.
Message-ID: <20121020191224.1BBAD998CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d48c41284d0daee0b70312022c7c6d31f730eb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-babeltrace-no-posix-fallocate-in-uclibc.patch} |    0
 package/lttng-babeltrace/lttng-babeltrace.mk       |   11 ++---------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch b/package/lttng-babeltrace/lttng-babeltrace-no-posix-fallocate-in-uclibc.patch
similarity index 100%
rename from package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch
rename to package/lttng-babeltrace/lttng-babeltrace-no-posix-fallocate-in-uclibc.patch
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 0f3200f..dd701df 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -1,14 +1,7 @@
-LTTNG_BABELTRACE_SITE    = http://lttng.org/files/bundles/20111214/
-LTTNG_BABELTRACE_VERSION = 0.8
+LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
+LTTNG_BABELTRACE_VERSION = 1.0.0-rc6
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 
-# Needed to fix libtool handling, otherwise the build fails when
-# building the ctf-parser-test program, which depends on libctf-ast.so
-# which itself depends on libbabeltrace_types.so.0 (and libtool gets
-# lost in the middle of this).
-LTTNG_BABELTRACE_AUTORECONF      = YES
-HOST_LTTNG_BABELTRACE_AUTORECONF = YES
-
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
 $(eval $(autotools-package))
