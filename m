From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 22:04:39 +0100
Subject: [Buildroot] [git commit branch/next] package/systemd: bump to
 version 245
Message-ID: <20200307213520.677B48FCF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b634af44271384f6cbd0c44dd3cf34181fb0437
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disabled new modules for now.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 5d3a8e83b1..4567812cf6 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256	06e604e5484ec03ff763ae680c8b52c33fedcce95a773944f27816fde68503d7	systemd-244.1.tar.gz
+sha256	6dc956a857c889d6f3cf7d768d4836db48a39e5bef5dd930fbed697ab2421a61	systemd-245.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
 sha256	ca008b0178b6390e874f6e4a890fbed482b0fb946159a3b1d370bd8d2327d9bc	README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 6e31a14ac3..1c3b81cfcb 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 244.1
+SYSTEMD_VERSION = 245
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
@@ -41,6 +41,9 @@ SYSTEMD_CONF_OPTS += \
 	-Dumount-path=/usr/bin/umount \
 	-Dnobody-group=nogroup \
 	-Didn=true \
+	-Drepart=false \
+	-Duserdb=false \
+	-Dhomed=false \
 	-Dnss-systemd=true
 
 ifeq ($(BR2_PACKAGE_ACL),y)
@@ -511,6 +514,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dtpm=false \
 	-Denvironment-d=false \
 	-Dbinfmt=false \
+	-Drepart=false \
 	-Dcoredump=false \
 	-Dpstore=false \
 	-Dlogind=false \
@@ -518,6 +522,8 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dlocaled=false \
 	-Dmachined=false \
 	-Dportabled=false \
+	-Duserdb=false \
+	-Dhomed=false \
 	-Dnetworkd=false \
 	-Dtimedated=false \
 	-Dtimesyncd=false \
