From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 20:01:50 +0100
Subject: [Buildroot] [git commit] wpa_supplicant: define BINDIR for
	systemd/dbus service files
Message-ID: <20131128194204.D0FD99BE47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=689f975e7b196bf7ad2a3cd970444414f2f689d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BINDIR is used to point systemd/dbus service files to the correct binary
path where wpa_supplicant resides.
So define it to avoid the default /usr/local path that doesn't work.
Solves bug #6704

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 450e10f..4ae41c1 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -137,7 +137,7 @@ endef
 
 define WPA_SUPPLICANT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) CFLAGS="$(WPA_SUPPLICANT_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" BINDIR=/usr/sbin \
 		$(MAKE) CC="$(TARGET_CC)" -C $(@D)/$(WPA_SUPPLICANT_SUBDIR)
 endef
 
