From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 22:29:25 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: disable for avr32
Message-ID: <20140622202943.4A8BD9D063@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=815e4063f762c02aff1242bf220af60bc1737292
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/209/20908f479b33c1e2952622f5e8ad6b60d58af693/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wpa_supplicant/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 5cb3f1b..81c61ac 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WPA_SUPPLICANT
 	bool "wpa_supplicant"
+	depends on !BR2_avr32 # no epoll_create1
 	help
 	  WPA supplicant for secure wireless networks
 
