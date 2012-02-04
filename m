From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Feb 2012 15:48:42 +0100
Subject: [Buildroot] [PATCH 1/7] liburcu: add patch to fix build with uClibc
In-Reply-To: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fef652a4afaa01890b129d278dbb0a950ca63e3e.1328366921.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Under uClibc, defining _GNU_SOURCE is strictly needed to access the
CPU_*() macros.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../liburcu/liburcu-0.6.7-missing-gnu-source.patch |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 package/liburcu/liburcu-0.6.7-missing-gnu-source.patch

diff --git a/package/liburcu/liburcu-0.6.7-missing-gnu-source.patch b/package/liburcu/liburcu-0.6.7-missing-gnu-source.patch
new file mode 100644
index 0000000..f34120c
--- /dev/null
+++ b/package/liburcu/liburcu-0.6.7-missing-gnu-source.patch
@@ -0,0 +1,13 @@
+Define _GNU_SOURCE to access CPU_ZERO() macro in uClibc
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: userspace-rcu-0.6.7/tests/urcutorture.c
+===================================================================
+--- userspace-rcu-0.6.7.orig/tests/urcutorture.c	2012-02-01 10:17:09.938804402 +0100
++++ userspace-rcu-0.6.7/tests/urcutorture.c	2012-02-01 10:17:15.308713372 +0100
+@@ -1,3 +1,4 @@
++#define _GNU_SOURCE
+ #include <string.h>
+ #include <sys/time.h>
+ #include <poll.h>
-- 
1.7.4.1
