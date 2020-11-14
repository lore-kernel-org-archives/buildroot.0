From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 14:13:48 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/apparmor: fix
 permission bits for apparmor.service
Message-ID: <20201114130012.6E6B48615E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1f9bb026ae2f8e20a4f91dde98d016c25554d55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Avoid setting executable bits for apparmor.service. This gets rid of a
corresponding warning during installation:
  Configuration file ../target/usr/lib/systemd/system/apparmor.service
  is marked executable. Please remove executable permission bits.
  Proceeding anyway.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a325eefc1b1e0be4848fc67265c7395abdf08945)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apparmor/apparmor.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 51820999eb..0044413d6c 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -88,7 +88,7 @@ endef
 define APPARMOR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0755 $(@D)/parser/apparmor.systemd \
 		$(TARGET_DIR)/lib/apparmor/apparmor.systemd
-	$(INSTALL) -D -m 0755 $(@D)/parser/apparmor.service \
+	$(INSTALL) -D -m 0644 $(@D)/parser/apparmor.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/apparmor.service
 endef
 
