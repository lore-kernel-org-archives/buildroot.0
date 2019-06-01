From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 14:47:17 +0200
Subject: [Buildroot] [git commit branch/next] package/python-matplotlib:
 drop redundant !PYTHON dependency
Message-ID: <20190601124732.04A5381DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02a449038e87632f0bcfded8df527bd0a95be355
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Having both:

       depends on !BR2_PACKAGE_PYTHON
       depends on BR2_PACKAGE_PYTHON3

is kind of useless, and we don't do that for any other Python package
that needs Python 3. So, this commit just drops the depends on
!BR2_PACKAGE_PYTHON.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-matplotlib/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index 99ad30aa08..c5cb94dac7 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	bool "python-matplotlib"
-	depends on !BR2_PACKAGE_PYTHON
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	select BR2_PACKAGE_FREETYPE # runtime
