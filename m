From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Sep 2013 12:54:29 +0200
Subject: [Buildroot] [git commit] netplug: needs mmu
Message-ID: <20130911110611.C752881DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e9ff55f3f7769e33e7ebf3b67ee9732496da12a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netplug/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netplug/Config.in b/package/netplug/Config.in
index 5c9bca6..593c08a 100644
--- a/package/netplug/Config.in
+++ b/package/netplug/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETPLUG
 	bool "netplug"
+	depends on BR2_USE_MMU # fork()
 	help
 	  A Linux daemon that manages network interfaces in
 	  response to network cables being plugged in and out.
