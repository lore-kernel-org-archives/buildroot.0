From: Markos Chandras <markos.chandras@imgtec.com>
Date: Mon, 2 Apr 2012 15:15:54 +0100
Subject: [Buildroot] [PATCH] rt-tests: Make it available only when NPLT is
	selected
Message-ID: <1333376154-20432-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rt-tests package requires some definitions (like PTHREAD_PRIO_INHERIT etc) which
are only available in Native Posix Linux Thread implementation.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/rt-tests/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index e645266..0043989 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -1,3 +1,4 @@
+if BR2_PTHREADS_NATIVE
 config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	help
@@ -11,3 +12,4 @@ config BR2_PACKAGE_RT_TESTS
 	  Buildroot configuration.
 
 	  http://rt.wiki.kernel.org
+endif
-- 
1.7.1
