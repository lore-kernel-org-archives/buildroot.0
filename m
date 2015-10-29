From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 29 Oct 2015 07:55:34 -0300
Subject: [Buildroot] [PATCH] python-spidev: bump to version 3.1
Message-ID: <1446116134-31005-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

And fixes:
http://autobuild.buildroot.net/results/abc/abca38e3e93b609c1040c1152de7cd59940e2c88/
It was using an absolute include_dirs in setup.py pointing to the host
kernel sources (/usr/src/linux). It didn't affect "normal" distros since
they normally don't have the kernel sources installed, however for
Gentoo it's quite normal to have kernel sources there.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-spidev/python-spidev.hash | 2 ++
 package/python-spidev/python-spidev.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/python-spidev/python-spidev.hash

diff --git a/package/python-spidev/python-spidev.hash b/package/python-spidev/python-spidev.hash
new file mode 100644
index 0000000..49e8db8
--- /dev/null
+++ b/package/python-spidev/python-spidev.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	355391e9ad3024950590626b080324394c12e75bb21923dbd56a978a1eac6ac7	spidev-3.1.tar.gz
diff --git a/package/python-spidev/python-spidev.mk b/package/python-spidev/python-spidev.mk
index 14103f3..0a8dd15 100644
--- a/package/python-spidev/python-spidev.mk
+++ b/package/python-spidev/python-spidev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SPIDEV_VERSION = 3.0
+PYTHON_SPIDEV_VERSION = 3.1
 PYTHON_SPIDEV_SOURCE = spidev-$(PYTHON_SPIDEV_VERSION).tar.gz
 PYTHON_SPIDEV_SITE = https://pypi.python.org/packages/source/s/spidev
 PYTHON_SPIDEV_SETUP_TYPE = distutils
-- 
2.4.10
