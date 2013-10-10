From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Oct 2013 00:07:25 +0200
Subject: [Buildroot] [git commit] package/wayland: install wayland-scanner
	to $(HOST)
Message-ID: <20131011082158.B93499B9C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efee2e4e1758d22e1fedc134016245e792f5c3b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wayland-scanner is needed by weston.

[Peter: use $(INSTALL), fixup white space]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wayland/wayland.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 0810536..013d401 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -22,7 +22,9 @@ WAYLAND_CONF_OPT = --disable-scanner
 define WAYLAND_BUILD_SCANNER
 	(cd $(@D)/src/; \
 		$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
-			-o wayland-scanner scanner.c wayland-util.c -lexpat)
+			-o wayland-scanner scanner.c wayland-util.c -lexpat; \
+	 	$(INSTALL) -m 0755 -D wayland-scanner \
+			$(HOST_DIR)/usr/bin/wayland-scanner)
 endef
 
 WAYLAND_POST_CONFIGURE_HOOKS += WAYLAND_BUILD_SCANNER
