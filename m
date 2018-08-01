From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 14:14:47 +0200
Subject: [Buildroot] [git commit] package/polkit: bump version to 1.105
Message-ID: <20180801120914.EC9DF88D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0e3e978d1288d954a7d4822c425e3f844075105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build issue with network-manager package when polkit package is
enabled:

  CCLD     clients/cli/nmcli
clients/common/clients_cli_nmcli-nm-polkit-listener.o: In function `compare_users':
nm-polkit-listener.c:(.text.compare_users+0x48): undefined reference to `polkit_unix_user_get_name'
clients/common/clients_cli_nmcli-nm-polkit-listener.o: In function `initiate_authentication':
nm-polkit-listener.c:(.text.initiate_authentication+0x1c4): undefined reference to `polkit_unix_user_get_name'

Happening with the following defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y
BR2_PACKAGE_NETWORK_MANAGER=y
BR2_PACKAGE_SYSTEMD_POLKIT=y

Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>
[Thomas: update hash file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/polkit/polkit.hash | 2 +-
 package/polkit/polkit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
index 5e133b43e2..1fe8607fbf 100644
--- a/package/polkit/polkit.hash
+++ b/package/polkit/polkit.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	36607c8ce576980ee55bd12bab1944f13217eb8e9d04ab56022545861ece3bc5	polkit-0.103.tar.gz
+sha256	8fdc7cc8ba4750fcce1a4db9daa759c12afebc7901237e1c993c38f08985e1df	polkit-0.105.tar.gz
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index e283181427..fb4c171c52 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POLKIT_VERSION = 0.103
+POLKIT_VERSION = 0.105
 POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
 POLKIT_LICENSE = GPL-2.0
 POLKIT_LICENSE_FILES = COPYING
