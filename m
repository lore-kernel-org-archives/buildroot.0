From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 01 Feb 2020 15:16:31 +0100
Subject: [Buildroot] [PATCH v9 02/23] package/kodi: bump to version
 18.5-Leia
References: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
 <20200119110735.1104443-3-bernd.kuhls@t-online.de>
 <d2a6b010-4165-10d7-ce36-05056a17da44@mind.be>
Message-ID: <vqdgggxdp2.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 23 Jan 2020 01:04:23 +0100 schrieb Arnout Vandecappelle:

>>  # taken from tools/depends/target/ffmpeg/FFMPEG-VERSION
>> -KODI_FFMPEG_VERSION = 3.1.11-Krypton-17.5
>> +KODI_FFMPEG_VERSION = 4.0.4-Leia-18.4
>>  KODI_EXTRA_DOWNLOADS += \
>>  	https://github.com/xbmc/FFmpeg/archive/$
(KODI_FFMPEG_VERSION).tar.gz
> 
>  I believe this could be improved a little by using github helper and a 
more
> descriptive file name:
> 
> KODI_EXTRA_DOWNLOAD += \
> 	$(call
> github,xbmc,FFmpeg,$(KODI_FFMPEG_VERSION))/kodi-ffmpeg-$
(KODI_FFMPEG_VERSION).tar.gz

Hi Arnout,

ah, I did not knew that you can pass a local filename to the github 
helper for the tarball to be stored as, section 17.23.4 of the manual 
does not mention it ;)

This solves the problem I saw with the tarballs of libdvdnav and 
libdvdread having the same filename "6.0.0-Leia-Alpha-3.tar.gz" due to 
the same version number, that is the reason I used the sha1 hashes 
instead.

Back in September you mentioned using an updated github helper as an idea:
http://lists.busybox.net/pipermail/buildroot/2019-September/260106.html
but I never noticed a commit adding this feature, which, btw, works 
fine :)

Sent http://patchwork.ozlabs.org/patch/1232246/

Regards, Bernd
