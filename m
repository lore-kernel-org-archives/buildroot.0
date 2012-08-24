From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Aug 2012 23:47:08 +0200
Subject: [Buildroot] [git commit] ifplugd: add --with-initdir= to config
	command
Message-ID: <20120824214743.A997797359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a45b10baa71273eba6f9100e0e66eca5660a4062
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ifplugd refuses to configure without this set.

Signed-off-by: Shawn J. Goff <shawnjgoff@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ifplugd/ifplugd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 1e11c14..d031a97 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -12,7 +12,7 @@ IFPLUGD_AUTORECONF = YES
 
 # install-strip unconditionally overwrites $(TARGET_DIR)/etc/ifplugd/ifplugd.*
 IFPLUGD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
-IFPLUGD_CONF_OPT = --disable-lynx
+IFPLUGD_CONF_OPT = --disable-lynx --with-initdir=/etc/init.d/
 IFPLUGD_DEPENDENCIES = libdaemon
 
 # Prefer big ifplugd
