From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 May 2012 02:06:03 +0200
Subject: [Buildroot] [git commit] pulseaudio: don't build man pages if not
	needed
Message-ID: <20120531113259.198FD96E2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f2ce003bd7475939d86da07adf51a5aedbadf30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No sense in building them if they are thrown away by target-finalize anyway.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/pulseaudio/pulseaudio.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index bc5a0ae..a5534da 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -11,7 +11,8 @@ PULSEAUDIO_CONF_OPT = \
 	--localstatedir=/var \
 	--disable-default-build-tests \
 	--disable-legacy-runtime-dir \
-	--disable-legacy-database-entry-format
+	--disable-legacy-database-entry-format \
+	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-manpages)
 
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkg-config libtool json-c libsndfile speex host-intltool \
