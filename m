From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 22 Apr 2014 20:42:52 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: disable test_fork
Message-ID: <1398192173-5081-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/439/439df2ad4482d08f295dbc40b2e88bf9167a7794/

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/zeromq/zeromq-01-disable-test_fork.patch |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/zeromq/zeromq-01-disable-test_fork.patch

diff --git a/package/zeromq/zeromq-01-disable-test_fork.patch b/package/zeromq/zeromq-01-disable-test_fork.patch
new file mode 100644
index 0000000..48a76ab
--- /dev/null
+++ b/package/zeromq/zeromq-01-disable-test_fork.patch
@@ -0,0 +1,22 @@
+Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
+
+--- a/tests/Makefile.am	2014-04-18 15:24:35.000000000 +0200
++++ b/tests/Makefile.am	2014-04-22 11:31:08.000000000 +0200
+@@ -46,8 +46,7 @@ if !ON_MINGW
+ noinst_PROGRAMS += test_shutdown_stress \
+                    test_pair_ipc \
+                    test_reqrep_ipc \
+-                   test_timeo \
+-                   test_fork
++                   test_timeo
+ endif
+ 
+ test_system_SOURCES = test_system.cpp
+@@ -93,7 +92,6 @@ test_shutdown_stress_SOURCES = test_shut
+ test_pair_ipc_SOURCES = test_pair_ipc.cpp testutil.hpp
+ test_reqrep_ipc_SOURCES = test_reqrep_ipc.cpp testutil.hpp
+ test_timeo_SOURCES = test_timeo.cpp
+-test_fork_SOURCES = test_fork.cpp
+ endif
+ 
+ #  Run the test cases
-- 
1.7.9.5
