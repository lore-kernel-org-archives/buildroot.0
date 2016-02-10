From: Gabe Evans <gabe@hashrabbit.co>
Date: Wed, 10 Feb 2016 23:44:04 +0000
Subject: [Buildroot] [PATCH v2 2/2] systemd: remove redundant configure
	options
In-Reply-To: <1455147844-4918-1-git-send-email-gabe@hashrabbit.co>
References: <1454971831-11139-1-git-send-email-gabe@hashrabbit.co>
 <1455147844-4918-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1455147844-4918-2-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 * --with-dbuspolicydir, --with-dbussessionservicedir, and
   --with-dbussystemservicedir are no longer needed since these are
   defaults in recent releases.

 * --disable-dbus has no effect when combined with --disable-tests. The
   option itself only applies to tests, not the runtime.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v1 -> v2:
  - split changes into two separate commits (suggested by Arnout)
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
-- 
1.9.1
