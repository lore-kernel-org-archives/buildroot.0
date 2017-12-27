From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:18:19 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] python-cffi: add missing
 runtime dependency
Message-ID: <20171227223843.421E78376E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3d6eab0bcbb08804369867f318b8bb632d19015
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

python-pycparser is mentioned in setup.py as install_requires, so
select it in Config.in.

As python-cffi will be installed with python-crossbar's dependencies,
remove it from python-crossbar's Config.in.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit a24153a73fc13fb580aa7fcf3c58745ad69e5f8e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cffi/Config.in     | 1 +
 package/python-crossbar/Config.in | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cffi/Config.in b/package/python-cffi/Config.in
index 3805d3d..bc9f6a2 100644
--- a/package/python-cffi/Config.in
+++ b/package/python-cffi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_CFFI
 	bool "python-cffi"
 	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_PYTHON_PYCPARSER # runtime
 	help
 	  This is the Foreign Function Interface for Python calling C
 	  code. The aim of this project is to provide a convenient
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index faec922..2a98467 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
 	select BR2_PACKAGE_PYTHON_CBOR
 	select BR2_PACKAGE_PYTHON_CLICK
-	select BR2_PACKAGE_PYTHON_PYCPARSER
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	select BR2_PACKAGE_PYTHON_JINJA2
 	select BR2_PACKAGE_PYTHON_LMDB
