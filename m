From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 21 Jun 2012 16:56:33 +0200
Subject: [Buildroot] [git commit] collectd: uses fork(),
	so mark it as mmu only
Message-ID: <20120621145705.1134D85758@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27c9d826ffca35ddec8355095d3b3682ed7d04c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/collectd/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 96438c0..4fae6d5 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_COLLECTD
 	bool "collectd"
+	# Uses fork()
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  collectd is a daemon which collects system performance
