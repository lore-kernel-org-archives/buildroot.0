From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 16:32:07 +0200
Subject: [Buildroot] [git commit] busybox: register mdev as hotplug helper
	when selected
Message-ID: <20130728143214.749C19AD30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=caae7fa1d737c550b4a2f557d6e1761b93934340
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's also done in the kernel configuration, however users may be using
some other pre-built kernel and miss functionality like firmware
loading.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/S10mdev |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
index c06aa20..d386d42 100644
--- a/package/busybox/S10mdev
+++ b/package/busybox/S10mdev
@@ -6,6 +6,7 @@
 case "$1" in
   start)
 	echo "Starting mdev..."
+	echo /sbin/mdev >/proc/sys/kernel/hotplug
 	/sbin/mdev -s
 	;;
   stop)
