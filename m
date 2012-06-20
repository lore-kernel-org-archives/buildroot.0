From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Jun 2012 22:45:10 +0200
Subject: [Buildroot] [git commit] kmod: _TOOLS option should only be visible
	if kmod is enabled
Message-ID: <20120620210019.B88DB85780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93216b641986ac2271430aab5ebbfa33e8d393a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/kmod/Config.in b/package/kmod/Config.in
index 26c2c6d..4965237 100644
--- a/package/kmod/Config.in
+++ b/package/kmod/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_KMOD
 
 config BR2_PACKAGE_KMOD_TOOLS
 	bool "kmod utilities"
+	depends on BR2_PACKAGE_KMOD
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
 	  Install kmod module utilities (depmod, insmod, lsmod,
