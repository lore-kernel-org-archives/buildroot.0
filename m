From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 23:36:07 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] support/testing:
 TestInitSystemSystemdRwIfupdown test expect a RW rootfs
Message-ID: <20201113222248.0213183B8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31c336fb8e56e3527b57b28d6b48af70bab50d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

When running the TestInitSystemSystemdRwIfupdown test, the rootfs must
be in read-write mode. The commit log [1] introducing systemd tests say
so:

"basic systemd, read-write, network w/ ifupdown"

With systemd 246.5, the service systemd-update-done return an error code
when it can't write on the filesystem (/etc)

[1] 117835d5fcd508f301d62dd08ee658c1982c7fa7
[2] https://github.com/systemd/systemd/commit/8019995e9af9c6d7b5985198cedccd24eda3e26e

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981813

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 14ed65e3a62999a7cef55c357b18789451522340)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/init/test_systemd.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 0ac18cb623..47c1ecfbfd 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -89,7 +89,6 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         """
         BR2_SYSTEM_DHCP="eth0"
         # BR2_PACKAGE_SYSTEMD_NETWORKD is not set
-        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
         BR2_TARGET_ROOTFS_EXT2=y
         """
 
