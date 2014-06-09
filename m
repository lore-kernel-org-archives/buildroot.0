From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 14:39:18 +0200
Subject: [Buildroot] [git commit] linux-zigbee: add missing comment for
	thread dependency
Message-ID: <20140609123933.AA9129C2A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ce2382251e849d294cd6fec14a472c0f5ed669a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-zigbee/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/linux-zigbee/Config.in b/package/linux-zigbee/Config.in
index ef7c760..555e859 100644
--- a/package/linux-zigbee/Config.in
+++ b/package/linux-zigbee/Config.in
@@ -1,3 +1,6 @@
+comment "linux-zigbee needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LINUX_ZIGBEE
 	bool "linux-zigbee"
 	depends on BR2_USE_MMU # fork()
