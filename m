From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 11:49:59 +0100
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/init/test_systemd: update to
 BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE
Message-ID: <20201117203827.F27687FD00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1989a49feb47b3fbefec8d178b1aac1a1a2e6399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The commit [1] moved systemd-journal-gatewayd into systemd-journal-remote
option. Update to BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE in the testsuite
when BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY is used.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981805
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981811

[1] e46fe9a6f2b7cef9789f5172332067cac5ff03bd

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/init/test_systemd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 059fb397e8..c0ef5e1202 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -105,7 +105,7 @@ class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
         """
         BR2_SYSTEM_DHCP="eth0"
         # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
-        BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=y
+        BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE=y
         BR2_PACKAGE_SYSTEMD_BACKLIGHT=y
         BR2_PACKAGE_SYSTEMD_BINFMT=y
         BR2_PACKAGE_SYSTEMD_COREDUMP=y
@@ -135,7 +135,7 @@ class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
         BR2_SYSTEM_DHCP="eth0"
-        BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY=y
+        BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE=y
         BR2_PACKAGE_SYSTEMD_BACKLIGHT=y
         BR2_PACKAGE_SYSTEMD_BINFMT=y
         BR2_PACKAGE_SYSTEMD_COREDUMP=y
