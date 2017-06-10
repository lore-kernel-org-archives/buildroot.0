From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jun 2017 23:06:22 +0200
Subject: [Buildroot] [git commit] package/python-pyicu: needs host gcc >=
	4.8 for icu support
Message-ID: <20170610210719.AFA01817B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8c26cbc3c1c0088e094641e12a6f319eb0079a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyicu/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-pyicu/Config.in b/package/python-pyicu/Config.in
index efab085..2d9624c 100644
--- a/package/python-pyicu/Config.in
+++ b/package/python-pyicu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYICU
 	bool "python-pyicu"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_INSTALL_LIBSTDCPP # icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
@@ -9,7 +10,8 @@ config BR2_PACKAGE_PYTHON_PYICU
 
 	  https://github.com/ovalhub/pyicu
 
-comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.8"
+comment "python-pyicu needs a toolchain w/ C++, gcc >= 4.8, host gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8
