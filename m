From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 13 Oct 2014 09:45:47 +0200
Subject: [Buildroot] [PATCH] openssh: place configuration files in /etc/ssh
Message-ID: <1413186347-8484-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkg-autotools.mk fix --sysconfdir to "/etc". This patch restore
--sysconfdir to its default value (/etc/ssh)

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/openssh/openssh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 17097d5..e2f2663 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -9,7 +9,7 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
-OPENSSH_CONF_OPTS = --disable-lastlog --disable-utmp \
+OPENSSH_CONF_OPTS = --sysconfdir=/etc/ssh --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
 
 # uClibc toolchain for ARC doesn't support PIE at the moment
-- 
1.9.1
