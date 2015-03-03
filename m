From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:19 +0100
Subject: [Buildroot] [RFC v3 14/30] openssh: add support to the per-package
	staging directory.
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-15-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add "-L$(STAGING_DIR)/usr/lib" to the LDFLAGS environment variable to be
used by the configure script.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/openssh/openssh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index be471b6..22cdb12 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -8,7 +8,7 @@ OPENSSH_VERSION = 6.7p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
-OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
+OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS) -L$(STAGING_DIR)/usr/lib"
 OPENSSH_CONF_OPTS = \
 	--sysconfdir=/etc/ssh \
 	--disable-lastlog \
-- 
2.3.1
