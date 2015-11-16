From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 21:50:56 +0100
Subject: [Buildroot] [git commit] boost: do not allow context module on sparc
Message-ID: <20151116205151.EAA5981D82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=648956a137949e0388536688fff3ae4f7bb298a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The boost context module does not build on sparc, even if sparc is
advertised as a supported architecture by the boost documentation. So
let's disallow this module for the time being.

Fixes:

  http://autobuild.buildroot.org/results/206/2060e6e31c4d739947097faf6587e0a06681fee2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index edffd7e..cffaf6e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -67,11 +67,12 @@ config BR2_PACKAGE_BOOST_CONTAINER
 
 # see
 # http://www.boost.org/doc/libs/1_59_0/libs/context/doc/html/context/architectures.html
-# for the list of supported architectures.
+# for the list of supported architectures. Sparc pretends to be
+# supported, but it doesn't build.
 config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
 	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel \
-			|| BR2_powerpc || BR2_sparc || BR2_x86_64)
+			|| BR2_powerpc || BR2_x86_64)
 
 config BR2_PACKAGE_BOOST_COROUTINE
         bool "boost-coroutine"
