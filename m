From: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
Date: Thu, 26 Mar 2020 14:24:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/connman: fix build failure on x86_64
Message-ID: <20200326132401.GA30508@P-NAN-EREVAN-mikbou>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new Connman 1.38 release uses 'WireGuard' and 'libmnl' by default now.

But to keep the same 'Connman' setup as previous setup, we need to
explicitly disable the 'WireGuard' support.

The support of all the new 'Connman' options will be done after.

Fixes:
http://autobuild.buildroot.org/results/dd8/dd8a68827ca70838c59d82780cb3eadf6b9764c2/

Signed-off-by: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
---
 package/connman/connman.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 701be8b59d..251998d0dd 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -14,6 +14,8 @@ CONNMAN_LICENSE_FILES = COPYING
 
 CONNMAN_CONF_OPTS = --with-dbusconfdir=/etc
 
+CONNMAN_CONF_OPTS += --disable-wireguard
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 CONNMAN_CONF_OPTS += --with-systemdunitdir=/usr/lib/systemd/system
 endif
-- 
2.20.1
