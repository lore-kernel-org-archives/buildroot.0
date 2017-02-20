From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:23:55 +0100
Subject: [Buildroot] [git commit] bctoolbox: disable rpath
Message-ID: <20170220212445.0E9038006A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87dadc1f8e7f3a8d062f98fab01ff0787b436daa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, bctoolbox adds the rpath to the shared library. Prevent this
by setting `CMAKE_SKIP_RPATH` [1] to a true value.

[1] https://cmake.org/cmake/help/latest/variable/CMAKE_SKIP_RPATH.html

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bctoolbox/bctoolbox.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index 5eea057..76737aa 100644
--- a/package/bctoolbox/bctoolbox.mk
+++ b/package/bctoolbox/bctoolbox.mk
@@ -11,11 +11,14 @@ BCTOOLBOX_LICENSE_FILES = COPYING
 BCTOOLBOX_DEPENDENCIES = mbedtls
 BCTOOLBOX_INSTALL_STAGING = YES
 
+# Set CMAKE_SKIP_RPATH to prevent bctoolbox from adding the rpath to
+# shared library.
 BCTOOLBOX_CONF_OPTS = \
 	-DENABLE_STRICT=OFF \
 	-DENABLE_TESTS_COMPONENT=OFF \
 	-DENABLE_TESTS=OFF \
-	-DGIT_EXECUTABLE=OFF
+	-DGIT_EXECUTABLE=OFF \
+	-DCMAKE_SKIP_RPATH=ON
 
 # bctoolbox can be build with mbedTLS or PolarSSL support. If both
 # libraries are present, mbedTLS is preferred over PolarSSL.
