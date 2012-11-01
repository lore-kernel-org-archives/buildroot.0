From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 01 Nov 2012 15:36:10 +0100
Subject: [Buildroot] [PATCH 3 7/9] pulseaudio: remove dependency on gettext
In-Reply-To: <20121101143539.8550.70150.stgit@localhost>
References: <20121101143539.8550.70150.stgit@localhost>
Message-ID: <20121101143610.8550.65129.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

The dependency on gettext is only due to libglib2, not due to
pulseaudio itself.  It works fine without gettext if libglib2 is
not selected.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: actually remove the gettext dependency this time; thanks Thomas
---
 package/multimedia/pulseaudio/Config.in     |    1 -
 package/multimedia/pulseaudio/pulseaudio.mk |    1 -
 2 files changed, 2 deletions(-)

diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
index 6c767bb..0844192 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBSNDFILE
 	select BR2_PACKAGE_SPEEX
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  PulseAudio is a sound system for POSIX OSes, meaning that it
 	  is a proxy for your sound applications. It allows you to do
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index e78eb42..a842180 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -16,7 +16,6 @@ PULSEAUDIO_CONF_OPT = \
 
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkgconf libtool json-c libsndfile speex host-intltool \
-	$(if $(BR2_NEEDS_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
