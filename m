From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  5 Feb 2019 10:45:42 +0100
Subject: [Buildroot] [PATCH 3/3] support/testing: test_dropbear.py: drop ssh
 port forward to the host
In-Reply-To: <20190205094542.12783-1-peter@korsgaard.com>
References: <20190205094542.12783-1-peter@korsgaard.com>
Message-ID: <20190205094542.12783-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is not used and may conflict with other services running on port 2222 on
the host machine.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_dropbear.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_dropbear.py b/support/testing/tests/package/test_dropbear.py
index ad0f89316c..bfec8701f2 100644
--- a/support/testing/tests/package/test_dropbear.py
+++ b/support/testing/tests/package/test_dropbear.py
@@ -21,7 +21,7 @@ class TestDropbear(infra.basetest.BRTest):
                            kernel="builtin",
                            options=["-initrd", img,
                                     "-net", "nic",
-                                    "-net", "user,hostfwd=tcp::2222-:22"])
+                                    "-net", "user"])
         self.emulator.login(self.passwd)
         cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:22"
         _, exit_code = self.emulator.run(cmd)
-- 
2.11.0
