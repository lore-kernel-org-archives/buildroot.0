From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 Feb 2012 11:00:32 +0100
Subject: [Buildroot] [git commit] liburcu: add patch to fix build with uClibc
Message-ID: <20120205134245.247F78F546@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8f71a4c5695657c4deb5557b990b614a6a45488
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Under uClibc, defining _GNU_SOURCE is strictly needed to access the
CPU_*() macros.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../liburcu/liburcu-0.6.7-missing-gnu-source.patch |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

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
