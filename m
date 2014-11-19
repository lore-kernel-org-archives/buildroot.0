From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Nov 2014 14:21:05 +0100
Subject: [Buildroot] [git commit] package/python-*: drop redundant python ||
	python3 dependencies
Message-ID: <20141201104836.BEE177FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd331c1e1d15e7832f6eebc5c1e9c0a2dd34f033
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed on the list:

http://lists.busybox.net/pipermail/buildroot/2014-November/112509.html

We currently have a mix of python packages explicitly depending on python ||
python3 in their Config.in and packages that don't.  As all python packages
are inside a python || python3 conditional in the main Config.in, the
explicit dependencies inside the package Config.in is redundant, so drop it
for consistency.

Automated using:

sed -i '/depends on BR2_PACKAGE_PYTHON.*PYTHON3/d' package/python-*/Config.in

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bottle/Config.in         |    1 -
 package/python-cffi/Config.in           |    1 -
 package/python-configshell-fb/Config.in |    1 -
 package/python-ipython/Config.in        |    1 -
 package/python-libconfig/Config.in      |    1 -
 package/python-pyasn/Config.in          |    1 -
 package/python-pycrypto/Config.in       |    1 -
 package/python-pyparsing/Config.in      |    1 -
 package/python-pysnmp-apps/Config.in    |    1 -
 package/python-pysnmp-mibs/Config.in    |    1 -
 package/python-pysnmp/Config.in         |    1 -
 package/python-rtslib-fb/Config.in      |    1 -
 package/python-serial/Config.in         |    1 -
 package/python-urwid/Config.in          |    1 -
 14 files changed, 0 insertions(+), 14 deletions(-)

diff --git a/package/python-bottle/Config.in b/package/python-bottle/Config.in
index 7b13c1d..f9b60ca 100644
--- a/package/python-bottle/Config.in
+++ b/package/python-bottle/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_BOTTLE
 	bool "python-bottle"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  Bottle is a fast, simple and lightweight WSGI micro web-framework
 	  for Python. It is distributed as a single file module and has no
diff --git a/package/python-cffi/Config.in b/package/python-cffi/Config.in
index f18ed96..9cbfcfb 100644
--- a/package/python-cffi/Config.in
+++ b/package/python-cffi/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CFFI
 	bool "python-cffi"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_LIBFFI
 	help
 	  This is the Foreign Function Interface for Python calling C
diff --git a/package/python-configshell-fb/Config.in b/package/python-configshell-fb/Config.in
index fb96763..85f47a8 100644
--- a/package/python-configshell-fb/Config.in
+++ b/package/python-configshell-fb/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	bool "python-configshell-fb"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYPARSING
 	select BR2_PACKAGE_PYTHON3_READLINE if BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_READLINE if BR2_PACKAGE_PYTHON
diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index 064f0c9..1d92873 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  IPython is a command shell for interactive computing in multiple
 	  programming languages, originally developed for the Python
diff --git a/package/python-libconfig/Config.in b/package/python-libconfig/Config.in
index eae6cda..7a49d91 100644
--- a/package/python-libconfig/Config.in
+++ b/package/python-libconfig/Config.in
@@ -3,7 +3,6 @@ comment "python-libconfig needs a toolchain w/ C++, largefile, threads"
 
 config BR2_PACKAGE_PYTHON_LIBCONFIG
 	bool "python-libconfig"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_LIBCONFIG
diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
index efdbbc5..997b737 100644
--- a/package/python-pyasn/Config.in
+++ b/package/python-pyasn/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYASN
 	bool "python-pyasn"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
diff --git a/package/python-pycrypto/Config.in b/package/python-pycrypto/Config.in
index fe545b5..e998ecf 100644
--- a/package/python-pycrypto/Config.in
+++ b/package/python-pycrypto/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYCRYPTO
 	bool "python-pycrypto"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_GMP
 	help
 	  PyCrypto is a collection of cryptographic algorithms and
diff --git a/package/python-pyparsing/Config.in b/package/python-pyparsing/Config.in
index 0408e5e..b926286 100644
--- a/package/python-pyparsing/Config.in
+++ b/package/python-pyparsing/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYPARSING
 	bool "python-pyparsing"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  The pyparsing module is an alternative approach to creating and
 	  executing simple grammars, vs. the traditional lex/yacc approach,
diff --git a/package/python-pysnmp-apps/Config.in b/package/python-pysnmp-apps/Config.in
index 8edd04c..b032eba 100644
--- a/package/python-pysnmp-apps/Config.in
+++ b/package/python-pysnmp-apps/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYSNMP_APPS
 	bool "python-pysnmp-apps"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYSNMP
 	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
 	help
diff --git a/package/python-pysnmp-mibs/Config.in b/package/python-pysnmp-mibs/Config.in
index cc03676..eca17d2 100644
--- a/package/python-pysnmp-mibs/Config.in
+++ b/package/python-pysnmp-mibs/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYSNMP_MIBS
 	bool "python-pysnmp-mibs"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_PYSNMP
 	depends on BR2_INSTALL_LIBSTDCPP # pysnmp -> pyasn
 	help
diff --git a/package/python-pysnmp/Config.in b/package/python-pysnmp/Config.in
index 6cf18ee..c7cdf38 100644
--- a/package/python-pysnmp/Config.in
+++ b/package/python-pysnmp/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYSNMP
 	bool "python-pysnmp"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP # pyasn
 	select BR2_PACKAGE_PYTHON_PYASN
 	select BR2_PACKAGE_PYTHON_PYCRYPTO
diff --git a/package/python-rtslib-fb/Config.in b/package/python-rtslib-fb/Config.in
index 119b63b..42a610c 100644
--- a/package/python-rtslib-fb/Config.in
+++ b/package/python-rtslib-fb/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_RTSLIB_FB
 	bool "python-rtslib-fb"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  rtslib-fb is an object-based Python library for configuring
 	  the LIO generic SCSI target, present in 3.x Linux kernel
diff --git a/package/python-serial/Config.in b/package/python-serial/Config.in
index 72f5567..09a4c39 100644
--- a/package/python-serial/Config.in
+++ b/package/python-serial/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_SERIAL
 	bool "python-serial"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  python-serial is a Python library to access serial ports.
 
diff --git a/package/python-urwid/Config.in b/package/python-urwid/Config.in
index 92f7d53..f584a92 100644
--- a/package/python-urwid/Config.in
+++ b/package/python-urwid/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_URWID
 	bool "python-urwid"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  Urwid is a console user interface library for Python
 
