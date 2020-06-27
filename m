From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Sat, 27 Jun 2020 13:44:01 +0200
Subject: [Buildroot] [PATCH 1/3] package/python-scipy: needs host-python-pip
Message-ID: <20200627114403.25017-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

python-pip is a build time dependency of
python-scipy because setup.py includes 'pip'
and this cannot be bypassed

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
