From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 19:22:40 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: uses fork(),
	not available on no-MMU platforms
Message-ID: <20141012172417.E4440B03FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=962e08e89b161f8bee6bd45cab56e32c90521af5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The only package selecting wpa_supplicant is connman, and it is
already depends on BR2_USE_MMU.

Fixes:

  http://autobuild.buildroot.org/results/9ac/9ac3c0de573f5266a889f1ceb6d43aa92f715c55/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 6b1c492..6ebd2fe 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WPA_SUPPLICANT
 	bool "wpa_supplicant"
+	depends on BR2_USE_MMU # fork()
 	depends on !BR2_avr32 # no epoll_create1
 	help
 	  WPA supplicant for secure wireless networks
