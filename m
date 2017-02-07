From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 09:45:04 +0100
Subject: [Buildroot] [git commit] drbd-utils: fix typo in variable name
Message-ID: <20170207090318.9F1B381D3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fc343059a4eb8129039d1fe01a9fe1ec2c55b00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out during the check-package discussion, there is a typo in a
variable name:

http://lists.busybox.net/pipermail/buildroot/2016-December/180765.html

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/drbd-utils/drbd-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
index 88d2729..eb6042d 100644
--- a/package/drbd-utils/drbd-utils.mk
+++ b/package/drbd-utils/drbd-utils.mk
@@ -14,14 +14,14 @@ DRBD_UTILS_CONF_OPTS = --with-distro=generic --without-manual
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 DRBD_UTILS_CONF_OPTS += --with-initscripttype=systemd
-DRDB_UTILS_DEPENDENCIES += systemd
+DRBD_UTILS_DEPENDENCIES += systemd
 else
 DRBD_UTILS_CONF_OPTS += --with-initscripttype=sysv
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 DRBD_UTILS_CONF_OPTS += --with-udev=yes
-DRDB_UTILS_DEPENDENCIES += udev
+DRBD_UTILS_DEPENDENCIES += udev
 else
 DRBD_UTILS_CONF_OPTS += --with-udev=no
 endif
