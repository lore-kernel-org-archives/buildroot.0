From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 16:21:43 +0200
Subject: [Buildroot] [git commit] ympd: Depends on MMU
Message-ID: <20141007142249.294C0B0D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0054f12575265ae09e87163aec7d8fe1260e8b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package needs MMU. Hence added dependency on BR2_USE_MMU

Fixes:
http://autobuild.buildroot.net/results/834/8340e69763e263fcf20e73f75eafcb31989e9f51//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ympd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ympd/Config.in b/package/ympd/Config.in
index 0223af7..38a0cf9 100644
--- a/package/ympd/Config.in
+++ b/package/ympd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_YMPD
 	bool "ympd"
 	select BR2_PACKAGE_LIBMPDCLIENT
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_LARGEFILE
 	help
