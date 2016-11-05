From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 23:31:55 +0100
Subject: [Buildroot] [git commit branch/next] package/sudo: add optional
	support for zlib
Message-ID: <20161105223210.4C20280049@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bd23d2dc23add4db2c4321c3da096cc916fb999
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sudo/sudo.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index f28312a..89859dd 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -30,6 +30,13 @@ else
 SUDO_CONF_OPTS += --without-pam
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+SUDO_CONF_OPTS += --enable-zlib
+SUDO_DEPENDENCIES += zlib
+else
+SUDO_CONF_OPTS += --disable-zlib
+endif
+
 # mksigname/mksiglist needs to run on build host to generate source files
 define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
 	$(MAKE) $(HOST_CONFIGURE_OPTS) \
