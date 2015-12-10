From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Dec 2015 21:44:37 +0100
Subject: [Buildroot] [git commit] edid-decode: use TARGET_MAKE_ENV
Message-ID: <20151210205359.83CF1822E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e38b5e556306de17fb0c6c718825c8d816356b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change as it only uses $CC / mkdir / install, but add it for
consistency and in case future versions need it.

Suggested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/edid-decode/edid-decode.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index 8fcc19e..243ccfb 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -10,11 +10,12 @@ EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = edid-decode.c
 
 define EDID_DECODE_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
 endef
 
 define EDID_DECODE_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
