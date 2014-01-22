From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 22:07:18 +0100
Subject: [Buildroot] [git commit] connman: enable systemd unit-files
	installation
Message-ID: <20140122210913.ACB3C9C5C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8157159b22efa774cb94030e5a079e628b0cea67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/connman.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
