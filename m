From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:09:39 +0200
Subject: [Buildroot] [git commit] package/enlightenment: enable systemd
	support
Message-ID: <20160723130944.73FED818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46a95d37d11aa0ddfab15ac54fcf688f8e52cdce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/enlightenment/enlightenment.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index e8fee3f..2440cec 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -22,8 +22,14 @@ ENLIGHTENMENT_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 	--disable-pam \
-	--disable-rpath \
-	--disable-systemd
+	--disable-rpath
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+ENLIGHTENMENT_CONF_OPTS += --enable-systemd
+ENLIGHTENMENT_DEPENDENCIES += systemd
+else
+ENLIGHTENMENT_CONF_OPTS += --disable-systemd
+endif
 
 # uClibc has an old incomplete sys/ptrace.h for powerpc & sparc
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_powerpc)$(BR2_sparc),yy)
