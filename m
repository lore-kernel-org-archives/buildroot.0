From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2016 23:41:14 +0100
Subject: [Buildroot] [git commit] systemd: remove redundant configure options
Message-ID: <20160214225054.1968A7FF81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2c8d0efbfea1fc5d482a89b8108217de4105d61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* --with-dbuspolicydir, --with-dbussessionservicedir, and
   --with-dbussystemservicedir are no longer needed since these are
   defaults in recent releases.

 * --disable-dbus has no effect when combined with --disable-tests. The
   option itself only applies to tests, not the runtime.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2340963..05121cf 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -32,14 +32,10 @@ SYSTEMD_CONF_OPTS += \
 	--disable-selinux \
 	--disable-pam \
 	--disable-libcryptsetup \
-	--with-dbuspolicydir=/etc/dbus-1/system.d \
-	--with-dbussessionservicedir=/usr/share/dbus-1/services \
-	--with-dbussystemservicedir=/usr/share/dbus-1/system-services \
 	--disable-efi \
 	--disable-gnuefi \
 	--disable-ldconfig \
 	--disable-tests \
-	--disable-dbus \
 	--without-python
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto
