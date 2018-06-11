From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 22:05:36 +0200
Subject: [Buildroot] [git commit] triggerhappy: add optional dependency on
 systemd
Message-ID: <20180611200413.B30D4882B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b88def5db35fc3f3b4e68c664c230bba33f0bb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

triggerhappy can use systemd for socket activation.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/triggerhappy/triggerhappy.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
index 4c39ab5e5d..7c4bf40476 100644
--- a/package/triggerhappy/triggerhappy.mk
+++ b/package/triggerhappy/triggerhappy.mk
@@ -10,6 +10,10 @@ TRIGGERHAPPY_LICENSE = GPL-3.0+
 TRIGGERHAPPY_LICENSE_FILES = COPYING
 TRIGGERHAPPY_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+TRIGGERHAPPY_DEPENDENCIES += systemd
+endif
+
 define TRIGGERHAPPY_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) PKGCONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		-C $(@D) thd th-cmd
