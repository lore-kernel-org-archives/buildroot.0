From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 01 Feb 2020 14:26:48 +0100
Subject: [Buildroot] [PATCH v9 02/23] package/kodi: bump to version
 18.5-Leia
References: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
 <20200119110735.1104443-3-bernd.kuhls@t-online.de>
 <d2a6b010-4165-10d7-ce36-05056a17da44@mind.be>
Message-ID: <otagggxdp2.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Am Thu, 23 Jan 2020 01:04:23 +0100 schrieb Arnout Vandecappelle:

> Hi Bernd,
> 
>  I'm applying to master (hopefully I'll be able to finish that) but I have a few
> follow-up questions/requests.

thanks.

>> Added dependencies to autoreconf cpluff.
> 
>  You don't explain here, nore in the .mk file, while cpluff needs to be
> autoreconf'ed.

the tarball does not contain a configure script in lib/cpluff/

>> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
>> index db6931ed8a..f592e18e13 100644
>> --- a/package/kodi/Config.in
>> +++ b/package/kodi/Config.in
>> @@ -23,7 +23,9 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
>>  	# List of valid CPUs can be found here:
>>  	# https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L12
>>  	depends on BR2_arm1176jzf_s || BR2_cortex_a7 || BR2_cortex_a53
>> +	depends on BR2_ENABLE_LOCALE # libinput
>>  	depends on BR2_PACKAGE_RPI_USERLAND
>> +	depends on BR2_PACKAGE_HAS_UDEV # libinput
> 
>  Maybe the two new dependencies warrant a comment? The arch dependency and the
> rpi-userland dependency are kind of obvious, but these new ones aren't.

Upstream requires LibInput and Xkbcommon for rbpi:
https://github.com/xbmc/xbmc/blob/Leia/cmake/platform/linux/rbpi.cmake

Regards, Bernd
