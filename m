From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 12:47:33 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] easydbus: fix build
 without C++
Message-ID: <20181126114426.0A98B8865C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12b71af28e14093bc141b9f465c204bbda3e35cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Specify that easydbus is a C project file otherwise build will fail if
no C++ compiler is found by cmake

Fixes:
 - http://autobuild.buildroot.org/results/486c3cd98124e7415dee2fd1463bd5e0fcc9ba91

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e8fc4364a40a518fa21fe5c830675c7f30ede8ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-easydbus-is-a-C-project-file.patch        | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/easydbus/0001-easydbus-is-a-C-project-file.patch b/package/easydbus/0001-easydbus-is-a-C-project-file.patch
new file mode 100644
index 0000000000..1c149c582c
--- /dev/null
+++ b/package/easydbus/0001-easydbus-is-a-C-project-file.patch
@@ -0,0 +1,33 @@
+From a4bd47f593fbe55bd3ab17532e64be74aff5b29d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 17 Nov 2018 11:38:05 +0100
+Subject: [PATCH] easydbus is a C project file
+
+Specify that easydbus is a C project file otherwise build will fail if
+no C++ compiler is found by cmake
+
+Fixes:
+ - http://autobuild.buildroot.org/results/486c3cd98124e7415dee2fd1463bd5e0fcc9ba91
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mniestroj/easydbus/pull/2]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 58ccb2d..575eb24 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -5,7 +5,7 @@
+ #
+ 
+ cmake_minimum_required(VERSION 2.6)
+-project(easydbus)
++project(easydbus C)
+ 
+ add_definitions("-Wall -Wextra -Wno-unused-parameter")
+ set(CMAKE_C_FLAGS_RELEASE "-O2")
+-- 
+2.17.1
+
