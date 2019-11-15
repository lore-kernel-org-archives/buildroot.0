From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 22:15:25 +0100
Subject: [Buildroot] [git commit] package/kodi: add missing host-gettext
 dependency
Message-ID: <20191115210824.395C68F002@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d90fc22ee3a3420fd5881416107f55447a900ea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A sub-component of Kodi (cpluff) needs to be autoreconf-ed, and uses
gettext, so calls to autopoint:

    [  2%] Performing autoreconf step for 'libcpluff'
    autoreconf: Entering directory `.'
    autoreconf: running: autopoint --force
    Can't exec "autopoint": No such file or directory at [...]/host/share/autoconf/Auto4te/FileUtils.pm line 345.
    autoreconf: failed to run autopoint: No such file or directory
    autoreconf: autopoint is needed because this package uses Gettext
    make[4]: *** [CMakeFiles/libcpluff.dir/build.make:121: build/cpluff/src/libcpluff-stamp/libcpluff-autoreconf] Error 1
    make[3]: *** [CMakeFiles/Makefile2:615: CMakeFiles/libcpluff.dir/all] Error 2

Add a dependency to host-gettext to bring an appropriate variant that
provides autotpoint (gettext-tiny's autopoint works like a charm, for
the curious).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi/kodi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 49728e464b..ceab5d5c0b 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -19,6 +19,7 @@ KODI_DEPENDENCIES = \
 	freetype \
 	gnutls \
 	host-gawk \
+	host-gettext \
 	host-gperf \
 	host-kodi-jsonschemabuilder \
 	host-kodi-texturepacker \
