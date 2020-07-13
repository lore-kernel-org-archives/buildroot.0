From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 21:38:47 +0200
Subject: [Buildroot] [git commit] package/python-pyparted: needs python3
Message-ID: <20200713193505.81D6F84E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ada9b8888aa66ab323278ced6071c6be8b2bac7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python3 is a mandatory dependency since version 3.11.5 and
https://github.com/dcantrell/pyparted/commit/c4949263538784036a5917195f956f8fcda9cf20

Fixes:
 - http://autobuild.buildroot.org/results/7d93b4e5c3afebef8c4c19d1c6a0c26e71423191

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyparted/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pyparted/Config.in b/package/python-pyparted/Config.in
index 6e3bde2030..0e27ce1d2e 100644
--- a/package/python-pyparted/Config.in
+++ b/package/python-pyparted/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYPARTED
 	bool "python-pyparted"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_ENABLE_LOCALE # parted
 	depends on BR2_USE_WCHAR
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # parted
@@ -10,5 +11,6 @@ config BR2_PACKAGE_PYTHON_PYPARTED
 	  https://github.com/rhinstaller/pyparted
 
 comment "pyparted needs a glibc or musl toolchain w/ locale, wchar"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
 		!BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
