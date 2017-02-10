From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 10 Feb 2017 21:59:13 -0200
Subject: [Buildroot] [PATCH] poco: build it as "poco", not "poco-poco"
Message-ID: <1486771153-10386-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use just the version number to name the tarball and build directory, not
the full tag "poco-x.y.z-release". I admit that this is pure nitpicking
but, gosh, that "poco-poco" thing puts me nervous!

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 1730f1c..8e81aef 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cfd311ecbc9e58accf1c4ea70170af88f92f88e73dd14944e528e7f6229e6cab  poco-poco-1.7.2-release.tar.gz
+sha256  cfd311ecbc9e58accf1c4ea70170af88f92f88e73dd14944e528e7f6229e6cab  poco-1.7.2.tar.gz
 sha256  32182791e7eac00ba367d2f22dd1dd5bfce0b6d6f76fd52f853364f98402dda3  30159aea4b3f6421da9d74a8bf22aad6d3bf26b4.patch
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 90dfb34..8b6cf12 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-POCO_VERSION = poco-1.7.2-release
-POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
+POCO_VERSION = 1.7.2
+POCO_VERSION_TAG = poco-1.7.2-release
+POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION_TAG))
 POCO_LICENSE = Boost-v1.0
 POCO_LICENSE_FILES = LICENSE
 POCO_INSTALL_STAGING = YES
-- 
2.7.4
