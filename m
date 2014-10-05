From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:32:41 +0200
Subject: [Buildroot] [git commit] python-pyasn: requires the zlib Python
	module
Message-ID: <20141005123249.B746BB08F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ae62213fa26b4c0b07b635b31404f17f8ecae9b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-pyasn module requires the zlib Python module (part of the
Python standard installation, but optional in Buildroot), otherwise it
fails to load at runtime.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyasn/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
index eca53db..efdbbc5 100644
--- a/package/python-pyasn/Config.in
+++ b/package/python-pyasn/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_PYTHON_PYASN
 	bool "python-pyasn"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
 	help
 	  PyASN is a Python extension module that enables you to
 	  perform very fast IP address to Autonomous System Number
