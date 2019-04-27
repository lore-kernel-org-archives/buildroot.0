From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 27 Apr 2019 16:41:35 +0200
Subject: [Buildroot] [PATCH 3/4] package/python-pyyaml: add a host-python3
 dependency for host variant
In-Reply-To: <20190427144136.9072-1-fontaine.fabrice@gmail.com>
References: <20190427144136.9072-1-fontaine.fabrice@gmail.com>
Message-ID: <20190427144136.9072-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python-pyyaml on host-python3 is needed for mongodb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pyyaml/python-pyyaml.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index b73b4356a0..ddbbd7ec04 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -13,5 +13,8 @@ PYTHON_PYYAML_LICENSE_FILES = LICENSE
 PYTHON_PYYAML_DEPENDENCIES = libyaml
 HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml
 
+#?Needed to build mongodb
+HOST_PYTHON_PYYAML_NEEDS_HOST_PYTHON = python3
+
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.20.1
