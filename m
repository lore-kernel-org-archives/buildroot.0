From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Mar 2013 15:51:01 +0100
Subject: [Buildroot] [git commit] htop: needs MMU
Message-ID: <20130305145044.8A2589AED5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83287ee571db6ffd876c90b6db12fa59be87ae67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/023b40f48c8006cd49c585efae3cfa065b21bf51

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/htop/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/htop/Config.in b/package/htop/Config.in
index 55b4b15..51304af 100644
--- a/package/htop/Config.in
+++ b/package/htop/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HTOP
 	bool "htop"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  htop is an interactive text-mode process viewer for Linux.
