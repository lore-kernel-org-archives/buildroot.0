From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Jul 2020 09:10:16 +0200
Subject: [Buildroot] [git commit] package/dbus: disable systemd for host
 build
Message-ID: <20200731071037.098C7825F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bfdb3d08daa0a516525965e00ccabdb8a714b39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes an issue if host-dbus happens to be rebuilt after systemd, in
which case it autodetects systemd support but then ignored the prefix
when installing unit files.  That means that is tries to write to the
host system's /usr/lib/ which fails.

There is no reason to build and install systemd support in the host
build, so disable it explicitly.

Signed-off-by: John Keeping <john@metanate.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 312c6ba1d8..3c67625688 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -107,6 +107,7 @@ HOST_DBUS_CONF_OPTS = \
 	--disable-selinux \
 	--disable-xml-docs \
 	--disable-doxygen-docs \
+	--disable-systemd \
 	--without-x \
 	--with-xml=expat
 
