From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 10:33:36 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/kodi: add missing
 host-gettext dependency
Message-ID: <20191119092611.262988F33F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2ab3e103ac66f611ca6795115e74f5e2da7337b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
(cherry picked from commit d90fc22ee3a3420fd5881416107f55447a900ea2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/kodi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index db6ae2f5ca..3ba89abcc8 100644
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
