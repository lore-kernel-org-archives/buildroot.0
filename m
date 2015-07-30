From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:08:23 +0200
Subject: [Buildroot] [git commit branch/next] package/yaml-cpp: disable
	testing and parse tools
Message-ID: <20150808105651.EAABC7FE8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d15325a925b03ee223578483eb80d20b95ae4ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The gmock testing framework uses fork() and therefor yaml-cpp fails to build
for a MMU-less targets. Since we are only interested in building the yaml-cpp
library we disable the testing and parse tools (command line tools).

Fixes:
http://autobuild.buildroot.net/results/2ce/2ce3c6d0140696cdf73f2ad1499b779c83ad8f6e/

Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/yaml-cpp/yaml-cpp.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index cea54a9..6a01b02 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -12,4 +12,7 @@ YAML_CPP_LICENSE_FILES = license.txt
 
 YAML_CPP_DEPENDENCIES = boost
 
+# Disable testing and parse tools
+YAML_CPP_CONF_OPTS += -DYAML_CPP_BUILD_TOOLS=OFF
+
 $(eval $(cmake-package))
