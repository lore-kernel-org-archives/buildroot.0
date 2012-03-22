From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Mar 2012 22:47:59 +0100
Subject: [Buildroot] [git commit] kmod: only show tools option if
	BUSYBOX_SHOW_OTHERS
Message-ID: <20120322214834.89F539693A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5347910b9d60cdd11cf7c4dc7dbfdd4cebacb651
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out by Arnout.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/kmod/Config.in b/package/kmod/Config.in
index 6fdd92c..26c2c6d 100644
--- a/package/kmod/Config.in
+++ b/package/kmod/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_KMOD
 
 config BR2_PACKAGE_KMOD_TOOLS
 	bool "kmod utilities"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Install kmod module utilities (depmod, insmod, lsmod,
 	  modinfo, modprobe, rmmod).
