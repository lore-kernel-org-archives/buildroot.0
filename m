From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Sep 2009 14:16:40 +0200
Subject: [Buildroot] [git commit master] busybox: don't default to long gone
	file for snapshot config
Message-ID: <20090915121848.CEE37764B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6804b484a90d19eabcdac7fc7b02d2e9cdbc1693
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 72cbd12..378f2c1 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -59,7 +59,7 @@ config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
 	depends on BR2_PACKAGE_BUSYBOX
-	default "target/device/x86/i386/busybox.config" if BR2_PACKAGE_BUSYBOX_SNAPSHOT
+	default "package/busybox/busybox-1.13.x.config" if BR2_PACKAGE_BUSYBOX_SNAPSHOT
 	default "package/busybox/busybox-1.11.x.config" if BR2_BUSYBOX_VERSION_1_12_X
 	default "package/busybox/busybox-1.13.x.config" if BR2_BUSYBOX_VERSION_1_13_X
 	default "package/busybox/busybox-1.13.x.config" if BR2_BUSYBOX_VERSION_1_14_X
-- 
1.6.3.3
