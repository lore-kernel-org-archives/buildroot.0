From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:23:33 +0100
Subject: [Buildroot] [git commit] python-crossbar: add a warning comment
	concerning version bump
Message-ID: <20170302212347.8E6F38227E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff51f57731724cb34faa5bff94a21c90031d6a31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest crossbar needs a rather recent setuptools package, that
has circular dependencies. Until this issue is not resolved, it is
not safe to bump crossbar version.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-crossbar/python-crossbar.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index 3d82d77..fa1732b 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# don't bump version as newer setuptools package is needed,
+# that still didn't make its way into Buildroot
 PYTHON_CROSSBAR_VERSION = 0.14.0
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
 PYTHON_CROSSBAR_SITE = https://pypi.python.org/packages/f0/9a/e0b77e15698c47b6293655bc0e1996dd8e87bd8af7bc7434a5c8281a024e
