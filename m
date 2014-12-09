From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Dec 2014 14:29:52 +0100
Subject: [Buildroot] [git commit] package/musl: remove obsolete setting of
	prefix
Message-ID: <20141209133124.5B395800B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=424abf2f1b238cfe822a8457497ca8c89536108b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using the config option '--libdir=/lib' makes the setting of prefix to an
empty path obsolete in MUSL_INSTALL_TARGET_CMDS.

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/musl.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 3a45575..1f1af05 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -40,11 +40,9 @@ define MUSL_INSTALL_STAGING_CMDS
 		DESTDIR=$(STAGING_DIR) install-libs install-tools install-headers
 endef
 
-# prefix is set to an empty value to get the C library installed in
-# /lib and not /usr/lib
 define MUSL_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) prefix= install-libs
+		DESTDIR=$(TARGET_DIR) install-libs
 	$(RM) $(addprefix $(TARGET_DIR)/lib/,crt1.o crtn.o crti.o Scrt1.o)
 endef
 
