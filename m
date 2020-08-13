From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 21:12:16 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/dbus: disable
 systemd for host build
Message-ID: <20200813190729.84553815DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06922cf95883c21c7495555d954fc83946355833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

This fixes an issue if host-dbus happens to be rebuilt after systemd, in
which case it autodetects systemd support but then ignored the prefix
when installing unit files.  That means that is tries to write to the
host system's /usr/lib/ which fails.

There is no reason to build and install systemd support in the host
build, so disable it explicitly.

Signed-off-by: John Keeping <john@metanate.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1bfdb3d08daa0a516525965e00ccabdb8a714b39)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 5c2a5fb2cc..952eff1fc7 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -107,6 +107,7 @@ HOST_DBUS_CONF_OPTS = \
 	--disable-selinux \
 	--disable-xml-docs \
 	--disable-doxygen-docs \
+	--disable-systemd \
 	--without-x \
 	--with-xml=expat
 
