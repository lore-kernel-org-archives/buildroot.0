From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:00:23 +0200
Subject: [Buildroot] [git commit] yaml-cpp: Bump version and change site
Message-ID: <20150726212545.4D1738081D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec34f19f9496364ecd99e97805fd89ade8b06fa9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Google Code is a closing forge, yaml-cpp has already made the move
to Github.

Since a new release was available a bump was also in order.
The hash is removed since the tarball from Github is generated.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/yaml-cpp/yaml-cpp.hash |    5 -----
 package/yaml-cpp/yaml-cpp.mk   |    4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
deleted file mode 100644
index 391e317..0000000
--- a/package/yaml-cpp/yaml-cpp.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# hash from: https://yaml-cpp.googlecode.com/files/yaml-cpp-0.5.1.tar.gz:
-sha1 9c5414b4090491e96d1b808fe8628b31e625fdaa  yaml-cpp-0.5.1.tar.gz
-
-# Locally calculated:
-sha256 3e7c9052b43d987d41819a203d97fc45de4eed3ec67e0fdb14265c3d11046f06  yaml-cpp-0.5.1.tar.gz
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index afc70bd..cea54a9 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-YAML_CPP_VERSION = 0.5.1
-YAML_CPP_SITE = https://yaml-cpp.googlecode.com/files
+YAML_CPP_VERSION = 0.5.2
+YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,release-$(YAML_CPP_VERSION))
 YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
 YAML_CPP_LICENSE_FILES = license.txt
