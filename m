From: Josh Wu <rainyfeeling@gmail.com>
Date: Wed, 24 Feb 2010 15:42:59 +0800
Subject: [Buildroot]  madplay build failure
Message-ID: <99b73aa81002232342sc7823d6oda84f4e766122832@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am new in buildroot, when building madplay, I get the following build
failure. Does anybody can point out a hint for me why this happened?
I use the today's snapshot. 2010.02_rc2. Attached is the configuration file.

...... .......
touch
/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b/.configured
/usr/bin/make -j1 -C
/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b
make[1]: Entering directory
`/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b'
/usr/bin/make all-recursive
make[2]: Entering directory
`/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b'
Making all in intl
make[3]: Entering directory
`/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b/intl'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b/intl'
Making all in po
make[3]: Entering directory
`/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b/po'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b/po'
make[3]: Entering directory
`/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b'
if
/home/josh/buildroot/latest_version/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe -Os
-I/home/josh/buildroot/latest_version/buildroot/output/staging/usr/include
-I/home/josh/buildroot/latest_version/buildroot/output/staging/include
--sysroot=/home/josh/buildroot/latest_version/buildroot/output/staging/
-isysroot /home/josh/buildroot/latest_version/buildroot/output/staging
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DHAVE_CONFIG_H -I. -I. -I. -Iintl -DLOCALEDIR=\"/usr/share/locale\" -Wall
-pipe
-I/home/josh/buildroot/latest_version/buildroot/output/staging/usr/include
-I/home/josh/buildroot/latest_version/buildroot/output/staging/include
--sysroot=/home/josh/buildroot/latest_version/buildroot/output/staging/
-isysroot /home/josh/buildroot/latest_version/buildroot/output/staging
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float -Os -MT
madplay.o -MD -MP -MF ".deps/madplay.Tpo" -c -o madplay.o madplay.c; \
then mv -f ".deps/madplay.Tpo" ".deps/madplay.Po"; else rm -f
".deps/madplay.Tpo"; exit 1; fi
madplay.c: In function 'get_time':
madplay.c:379: warning: 'time.fraction' may be used uninitialized in this
function
madplay.c:379: warning: 'time.seconds' may be used uninitialized in this
function
if
/home/josh/buildroot/latest_version/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe -Os
-I/home/josh/buildroot/latest_version/buildroot/output/staging/usr/include
-I/home/josh/buildroot/latest_version/buildroot/output/staging/include
--sysroot=/home/josh/buildroot/latest_version/buildroot/output/staging/
-isysroot /home/josh/buildroot/latest_version/buildroot/output/staging
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DHAVE_CONFIG_H -I. -I. -I. -Iintl -DLOCALEDIR=\"/usr/share/locale\" -Wall
-pipe
-I/home/josh/buildroot/latest_version/buildroot/output/staging/usr/include
-I/home/josh/buildroot/latest_version/buildroot/output/staging/include
--sysroot=/home/josh/buildroot/latest_version/buildroot/output/staging/
-isysroot /home/josh/buildroot/latest_version/buildroot/output/staging
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float -Os -MT
getopt.o -MD -MP -MF ".deps/getopt.Tpo" -c -o getopt.o getopt.c; \
then mv -f ".deps/getopt.Tpo" ".deps/getopt.Po"; else rm -f
".deps/getopt.Tpo"; exit 1; fi
... ...

then mv -f ".deps/audio_wave.Tpo" ".deps/audio_wave.Po"; else rm -f
".deps/audio_wave.Tpo"; exit 1; fi
if
/home/josh/buildroot/latest_version/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe -Os
-I/home/josh/buildroot/latest_version/buildroot/output/staging/usr/include
-I/home/josh/buildroot/latest_version/buildroot/output/staging/include
--sysroot=/home/josh/buildroot/latest_version/buildroot/output/staging/
-isysroot /home/josh/buildroot/latest_version/buildroot/output/staging
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DHAVE_CONFIG_H -I. -I. -I. -Iintl -DLOCALEDIR=\"/usr/share/locale\" -Wall
-pipe
-I/home/josh/buildroot/latest_version/buildroot/output/staging/usr/include
-I/home/josh/buildroot/latest_version/buildroot/output/staging/include
--sysroot=/home/josh/buildroot/latest_version/buildroot/output/staging/
-isysroot /home/josh/buildroot/latest_version/buildroot/output/staging
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float -Os -MT
audio_alsa.o -MD -MP -MF ".deps/audio_alsa.Tpo" -c -o audio_alsa.o
audio_alsa.c; \
then mv -f ".deps/audio_alsa.Tpo" ".deps/audio_alsa.Po"; else rm -f
".deps/audio_alsa.Tpo"; exit 1; fi
audio_alsa.c: In function 'play':
audio_alsa.c:288: warning: pointer targets in passing argument 1 of
'audio_pcm' differ in signedness
/bin/sh ./libtool --mode=link
/home/josh/buildroot/latest_version/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe -Os
-I/home/josh/buildroot/latest_version/buildroot/output/staging/usr/include
-I/home/josh/buildroot/latest_version/buildroot/output/staging/include
--sysroot=/home/josh/buildroot/latest_version/buildroot/output/staging/
-isysroot /home/josh/buildroot/latest_version/buildroot/output/staging
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -pipe
-I/home/josh/buildroot/latest_version/buildroot/output/staging/usr/include
-I/home/josh/buildroot/latest_version/buildroot/output/staging/include
--sysroot=/home/josh/buildroot/latest_version/buildroot/output/staging/
-isysroot /home/josh/buildroot/latest_version/buildroot/output/staging
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float -Os
-L/home/josh/buildroot/latest_version/buildroot/output/staging/lib
-L/home/josh/buildroot/latest_version/buildroot/output/staging/usr/lib
--sysroot=/home/josh/buildroot/latest_version/buildroot/output/staging/ -o
madplay madplay.o getopt.o getopt1.o version.o resample.o filter.o tag.o
crc.o rgain.o player.o audio.o audio_aiff.o audio_cdda.o audio_hex.o
audio_null.o audio_raw.o audio_snd.o audio_wave.o audio_alsa.o -lasound
-lmad -lid3tag -lm
mkdir .libs
/home/josh/buildroot/latest_version/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe -Os
-I/home/josh/buildroot/latest_version/buildroot/output/staging/usr/include
-I/home/josh/buildroot/latest_version/buildroot/output/staging/include
--sysroot=/home/josh/buildroot/latest_version/buildroot/output/staging/
-isysroot /home/josh/buildroot/latest_version/buildroot/output/staging
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -pipe
-I/home/josh/buildroot/latest_version/buildroot/output/staging/usr/include
-I/home/josh/buildroot/latest_version/buildroot/output/staging/include
--sysroot=/home/josh/buildroot/latest_version/buildroot/output/staging/
-isysroot /home/josh/buildroot/latest_version/buildroot/output/staging
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float -Os
--sysroot=/home/josh/buildroot/latest_version/buildroot/output/staging/ -o
madplay madplay.o getopt.o getopt1.o version.o resample.o filter.o tag.o
crc.o rgain.o player.o audio.o audio_aiff.o audio_cdda.o audio_hex.o
audio_null.o audio_raw.o audio_snd.o audio_wave.o audio_alsa.o
-L/home/josh/buildroot/latest_version/buildroot/output/staging/lib
-L/home/josh/buildroot/latest_version/buildroot/output/staging/usr/lib
/home/josh/buildroot/latest_version/buildroot/output/staging/usr/lib/libasound.so
-ldl -lpthread -lrt
/home/josh/buildroot/latest_version/buildroot/output/staging/usr/lib/libmad.so
/home/josh/buildroot/latest_version/buildroot/output/staging/usr/lib/libid3tag.so
-lz -lm -Wl,--rpath
-Wl,/home/josh/buildroot/latest_version/buildroot/output/staging/usr/lib
-Wl,--rpath
-Wl,/home/josh/buildroot/latest_version/buildroot/output/staging/usr/lib
audio_alsa.o: In function `config':
audio_alsa.c:(.text+0x200): undefined reference to
`snd_pcm_hw_params_set_rate_near at ALSA_0.9'
audio_alsa.c:(.text+0x25c): undefined reference to
`snd_pcm_hw_params_set_buffer_time_near at ALSA_0.9'
audio_alsa.c:(.text+0x284): undefined reference to
`snd_pcm_hw_params_get_buffer_size at ALSA_0.9'
audio_alsa.c:(.text+0x2a4): undefined reference to
`snd_pcm_hw_params_set_period_time_near at ALSA_0.9'
audio_alsa.c:(.text+0x2d4): undefined reference to
`snd_pcm_hw_params_get_period_size at ALSA_0.9'
collect2: ld returned 1 exit status
make[3]: *** [madplay] Error 1
make[3]: Leaving directory
`/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b'
make: ***
[/home/josh/buildroot/latest_version/buildroot/output/build/madplay-0.15.2b/madplay]
Error 2


Thanks.
Best Regards,
Josh Wu
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100224/93d45202/attachment-0001.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 17013 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100224/93d45202/attachment-0001.obj>
