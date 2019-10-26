From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 26 Oct 2019 17:29:42 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/python-pyyaml: add a
 host-python3 dependency for host variant
In-Reply-To: <20191026152943.122511-1-titouan.christophe@railnova.eu>
References: <20191026152943.122511-1-titouan.christophe@railnova.eu>
Message-ID: <20191026152943.122511-4-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

host-python-pyyaml on host-python3 is needed for mongodb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Titouan: Fix comment line contains UTF-8 characters]
Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/python-pyyaml/python-pyyaml.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 165a938f11..e74405c065 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -13,5 +13,8 @@ PYTHON_PYYAML_LICENSE_FILES = LICENSE
 PYTHON_PYYAML_DEPENDENCIES = libyaml
 HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml
 
+# Needed to build mongodb
+HOST_PYTHON_PYYAML_NEEDS_HOST_PYTHON = python3
+
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.21.0
