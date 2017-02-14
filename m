From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 14 Feb 2017 23:44:02 +0100
Subject: [Buildroot] [PATCH 4/4] bctoolbox: disable rpath
In-Reply-To: <20170214224402.8785-1-joerg.krause@embedded.rocks>
References: <20170214224402.8785-1-joerg.krause@embedded.rocks>
Message-ID: <20170214224402.8785-4-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, bctoolbox adds the rpath to the shared library. Prevent this
by setting `CMAKE_SKIP_RPATH` [1] to a true value.

[1] https://cmake.org/cmake/help/latest/variable/CMAKE_SKIP_RPATH.html

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bctoolbox/bctoolbox.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index 5eea0575f..76737aa3c 100644
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
-- 
2.11.1
