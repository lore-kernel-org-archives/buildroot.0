From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 22:29:56 +0200
Subject: [Buildroot] [git commit] package/lirc-tools: add optional support
	for libusb-compat
Message-ID: <20160626203108.A06DB802D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b6e482d88705cd9f3b2eac18b2db85178d80536
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lirc-tools has optional support for libusb-compat, see configure.ac,
line 199+.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lirc-tools/lirc-tools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index d7f2353..2fd6643 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -18,6 +18,10 @@ LIRC_TOOLS_AUTORECONF = YES
 LIRC_TOOLS_CONF_ENV = XSLTPROC=yes
 LIRC_TOOLS_CONF_OPTS = --without-x
 
+ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
+LIRC_TOOLS_DEPENDENCIES += libusb-compat
+endif
+
 define LIRC_TOOLS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/lirc-tools/S25lircd \
 		$(TARGET_DIR)/etc/init.d/S25lircd
