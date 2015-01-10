From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 15:59:45 +0100
Subject: [Buildroot] [git commit] python: disable building ossaudiodev
	module for host-python
Message-ID: <20150110153345.42D0F7FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c335f1838ec368840ca8292eb3b6c23b5f9907d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This module is not needed to build the target Python, and can cause
some build issues on certain systems (when <linux/soundcard.h> does
not contain the OSS related definitions).

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 45b1f7f..bf063e9 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -33,6 +33,7 @@ HOST_PYTHON_CONF_OPTS += 	\
 	--disable-test-modules	\
 	--disable-bz2		\
 	--disable-ssl		\
+	--disable-ossaudiodev	\
 	--disable-pyo-build
 
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
