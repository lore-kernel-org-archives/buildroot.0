From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:21:53 +0200
Subject: [Buildroot] [git commit] irrlicht: fix patches to have DOS line
	endings
Message-ID: <20170701082150.532C281776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45bdad14e643129fd390b3a2739047977beb75bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/6260307da8acd45eb7611b08e2527a20ee5b357e/

Thanks to Romain Naour for providing the proper patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch | 36 +++++++++++-----------
 package/irrlicht/0002-remove-sys-sysctl.h.patch    | 14 ++++-----
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch b/package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch
index 0bb8fcc..d6e4b63 100644
--- a/package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch
+++ b/package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch
@@ -20,25 +20,25 @@ index 0712b07..b334e9c 100644
 --- a/source/Irrlicht/Makefile
 +++ b/source/Irrlicht/Makefile
 @@ -62,7 +62,7 @@ LINKOBJ = $(IRRMESHOBJ) $(IRROBJ) $(IRRPARTICLEOBJ) $(IRRANIMOBJ) \
- ###############
- #Compiler flags
- CXXINCS = -I../../include -Izlib -Ijpeglib -Ilibpng
--CPPFLAGS += $(CXXINCS) -DIRRLICHT_EXPORTS=1
-+override CPPFLAGS += $(CXXINCS) -DIRRLICHT_EXPORTS=1
- CXXFLAGS += -Wall -pipe -fno-exceptions -fno-rtti -fstrict-aliasing
- ifndef NDEBUG
- CXXFLAGS += -g -D_DEBUG
+ ###############
+ #Compiler flags
+ CXXINCS = -I../../include -Izlib -Ijpeglib -Ilibpng
+-CPPFLAGS += $(CXXINCS) -DIRRLICHT_EXPORTS=1
++override CPPFLAGS += $(CXXINCS) -DIRRLICHT_EXPORTS=1
+ CXXFLAGS += -Wall -pipe -fno-exceptions -fno-rtti -fstrict-aliasing
+ ifndef NDEBUG
+ CXXFLAGS += -g -D_DEBUG
 @@ -74,8 +74,8 @@ CXXFLAGS += -pg
- endif
- CFLAGS := -O3 -fexpensive-optimizations -DPNG_THREAD_UNSAFE_OK -DPNG_NO_MMX_CODE -DPNG_NO_MNG_FEATURES
- 
--sharedlib sharedlib_osx: CXXFLAGS += -fPIC
--sharedlib sharedlib_osx: CFLAGS += -fPIC
-+sharedlib sharedlib_osx: override CXXFLAGS += -fPIC
-+sharedlib sharedlib_osx: override CFLAGS += -fPIC
- 
- #multilib handling
- ifeq ($(HOSTTYPE), x86_64)
+ endif
+ CFLAGS := -O3 -fexpensive-optimizations -DPNG_THREAD_UNSAFE_OK -DPNG_NO_MMX_CODE -DPNG_NO_MNG_FEATURES
+ 
+-sharedlib sharedlib_osx: CXXFLAGS += -fPIC
+-sharedlib sharedlib_osx: CFLAGS += -fPIC
++sharedlib sharedlib_osx: override CXXFLAGS += -fPIC
++sharedlib sharedlib_osx: override CFLAGS += -fPIC
+ 
+ #multilib handling
+ ifeq ($(HOSTTYPE), x86_64)
 -- 
 2.9.3
 
diff --git a/package/irrlicht/0002-remove-sys-sysctl.h.patch b/package/irrlicht/0002-remove-sys-sysctl.h.patch
index 2e5fc63..d9142a9 100644
--- a/package/irrlicht/0002-remove-sys-sysctl.h.patch
+++ b/package/irrlicht/0002-remove-sys-sysctl.h.patch
@@ -26,13 +26,13 @@ index 0899d1d..ccf5ef5 100644
 --- a/source/Irrlicht/COSOperator.cpp
 +++ b/source/Irrlicht/COSOperator.cpp
 @@ -13,7 +13,6 @@
- #include <unistd.h>
- #ifndef _IRR_SOLARIS_PLATFORM_
- #include <sys/types.h>
--#include <sys/sysctl.h>
- #endif
- #endif
- 
+ #include <unistd.h>
+ #ifndef _IRR_SOLARIS_PLATFORM_
+ #include <sys/types.h>
+-#include <sys/sysctl.h>
+ #endif
+ #endif
+ 
 -- 
 2.9.3
 
