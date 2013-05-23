From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 May 2013 22:36:35 +0200
Subject: [Buildroot] [git commit] portaudio: needs threads
Message-ID: <20130523205044.1269A9A2BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a45b0194ef4265adee5f2b26dbe2af38a020728a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/ba2/ba2d3832cb6838b2126e0f7db223305eab579d59

[Peter: move above so sub options gets properly indented]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/portaudio/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/portaudio/Config.in b/package/portaudio/Config.in
index df884a7..5a8f248 100644
--- a/package/portaudio/Config.in
+++ b/package/portaudio/Config.in
@@ -1,5 +1,9 @@
+comment "portaudio needs a toolchain threads support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_PORTAUDIO
 	bool "portaudio"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  PortAudio is a free, cross-platform, open-source,
 	  audio I/O library.
