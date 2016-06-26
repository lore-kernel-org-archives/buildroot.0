From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 22:30:13 +0200
Subject: [Buildroot] [git commit] package/lirc-tools: add optional support
	for udev
Message-ID: <20160626203108.B721C802D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c104e3df2c9f11e496736786c4f8bbc5c2abe72f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lirc-tools has optional support for udev, see configure.ac, line 303+.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lirc-tools/lirc-tools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 2fd6643..0c9eaa3 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -18,6 +18,10 @@ LIRC_TOOLS_AUTORECONF = YES
 LIRC_TOOLS_CONF_ENV = XSLTPROC=yes
 LIRC_TOOLS_CONF_OPTS = --without-x
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIRC_TOOLS_DEPENDENCIES += udev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
 LIRC_TOOLS_DEPENDENCIES += libusb-compat
 endif
