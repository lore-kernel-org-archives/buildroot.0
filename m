From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Dec 2014 12:42:31 +0100
Subject: [Buildroot] [git commit] python-alsaaudio: needs pcm and mixer
	support in alsa
Message-ID: <20141208114402.8AD227FC79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2333c340369b16a01fe209517d16fbbbf646d57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/20a/20ac027a2b27457dd046f83abc329cf9caaaca8a/
http://autobuild.buildroot.net/results/3b8/3b882e1196dfea18e55670f397732998c781b280/
http://autobuild.buildroot.net/results/2de/2dec463de766272ff29bbef8fd08a223d16a92a0/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-alsaaudio/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python-alsaaudio/Config.in b/package/python-alsaaudio/Config.in
index c9a91c9..22a7e87 100644
--- a/package/python-alsaaudio/Config.in
+++ b/package/python-alsaaudio/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_PYTHON_ALSAAUDIO
 	bool "python-alsaaudio"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_PCM
+	select BR2_PACKAGE_ALSA_LIB_MIXER
 	help
 	  The PyAlsaAudio package contains bindings for the ALSA sound
 	  API.
