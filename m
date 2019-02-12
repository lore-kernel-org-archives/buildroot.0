From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:12:14 +0100
Subject: [Buildroot] [git commit] package/python-pyyaml: add host variant
Message-ID: <20190212191441.9D7627FC1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66d618cadacce9a8d66e3f7084610e69067a428f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-python-pyyaml is needed for mongodb 4.0.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: s/HOST_PYTHON/HOST_PYTHON_PYYAML/]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyyaml/python-pyyaml.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 95f0f0bb9e..b73b4356a0 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -11,5 +11,7 @@ PYTHON_PYYAML_SETUP_TYPE = distutils
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
 PYTHON_PYYAML_DEPENDENCIES = libyaml
+HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml
 
 $(eval $(python-package))
+$(eval $(host-python-package))
