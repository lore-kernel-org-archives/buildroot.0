From: guillaume.bressaix at gmail.com <guillaume.bressaix@gmail.com>
Date: Sat, 27 Jun 2020 13:44:02 +0200
Subject: [Buildroot] [PATCH 2/3] package/python-scipy: needs host-python
 pybind
In-Reply-To: <20200627114403.25017-1-guillaume.bressaix@gmail.com>
References: <20200627114403.25017-1-guillaume.bressaix@gmail.com>
Message-ID: <20200627114403.25017-2-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

python-pybind (>2.4) is a build time dependency
of python-scipy

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-pybind/python-pybind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 634e869e40..239893b97c 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -11,3 +11,4 @@ PYTHON_PYBIND_LICENSE_FILES = LICENSE
 PYTHON_PYBIND_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.20.1
