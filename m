From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 14:32:14 +0200
Subject: [Buildroot] [git commit] package/python-numpy: add missing
 dependency on Config.in comment
Message-ID: <20200501121740.CFFFD90C71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dd30a591fc561cbf8abb78988282c9ffec5a490
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-numpy Config.in comment was missing a dependency on
BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-numpy/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 757f73e8bf..23dcbc7986 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -30,4 +30,5 @@ config BR2_PACKAGE_PYTHON_NUMPY
 
 comment "python-numpy needs glibc or musl"
 	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
