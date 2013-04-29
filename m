From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Apr 2013 08:49:03 +0200
Subject: [Buildroot] [git commit] tcpreplay: needs MMU
Message-ID: <20130429064957.9285A9B8D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4460c401976d7335e8cf5555331c468822de77cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/e95f23f79ba139681fb1e51375719329afe7e22c

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tcpreplay/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
index 6d3a3bf..7337070 100644
--- a/package/tcpreplay/Config.in
+++ b/package/tcpreplay/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TCPREPLAY
 	bool "tcpreplay"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  Tcpreplay is a tool for replaying network traffic from files saved
