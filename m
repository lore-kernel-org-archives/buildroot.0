From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 15:26:17 +0100
Subject: [Buildroot] [PATCH v2, 2/4] package/python-pyyaml: add host variant
In-Reply-To: <20190210142619.8207-1-fontaine.fabrice@gmail.com>
References: <20190210142619.8207-1-fontaine.fabrice@gmail.com>
Message-ID: <20190210142619.8207-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python-pyyaml is needed for mongodb 4.0.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pyyaml/python-pyyaml.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 95f0f0bb9e..961a3135db 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -11,5 +11,7 @@ PYTHON_PYYAML_SETUP_TYPE = distutils
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
 PYTHON_PYYAML_DEPENDENCIES = libyaml
+HOST_PYTHON_DEPENDENCIES = host-libyaml
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.14.1
