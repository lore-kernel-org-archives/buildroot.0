From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat, 28 Mar 2015 20:34:32 +0100
Subject: [Buildroot] [PATCH] yaml-cpp: requires boost
Message-ID: <1427571272-8465-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Boost C++ library is already selected in the Config.in but it was
missing in the yaml-cpp.mk file.

Fix build failure:
CMake Error at /home/tetsuya/buildroot/br/output/host/usr/share/cmake-3.1/Modules/FindBoost.cmake:1182 (message):
  Unable to find the requested Boost libraries.
<snip>
make: *** [/home/tetsuya/buildroot/br/output/build/yaml-cpp-0.5.1/.stamp_configured] Error 1

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/yaml-cpp/yaml-cpp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index 5ebdb23..afc70bd 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -10,4 +10,6 @@ YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
 YAML_CPP_LICENSE_FILES = license.txt
 
+YAML_CPP_DEPENDENCIES = boost
+
 $(eval $(cmake-package))
-- 
2.3.4
