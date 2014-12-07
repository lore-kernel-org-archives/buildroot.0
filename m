From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:03:39 +0100
Subject: [Buildroot] [git commit] python-webpy: depend on Python 2.x only
Message-ID: <20141207210409.3C97D8012C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8885df5a127e4416f1747b055ea8b300256e59c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

webpy is still not ported to Python 3, so enable only for Python 2.

Fixes:

 http://autobuild.buildroot.org/results/e6b/e6bdb8e0ab6daa027a01507861ecde47338a11a8/

[Thomas: add autobuilder reference.]

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-webpy/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python-webpy/Config.in b/package/python-webpy/Config.in
index 1e90892..e9a5121 100644
--- a/package/python-webpy/Config.in
+++ b/package/python-webpy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEBPY
 	bool "python-webpy"
+	depends on BR2_PACKAGE_PYTHON
 	help
 	  web.py is a web framework for Python that is as simple as it is
 	  powerful.
