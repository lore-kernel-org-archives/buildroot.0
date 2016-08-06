From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2016 12:13:48 +0200
Subject: [Buildroot] [git commit] package/kmsxx: needs headers >= 3.8
Message-ID: <20160806101359.C4BD381DF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ef5ddfeefc3721bbd86c4dd06922c9e09074153
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kms++ uses V4L2_MEMORY_DMABUF, which was only introduced in linux-3.8.

Fixes:
    http://autobuild.buildroot.org/results/8dc/8dcc74586d68195c72a58cb4944d05dd9f935fa1/
    http://autobuild.buildroot.org/results/224/22467a530a146302ef74b11f69cb5cdc54240876/
    http://autobuild.buildroot.org/results/0e5/0e576ec01bbbf68a05216f4459a8a0613c39c141/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmsxx/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kmsxx/Config.in b/package/kmsxx/Config.in
index a2143a9..1d174c1 100644
--- a/package/kmsxx/Config.in
+++ b/package/kmsxx/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_KMSXX
 	bool "kms++"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	select BR2_PACKAGE_LIBDRM
@@ -20,6 +21,6 @@ config BR2_PACKAGE_KMSXX_INSTALL_TESTS
 
 endif
 
-comment "kms++ needs a toolchain w/ threads, C++, gcc >= 4.8"
-        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "kms++ needs a toolchain w/ threads, C++, gcc >= 4.8, headers >= 3.8"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
