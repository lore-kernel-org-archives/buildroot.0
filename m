From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:43:06 +0100
Subject: [Buildroot] [git commit] package/portaudio: Remove threads
	dependency for alsa module
Message-ID: <20150304224315.4903580E38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1903260da6e9c13b6c4ccb7fbb4f107e1285d5b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Portaudio as a whole already depends on threads support, so there is no
need to have an additional dependency for its alsa module.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/portaudio/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/portaudio/Config.in b/package/portaudio/Config.in
index eaf095c..252a92a 100644
--- a/package/portaudio/Config.in
+++ b/package/portaudio/Config.in
@@ -15,7 +15,6 @@ if BR2_PACKAGE_PORTAUDIO
 config BR2_PACKAGE_PORTAUDIO_ALSA
 	bool "alsa support"
 	select BR2_PACKAGE_ALSA_LIB
-	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	default y
 	help
 	  Compile with ALSA support.
