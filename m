From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 20:09:31 +0200
Subject: [Buildroot] [git commit] python-pyzmq: enable PyZMQ for Python 3
Message-ID: <20140715182503.93C1D9D246@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a8bedc51d980af052f9b243d1ba64e19f7e9946
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The PyZMQ package is currently limited to Python 2; however, its
build system does not require the Python 2 interpreter and will work
as is with Python 3 (tested).

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyzmq/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
index b83c09c..0f868d0 100644
--- a/package/python-pyzmq/Config.in
+++ b/package/python-pyzmq/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_PYZMQ
 	depends on BR2_USE_WCHAR # zeromq
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  This package contains the python language binding for zeromq.
