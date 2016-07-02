From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 13:07:15 +0200
Subject: [Buildroot] [git commit] package/systemd: Force enable blkid
Message-ID: <20160702110929.56CC881D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6613e086f4f8877a46161b1658b89d894ad5e8c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since systemd select BR2_PACKAGE_UTIL_LINUX_LIBBLKID, we can safely
force this option.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3baa6e7..423afcc 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -27,6 +27,7 @@ endif
 
 SYSTEMD_CONF_OPTS += \
 	--with-rootprefix= \
+	--enable-blkid \
 	--enable-static=no \
 	--disable-manpages \
 	--disable-selinux \
