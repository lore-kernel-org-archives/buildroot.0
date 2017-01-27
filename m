From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 27 Jan 2017 16:06:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/libasplib: Fix time.h include
Message-ID: <20170127150633.10711-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/cc0/cc0b928ee24a526b7c82fd3f391e2be024a14578/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...0001-asplib_CPUTimer.h-Fix-time.h-include.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch

diff --git a/package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch b/package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch
new file mode 100644
index 0000000000..c91ddbfab3
--- /dev/null
+++ b/package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch
@@ -0,0 +1,39 @@
+From 7291289ba0c052e45e2a0330642318798d6a4caf Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 27 Jan 2017 16:02:27 +0100
+Subject: [PATCH 1/1] asplib_CPUTimer.h: Fix time.h include
+
+According to https://linux.die.net/man/3/clock_gettime time.h needs to
+be included instead of sys/time.h.
+
+This patch fixes a build error found by buildroot autobuilders:
+
+http://autobuild.buildroot.net/results/cc0/cc0b928ee24a526b7c82fd3f391e2be024a14578//
+
+/home/peko/autobuild/instance-1/output/build/libasplib-be7fac89218a84b75f7598e3d76625ece99296f2/asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.cpp: In member function 'void asplib::CCPUTimer::start_Timer()':
+/home/peko/autobuild/instance-1/output/build/libasplib-be7fac89218a84b75f7598e3d76625ece99296f2/asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.cpp:69:19: error: 'CLOCK_REALTIME' was not declared in this scope
+     clock_gettime(CLOCK_REALTIME, &m_startTime);
+
+Patch sent upstream: https://github.com/AchimTuran/asplib/pull/34
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.h b/asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.h
+index a61ff49..a9676e0 100644
+--- a/asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.h
++++ b/asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.h
+@@ -29,7 +29,7 @@
+   #include <windows.h>
+   #include <time.h>
+ #elif defined(TARGET_LINUX)
+-  #include <sys/time.h>
++  #include <time.h>
+ #endif
+ 
+ namespace asplib
+-- 
+2.11.0
+
-- 
2.11.0
