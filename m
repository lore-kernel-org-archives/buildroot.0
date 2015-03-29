From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 13:44:02 +0200
Subject: [Buildroot] [git commit] yaml-cpp: requires boost
Message-ID: <20150329114409.52F8B807EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=72b434744d26a24b9dbf126a6c14c2d733d9eb54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Boost C++ library is already selected in the Config.in but it was
missing in the yaml-cpp.mk file.

Fix build failure:
CMake Error at /home/tetsuya/buildroot/br/output/host/usr/share/cmake-3.1/Modules/FindBoost.cmake:1182 (message):
  Unable to find the requested Boost libraries.
<snip>
make: *** [/home/tetsuya/buildroot/br/output/build/yaml-cpp-0.5.1/.stamp_configured] Error 1

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/yaml-cpp/yaml-cpp.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
