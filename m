From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:10:17 +0100
Subject: [Buildroot] [git commit] exiv2: add patch to fix build error with
	some toolchains
Message-ID: <20141207211105.457DC800BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2d8802fc7cd33d715f690bb839f5989751decf6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch remove a header inclusion that is not required an can create
build error with some toolchains.
The patch is pushed on the upstream for the next release.
http://dev.exiv2.org/issues/1007

Fixes:
http://autobuild.buildroot.net/results/09d/09d9b525eeee458247e10a7948070c00bbabb964/

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../exiv2/exiv2-0001-remove-useless-header.patch   |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/exiv2/exiv2-0001-remove-useless-header.patch b/package/exiv2/exiv2-0001-remove-useless-header.patch
new file mode 100644
index 0000000..96a3734
--- /dev/null
+++ b/package/exiv2/exiv2-0001-remove-useless-header.patch
@@ -0,0 +1,19 @@
+version.cpp: remove useless header inclusion
+
+The inclusion of link.h header is not required and can create build
+error with some toolchains.
+The patch is pushed on the upstream for the next release.
+http://dev.exiv2.org/issues/1007
+
+Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
+
+--- exiv2-0.24.orig/src/version.cpp	2013-12-01 13:13:42.000000000 +0100
++++ exiv2-0.24/src/version.cpp	2014-12-04 09:30:39.667234130 +0100
+@@ -116,7 +116,6 @@ typedef string_v::iterator  string_i;
+ #elif defined(__linux__)
+ # include <unistd.h>
+ // http://syprog.blogspot.com/2011/12/listing-loaded-shared-objects-in-linux.html
+-# include "link.h"
+ # include <dlfcn.h>
+   struct something
+   {
