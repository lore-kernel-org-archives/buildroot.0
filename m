From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 20:28:19 +0200
Subject: [Buildroot] [git commit] circus,
	python-psutil: fix syntax in Config.in
Message-ID: <20160921182842.C783C81DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2bb5e52793de32b46f3232b9dd2919cc08d6ae4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After commit ab930190d775 ("python-psutil: not available on musl")
we are getting following error when we set defconfig

package/python-psutil/Config.in:14: syntax error
package/python-psutil/Config.in:13: invalid option
package/circus/Config.in:21: syntax error
package/circus/Config.in:20: invalid option

Fixes: ab930190d775 ("python-psutil: not available on musl")
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/circus/Config.in        | 2 +-
 package/python-psutil/Config.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/circus/Config.in b/package/circus/Config.in
index 3df41f5..94c59a4 100644
--- a/package/circus/Config.in
+++ b/package/circus/Config.in
@@ -18,5 +18,5 @@ config BR2_PACKAGE_CIRCUS
 
 comment "circus needs Python and a uClibc or glibc toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL || \
 		!(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
diff --git a/package/python-psutil/Config.in b/package/python-psutil/Config.in
index 0b1333c..1aec35d 100644
--- a/package/python-psutil/Config.in
+++ b/package/python-psutil/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_PYTHON_PSUTIL
 	  https://pypi.python.org/pypi/psutil
 
 comment "python-psutil needs a uClibc or glibc toolchain"
-	depends BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_TOOLCHAIN_USES_MUSL
