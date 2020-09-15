From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:12:33 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/libnetconf2: drop
 patch
Message-ID: <20200915185503.D734E8B657@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a4c0b4f7c2c0c004cf468d3795e49831ee0f17a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

With updating libssh to version 0.9.5 this patch is no longer needed.

http://lists.busybox.net/pipermail/buildroot/2020-September/291986.html

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 79b15efb9d7d6ce8038b11e273610691d475faef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...xt-remove-version-check-for-faulty-libssh.patch | 32 ----------------------
 1 file changed, 32 deletions(-)

diff --git a/package/libnetconf2/0001-CMakeList.txt-remove-version-check-for-faulty-libssh.patch b/package/libnetconf2/0001-CMakeList.txt-remove-version-check-for-faulty-libssh.patch
deleted file mode 100644
index d1df807626..0000000000
--- a/package/libnetconf2/0001-CMakeList.txt-remove-version-check-for-faulty-libssh.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ad89283f9ed36f0f1234c7f005edfc34e8b9fd58 Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@kontron.com>
-Date: Thu, 4 Jun 2020 15:31:56 +0200
-Subject: [PATCH] CMakeList.txt: remove version check for faulty libssh version
-
-libssh is fixed by a patch in buildroot so we can drop the libssh
-version check for 0.9.3 and 0.9.4.
-
-See: 39099153d9404cd6f107f0fd92ce8686bbd1beb2
-
-Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
----
- CMakeLists.txt | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f21fec9..29ef202 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -148,9 +148,6 @@ endif()
- # dependencies - libssh
- if(ENABLE_SSH)
-     find_package(LibSSH 0.7.0 REQUIRED)
--    if(LIBSSH_VERSION VERSION_EQUAL 0.9.3 OR LIBSSH_VERSION VERSION_EQUAL 0.9.4)
--        message(FATAL_ERROR "LibSSH ${LIBSSH_VERSION} includes regression bugs and libnetconf2 will NOT work properly, try to use another version")
--    endif()
- 
-     target_link_libraries(netconf2 ${LIBSSH_LIBRARIES})
-     list(APPEND CMAKE_REQUIRED_LIBRARIES ${LIBSSH_LIBRARIES})
--- 
-2.20.1
-
