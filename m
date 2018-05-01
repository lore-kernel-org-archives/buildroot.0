From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 21:41:44 +0200
Subject: [Buildroot] [git commit] bluez-alsa: fix select of libbsd
Message-ID: <20180501194213.657B085200@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb0432ca624c24801f7b74c5e805442ec85018fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bluez-alsa/Config.in must select BR2_PACKAGE_LIBBSD, not the
non-existing BR2_PACKAGE_BSD.

Fixes:

  http://autobuild.buildroot.net/results/ab6751615ac058d892258be9e7a8e110e68c62c5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez-alsa/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
index f082f4b838..1753da48f9 100644
--- a/package/bluez-alsa/Config.in
+++ b/package/bluez-alsa/Config.in
@@ -21,7 +21,7 @@ if BR2_PACKAGE_BLUEZ_ALSA
 config BR2_PACKAGE_BLUEZ_ALSA_HCITOP
 	bool "hcitop"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	select BR2_PACKAGE_BSD
+	select BR2_PACKAGE_LIBBSD
 	select BR2_PACKAGE_NCURSES
 	help
 	  Enable top-like monitoring tool for HCI.
