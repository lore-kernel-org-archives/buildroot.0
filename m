From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 9 Sep 2013 22:38:04 +0200
Subject: [Buildroot] [git commit] pulseaudio: fix init script installation
Message-ID: <20130909204102.A62FB9AFC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d763fa91acd1c585cf4f6ed7302768a56ffa085f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust the installation step after adf65110 (Remove multimedia subdirectory).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pulseaudio/pulseaudio.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 66265d0..cdeabc5 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -107,7 +107,7 @@ define PULSEAUDIO_USERS
 endef
 
 define PULSEAUDIO_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/multimedia/pulseaudio/S50pulseaudio \
+	$(INSTALL) -D -m 755 package/pulseaudio/S50pulseaudio \
 		$(TARGET_DIR)/etc/init.d/S50pulseaudio
 endef
 
