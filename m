From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:33 -0000
Subject: [Buildroot] [git commit branch/next] apr: requires shared library
	support
Message-ID: <20120802195232.5ABA296FE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02b00dc9dfb7216145277a303c7c2f52004f85b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The apr library requires shared library support unconditionally, so
make it depend on !BR2_PREFER_STATIC_LIB, so that architectures that
support static libraries only do not make this package available.

Solves
http://autobuild.buildroot.org/results/f4cd9751e85e9ee7fde2e9479e0f01ab2be93e84/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/apr-util/Config.in |    2 ++
 package/apr/Config.in      |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 99b32f2..895dbb8 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_NEON
 	select BR2_PACKAGE_NEON_ZLIB
 	select BR2_PACKAGE_ZLIB
+	# apr really needs shared library support
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  The utility library for the apache runtime project
 
diff --git a/package/apr/Config.in b/package/apr/Config.in
index 292cadb..ed319ed 100644
--- a/package/apr/Config.in
+++ b/package/apr/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_APR
 	bool "apr"
+	# apr really needs shared library support
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  The mission of the Apache Portable Runtime (APR) project is to create
 	  and maintain software libraries that provide a predictable and
