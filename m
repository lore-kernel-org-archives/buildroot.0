From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 22 Jan 2014 21:59:40 +0100
Subject: [Buildroot] [PATCH v2 4/5] connman: enable systemd unit-files
	installation
In-Reply-To: <1390424381-6889-1-git-send-email-s.martin49@gmail.com>
References: <1390424381-6889-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390424381-6889-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- split patch: one for sysvinit, the other for systemd init (Yann)
- use connman configure option to install the unit-files (LucasDM)
---
 package/connman/connman.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 1979454..e0ae7a6 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -18,7 +18,8 @@ CONNMAN_CONF_OPT += --localstatedir=/var \
 	$(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth)	\
 	$(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)	\
 	$(if $(BR2_PACKAGE_CONNMAN_NEARD),--enable-neard,--disable-neard) \
-	$(if $(BR2_PACKAGE_CONNMAN_OFONO),--enable-ofono,--disable-ofono)
+	$(if $(BR2_PACKAGE_CONNMAN_OFONO),--enable-ofono,--disable-ofono) \
+	$(if $(BR2_INIT_SYSTEMD),--with-systemdunitdir=/usr/lib/systemd/system)
 
 CONNMAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_CONNMAN_NEARD),neard) \
-- 
1.8.5.3
