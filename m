From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Sep 2013 10:05:38 +0200
Subject: [Buildroot] [PATCH] zeromq: remove unneeded patch after version bump
Message-ID: <1379750738-6358-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit b3c525b886b375256a8e0d60a749ea07f6591974 has bumped zeromq to
version 2.3.4, which makes the patch
zeromq-0001-test-collect-delay-end-of-line.patch unneeded since it has
been merged upstream.

Fixes:

  http://autobuild.buildroot.org/results/e8c/e8c8ba8c31fd081c34c8772790d4c581eb3ec3ed/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../zeromq-0001-test-collect-delay-end-of-line.patch      | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 package/zeromq/zeromq-0001-test-collect-delay-end-of-line.patch

diff --git a/package/zeromq/zeromq-0001-test-collect-delay-end-of-line.patch b/package/zeromq/zeromq-0001-test-collect-delay-end-of-line.patch
deleted file mode 100644
index 6a1a655..0000000
--- a/package/zeromq/zeromq-0001-test-collect-delay-end-of-line.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-test_connect_delay: add missing newline at end of file
-
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-Backported-from: https://github.com/zeromq/zeromq3-x/commit/143ae519b4a325bb68d29e6f7e00cb98a440dd12
-
-diff --git a/tests/test_connect_delay.cpp b/tests/test_connect_delay.cpp
---- a/tests/test_connect_delay.cpp
-+++ b/tests/test_connect_delay.cpp
-@@ -257,4 +257,4 @@ int main (void)
-     
-     rc = zmq_ctx_destroy(context2);
-     assert (rc == 0);
--}
-\ No newline at end of file
-+}
-- 
1.8.1.2
