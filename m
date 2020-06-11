From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Thu, 11 Jun 2020 10:11:56 +0200
Subject: [Buildroot] [PATCH 1/3] python-scipy: needs host-python-pybind
Message-ID: <20200611081158.16509-1-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

patch serie to add python-scipy

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

---

python-pybind is a build time dependency for python-scipy

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
