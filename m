From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 22:22:48 +0100
Subject: [Buildroot] [git commit] package/dovecot-pigeonhole: New package
Message-ID: <20141030212540.77031B2340@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fd587606e10f085a3f0dcd98e54da1943ca75de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dovecot-pigeonhole/Config.in             |    8 ++++++++
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk |   16 ++++++++++++++++
 package/dovecot/Config.in                        |    2 ++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/dovecot-pigeonhole/Config.in b/package/dovecot-pigeonhole/Config.in
new file mode 100644
index 0000000..83f5287
--- /dev/null
+++ b/package/dovecot-pigeonhole/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DOVECOT_PIGEONHOLE
+	bool "dovecot-pigeonhole"
+	help
+	  Pigeonhole is the name of the project that adds support for the Sieve
+	  language (RFC 5228) and the ManageSieve protocol (RFC 5804) to the
+	  Dovecot Secure IMAP Server.
+
+	  http://pigeonhole.dovecot.org
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
new file mode 100644
index 0000000..15f421c
--- /dev/null
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# dovecot-pigeonhole
+#
+################################################################################
+
+DOVECOT_PIGEONHOLE_VERSION = 0.4.4
+DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
+DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
+DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1
+DOVECOT_PIGEONHOLE_LICENSE_FILES = COPYING
+DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
+
+DOVECOT_PIGEONHOLE_CONF_OPTS = --with-dovecot=$(STAGING_DIR)/usr/lib
+
+$(eval $(autotools-package))
diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 43a0bbf..17c914d 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -49,6 +49,8 @@ config BR2_PACKAGE_DOVECOT_ZLIB
 	help
 	  Enable zlib support.
 
+source package/dovecot-pigeonhole/Config.in
+
 endif # BR2_PACKAGE_DOVECOT
 
 comment "dovecot needs a toolchain w/ IPv6"
