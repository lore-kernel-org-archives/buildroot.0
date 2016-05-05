From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:55:32 +0200
Subject: [Buildroot] [git commit] python-singledispatch: add missing runtime
	dependency
Message-ID: <20160505205538.606DB81DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0074622162cc4d53a60f296ba68e79cd9dd460ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

setup.py mentions python-six as required.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-singledispatch/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-singledispatch/Config.in b/package/python-singledispatch/Config.in
index 192e516..4abc219 100644
--- a/package/python-singledispatch/Config.in
+++ b/package/python-singledispatch/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_SINGLEDISPATCH
 	bool "python-singledispatch"
 	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  This library brings functools.singledispatch from
 	  Python 3.4 to Python 2.6-3.3
