From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Sep 2013 13:05:01 +0200
Subject: [Buildroot] [git commit] package: drop unneeded 'call' from
	{generic, autotools}-package invocation
Message-ID: <20130911110612.0568E81DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be7f613b90b01cdad0e1348ead3d70f72cbcbab2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dhcpcd/dhcpcd.mk                   |    2 +-
 package/jquery-keyboard/jquery-keyboard.mk |    2 +-
 package/wireshark/wireshark.mk             |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 9d4a72b..5296db8 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -39,4 +39,4 @@ endef
 # NOTE: Even though this package has a configure script, it is not generated
 # using the autotools, so we have to use the generic package infrastructure.
 
-$(eval $(call generic-package))
+$(eval $(generic-package))
diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
index 0d9b69b..c429f16 100644
--- a/package/jquery-keyboard/jquery-keyboard.mk
+++ b/package/jquery-keyboard/jquery-keyboard.mk
@@ -22,4 +22,4 @@ define JQUERY_KEYBOARD_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/var/www/layouts
 endef
 
-$(eval $(call generic-package))
+$(eval $(generic-package))
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index a61e017..a105e52 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -20,4 +20,4 @@ WIRESHARK_CONF_OPT = --disable-wireshark --without-krb5 --disable-usr-local \
 		     --enable-static=no --with-gnutls=no --with-libsmi=no \
 		     --includedir=$(STAGING_DIR)/usr/include
 
-$(eval $(call autotools-package))
+$(eval $(autotools-package))
