From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 18:52:22 +0200
Subject: [Buildroot] [git commit] package/bluez5_utils: security bump
	version to 5.47
Message-ID: <20170917164500.EA01F80FB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48fec2f39f31416e2066396dfa7dc05cae3a956c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-1000250 - All versions of the SDP server in BlueZ 5.46 and
earlier are vulnerable to an information disclosure vulnerability which
allows remote attackers to obtain sensitive information from the bluetoothd
process memory.  This vulnerability lies in the processing of SDP search
attribute requests.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez5_utils/bluez5_utils.hash | 2 +-
 package/bluez5_utils/bluez5_utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index bc20d22..36791c9 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256 ddab3d3837c1afb8ae228a94ba17709a4650bd4db24211b6771ab735c8908e28  bluez-5.46.tar.xz
+sha256 cf75bf7cd5d564f21cc4a2bd01d5c39ce425397335fd47d9bbe43af0a58342c8  bluez-5.47.tar.xz
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 13658cd..1bc6969 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ5_UTILS_VERSION = 5.46
+BLUEZ5_UTILS_VERSION = 5.47
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
