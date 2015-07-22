From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Jul 2015 21:16:23 +0200
Subject: [Buildroot] [PATCH/RFC v3 02/50] package/libsquish: New package
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
 <1437332755-9764-3-git-send-email-bernd.kuhls@t-online.de>
 <20150719212445.3e77f88a@free-electrons.com>
Message-ID: <XnsA4DFD866F8060berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150719212445.3e77f88a at free-
electrons.com:

>> +# libsquish
> Have you considered using the CMakeLists.txt provided in libsquish, and
> therefore use the cmake-package infrastructure? It should properly
> handle the shared vs. static library case, and reduce the amount of
> manual stuff that you need to do in LIBSQUISH_INSTALL_STAGING_CMDS and
> LIBSQUISH_INSTALL_TARGET_CMDS.

Hi,

yes, I did, the result was that the target binary was compiled using the 
host compiler, later on make install fails:

make[1]: Entering directory `/home/fli4l/br8_kodi/output/build/libsquish-
1.13'
g++ -fPIC -I. -O2 -Wall -o alpha.o -c alpha.cpp
g++ -fPIC -I. -O2 -Wall -o clusterfit.o -c clusterfit.cpp
g++ -fPIC -I. -O2 -Wall -o colourblock.o -c colourblock.cpp
g++ -fPIC -I. -O2 -Wall -o colourfit.o -c colourfit.cpp
g++ -fPIC -I. -O2 -Wall -o colourset.o -c colourset.cpp
g++ -fPIC -I. -O2 -Wall -o maths.o -c maths.cpp
g++ -fPIC -I. -O2 -Wall -o rangefit.o -c rangefit.cpp
g++ -fPIC -I. -O2 -Wall -o singlecolourfit.o -c singlecolourfit.cpp
g++ -fPIC -I. -O2 -Wall -o squish.o -c squish.cpp
g++ -shared -Wl,-soname,libsquish.so.0 -o libsquish.so.0.0 alpha.o 
clusterfit.o colourblock.o colourfit.o colourset.o maths.o rangefit.o 
singlecolourfit.o squish.o
make[1]: Leaving directory `/home/fli4l/br8_kodi/output/build/libsquish-
1.13'

>>> libsquish 1.13 Installing to staging directory
PATH="/home/fli4l/br8_kodi/output/host/bin:/home/fli4l/br8
_kodi/output/host/sbin:/home/fli4l/br8
_kodi/output/host/usr/bin:/home/fli4l/br8
_kodi/output/host/usr/sbin:/home/fli4l/bin:/usr/local/bin:/usr/bin:/bin:/us
r/local/games:/usr/games"  /usr/bin/make -j9  DESTDIR=/home/fli4l/br8
_kodi/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot 
install/fast -C /home/fli4l/br8_kodi/output/build/libsquish-1.13/
make[1]: Entering directory `/home/fli4l/br8_kodi/output/build/libsquish-
1.13'
make[1]: *** No rule to make target `install/fast'.  Stop.
make[1]: Leaving directory `/home/fli4l/br8_kodi/output/build/libsquish-
1.13'
make: *** [/home/fli4l/br8_kodi/output/build/libsquish-
1.13/.stamp_staging_installed] Error 2

So I created a generic package which works ;)

Regards, Bernd
