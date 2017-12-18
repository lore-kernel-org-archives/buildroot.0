From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 10:47:12 +0100
Subject: [Buildroot] [git commit] python-cffi: add missing runtime dependency
Message-ID: <20171218095730.22736827D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a24153a73fc13fb580aa7fcf3c58745ad69e5f8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-pycparser is mentioned in setup.py as install_requires, so
select it in Config.in.

As python-cffi will be installed with python-crossbar's dependencies,
remove it from python-crossbar's Config.in.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
