From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 05 Aug 2013 15:32:52 +0200
Subject: [Buildroot] [PATCH] zeromq: fix build on some compilers due to
	missing newline
Message-ID: <480a1fcd09d3f0e40732.1375709572@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/645b357d470b75baa9a93eb5be4f1dc5c8c337fa/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/zeromq/zeromq-0001-test-collect-delay-end-of-line.patch |  15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/zeromq/zeromq-0001-test-collect-delay-end-of-line.patch b/package/zeromq/zeromq-0001-test-collect-delay-end-of-line.patch
new file mode 100644
--- /dev/null
+++ b/package/zeromq/zeromq-0001-test-collect-delay-end-of-line.patch
@@ -0,0 +1,15 @@
+test_connect_delay: add missing newline at end of file
+
+Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
+Backported-from: https://github.com/zeromq/zeromq3-x/commit/143ae519b4a325bb68d29e6f7e00cb98a440dd12
+
+diff --git a/tests/test_connect_delay.cpp b/tests/test_connect_delay.cpp
+--- a/tests/test_connect_delay.cpp
++++ b/tests/test_connect_delay.cpp
+@@ -257,4 +257,4 @@ int main (void)
+     
+     rc = zmq_ctx_destroy(context2);
+     assert (rc == 0);
+-}
+\ No newline at end of file
++}
