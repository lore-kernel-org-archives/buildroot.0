From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 23:56:36 +0200
Subject: [Buildroot] [git commit] dbus: don't forcibly disable static builds
Message-ID: <20140618220023.41FF09D018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35b6b8b804d32724d166eec6679ff353f00cdb72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's there for some historical reason and breaks libpcap with dbus
support for static linkage scenarios (like the one used by tcpreplay).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index f8824ee..fc446b1 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -24,7 +24,6 @@ DBUS_CONF_OPT = --with-dbus-user=dbus \
 		--disable-selinux \
 		--disable-xml-docs \
 		--disable-doxygen-docs \
-		--disable-static \
 		--disable-dnotify \
 		--localstatedir=/var \
 		--with-xml=expat \
@@ -90,7 +89,6 @@ HOST_DBUS_CONF_OPT = \
 		--disable-selinux \
 		--disable-xml-docs \
 		--disable-doxygen-docs \
-		--disable-static \
 		--enable-dnotify \
 		--without-x \
 		--with-xml=expat
