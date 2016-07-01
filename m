From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:28 +0200
Subject: [Buildroot] [PATCH 28/31] package/systemd: Force enable blkid
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-28-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since systemd select BR2_PACKAGE_UTIL_LINUX_LIBBLKID, we can safely
force this option.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 08c60df..8b8d124 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -27,6 +27,7 @@ endif
 
 SYSTEMD_CONF_OPTS += \
 	--with-rootprefix= \
+	--enable-blkid \
 	--enable-static=no \
 	--disable-manpages \
 	--disable-selinux \
-- 
2.8.1
