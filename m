From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2015 20:03:46 +0100
Subject: [Buildroot] [git commit] python-spidev: bump to version 3.1
Message-ID: <20151029190717.857E27FA76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67e5b123f08cbf4d0a102bb2dbbb3cff89a4810b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

And fixes:
http://autobuild.buildroot.net/results/abc/abca38e3e93b609c1040c1152de7cd59940e2c88/
It was using an absolute include_dirs in setup.py pointing to the host
kernel sources (/usr/src/linux). It didn't affect "normal" distros since
they normally don't have the kernel sources installed, however for
Gentoo it's quite normal to have kernel sources there.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-spidev/python-spidev.hash |    2 ++
 package/python-spidev/python-spidev.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
