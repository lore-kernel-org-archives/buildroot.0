From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jun 2012 23:25:54 +0200
Subject: [Buildroot] [PATCH 1/1] libnfc: make example build optional
In-Reply-To: <1338741337-12019-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 3 Jun 2012 18:35:37 +0200")
References: <1338741337-12019-1-git-send-email-s.martin49@gmail.com>
Message-ID: <8762b5pi1p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> This patch converts libnfc to CMAKETARGET and makes example build
 Samuel> optional.

What's the reason for using cmake instead of autotools? Is upstream
moving away from autotools or is it just because you prefer cmake?


 Samuel> Fixes http://autobuild.buildroot.org/results/a963924b15e185d0144809a98feac52dec0d1cc3
 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 Samuel> diff --git a/package/libnfc/libnfc-make-examples-optional.patch b/package/libnfc/libnfc-make-examples-optional.patch
 Samuel> new file mode 100644
 Samuel> index 0000000..da8bc3f
 Samuel> --- /dev/null
 Samuel> +++ b/package/libnfc/libnfc-make-examples-optional.patch

Please add a git-style header with description and your signed-off-by to
this patch. Have you submitted it upstream? If not, please consider
doing so.


 Samuel> @@ -0,0 +1,22 @@
 Samuel> +--- libnfc-1.5.1.orig/CMakeLists.txt	2012-06-03 17:57:20.308085744 +0200
 Samuel> ++++ libnfc-1.5.1/CMakeLists.txt	2012-06-03 18:13:37.502570332 +0200
 Samuel> +@@ -27,6 +27,7 @@ INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOUR
 Samuel> + SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules/")
 Samuel> + 
 Samuel> + # Options
 Samuel> ++SET(BUILD_EXAMPLES OFF CACHE BOOL "Build examples")
 Samuel> + SET(LIBNFC_DEBUG_OUTPUT OFF CACHE BOOL "Debug output of communication with the NFC chip")
 Samuel> + IF(LIBNFC_DEBUG_OUTPUT)
 Samuel> +   ADD_DEFINITIONS(-DDEBUG -g3)
 Samuel> +@@ -101,7 +102,10 @@ ENDIF(LIBUSB_INCLUDE_DIRS)
 Samuel> + ADD_SUBDIRECTORY(libnfc)
 Samuel> + ADD_SUBDIRECTORY(include)
 Samuel> + ADD_SUBDIRECTORY(utils)
 Samuel> +-ADD_SUBDIRECTORY(examples)
 Samuel> ++
 Samuel> ++IF(BUILD_EXAMPLES)
 Samuel> ++  ADD_SUBDIRECTORY(examples)
 Samuel> ++ENDIF(BUILD_EXAMPLES)
 Samuel> + 
 Samuel> + # Binary Package
 Samuel> + IF(WIN32)

-- 
Bye, Peter Korsgaard
