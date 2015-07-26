From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 26 Jul 2015 18:42:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/scons: fix missing dependency
Message-ID: <1437932577-874-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-scons did not depend on host-python, causing build failures in
some instances.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 package/scons/scons.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 39fb258..3ad0fa5 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -10,6 +10,7 @@ SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
 SCONS_SETUP_TYPE = distutils
 
+HOST_SCONS_DEPENDENCIES = host-python
 HOST_SCONS_NEEDS_HOST_PYTHON = python2
 
 HOST_SCONS_INSTALL_OPTS = \
-- 
2.4.3
