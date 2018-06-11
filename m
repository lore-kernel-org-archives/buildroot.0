From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jun 2018 06:51:44 +0200
Subject: [Buildroot] [PATCH 1/1] yaml-cpp: disable tests
Message-ID: <20180611045144.18669-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fork is used in tests so build fails without MMU

Fixes:
- http://autobuild.buildroot.net/results/3cb7c4d93e466c6eef69aacd0e561a9fb569e69b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/yaml-cpp/yaml-cpp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index d97c84a7cf..97021ea421 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -11,6 +11,8 @@ YAML_CPP_LICENSE = MIT
 YAML_CPP_LICENSE_FILES = LICENSE
 
 # Disable testing and parse tools
-YAML_CPP_CONF_OPTS += -DYAML_CPP_BUILD_TOOLS=OFF
+YAML_CPP_CONF_OPTS += \
+	-DYAML_CPP_BUILD_TESTS=OFF \
+	-DYAML_CPP_BUILD_TOOLS=OFF
 
 $(eval $(cmake-package))
-- 
2.14.1
