From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Tue,  9 Jun 2020 14:17:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pip: add host-python-pip
 possibility
Message-ID: <20200609121702.19880-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My next contribution requires host-python-pip
because 'import pip' is required in its setup.py
and so, must be present at build time.

This is a just a new option, compatible
with previous packages. Call it with
with 'PYTHON_FOO_DEPENCIES = host-python-pip'

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-pip/python-pip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index cc40eecdfe..0af41ab807 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -12,3 +12,4 @@ PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.20.1
