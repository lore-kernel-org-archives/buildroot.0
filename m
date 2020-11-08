From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  8 Nov 2020 21:53:44 +0100
Subject: [Buildroot] [PATCH] support/testing/tests/init/test_systemd: update
 to BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
Message-ID: <20201108205344.3887700-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commit [1] moved systemd-journal-gatewayd into systemd-journal-remote
option. Update to BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE in the testsuite
when BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY is used.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981805
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981811

[1] e46fe9a6f2b7cef9789f5172332067cac5ff03bd

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/init/test_systemd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 371be4ad7d..65c06d21b7 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -106,7 +106,7 @@ class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
         """
         BR2_SYSTEM_DHCP="eth0"
         # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
-        BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=y
+        BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE=y
         BR2_PACKAGE_SYSTEMD_BACKLIGHT=y
         BR2_PACKAGE_SYSTEMD_BINFMT=y
         BR2_PACKAGE_SYSTEMD_COREDUMP=y
@@ -136,7 +136,7 @@ class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
         BR2_SYSTEM_DHCP="eth0"
-        BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=y
+        BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE=y
         BR2_PACKAGE_SYSTEMD_BACKLIGHT=y
         BR2_PACKAGE_SYSTEMD_BINFMT=y
         BR2_PACKAGE_SYSTEMD_COREDUMP=y
-- 
2.25.4
