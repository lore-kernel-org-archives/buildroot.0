From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 17:32:20 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] libftdi1: fix python
 build with cmake < 3.7
Message-ID: <20190129163201.3A058813B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34be70bba5ef61084292ca5359adff1eacfc9d92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes:
 - http://autobuild.buildroot.org/results/1091872e2b77d789e361d1ddefd235c738933c55

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8252e54710be89a37d19afb27b1b176d11739d67)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libftdi1/0004-cmake-find-swig.patch | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libftdi1/0004-cmake-find-swig.patch b/package/libftdi1/0004-cmake-find-swig.patch
index 25922cca53..cf787a6806 100644
--- a/package/libftdi1/0004-cmake-find-swig.patch
+++ b/package/libftdi1/0004-cmake-find-swig.patch
@@ -10,6 +10,9 @@ Signed-off-by: Eneas U de Queiroz <cote2004-github@yahoo.com>
 [Mark: patch retrieved and updated from
 http://developer.intra2net.com/git/?p=libftdi;a=commit;h=fcda9c6a208d3a7fe651ef661b2eb6e462a89c17]
 Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
+[Update patch to make it work with cmake < 3.7:
+http://developer.intra2net.com/mailarchive/html/libftdi/2019/msg00009.html]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
 diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
 index 31ef1c6..eefc344 100644
@@ -20,7 +23,7 @@ index 31ef1c6..eefc344 100644
  if ( PYTHON_BINDINGS )
    # workaround for cmake bug #0013449
 -  if ( NOT DEFINED CMAKE_FIND_ROOT_PATH )
-+  if ( NOT DEFINED CMAKE_FIND_ROOT_PATH OR CMAKE_VERSION VERSION_GREATER_EQUAL 3.0.0 )
++  if ( NOT DEFINED CMAKE_FIND_ROOT_PATH OR NOT CMAKE_VERSION VERSION_LESS 3.0.0 )
      find_package ( SWIG )
    else ()
      find_program ( SWIG_EXECUTABLE NAMES swig2.0 swig )
