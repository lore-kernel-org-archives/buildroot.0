From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 15 Feb 2014 00:53:25 +0100
Subject: [Buildroot] [PATCH v5 0/5] Introducing XBMC
In-Reply-To: <52FE9B90.9090609@barkynet.com>
References: <1392332394-27935-1-git-send-email-maxime.hadjinlian@gmail.com>
 <52FE9B90.9090609@barkynet.com>
Message-ID: <CAGduivw6f4xdvpv04SXig-bSg9YKvuNOdTEEoo2hGm_AwZAoDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin, all
On Fri, Feb 14, 2014 at 11:41 PM, Martin Bark <martin@barkynet.com> wrote:
>
> Maxime,
>
> I just tried out you patch set.  Initially i tried a simple defconfig as
> follows and this failed when configuring xbmc
>
> BR2_arm=y
> BR2_arm1176jzf_s=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_XBMC=y
> BR2_PACKAGE_RPI_USERLAND=y
>
> The xmbc configure script was moaning about missing dependencies.  To get
> the code to build I?m the end i had to enable the following:
>
> BR2_PACKAGE_XBMC_FLAC=y
> BR2_PACKAGE_XBMC_LIBASS=y
> BR2_PACKAGE_XBMC_LIBSAMPLERATE=y
> BR2_PACKAGE_XBMC_MAD=y
> BR2_PACKAGE_XBMC_VORBIS=y
>
> Perhaps you could check these option, maybe they need to be selected by
> default.
I will look into it. They don't need to be selected by default, they
should be disabled if not selected in menuconfig.
>
> Thanks
Thanks for spotting this.
>
>
>
> On 13/02/14 22:59, Maxime Hadjinlian wrote:
>>
>> Hi all,
>>
>> This is a new version of the series of patch introducing XBMC.
>> A new one appeared, which add the dependencies of Java on the host machine
>> for
>> XBMC.
>> Also, the $(MAKE1) for XBMC has been removed. After doing a loop of 50
>> builds
>> and no trouble so far to report, I assumed it was safe, at least for now.
>>
>> As always, I wait for your reviews and comments !
>>
>> Maxime Hadjinlian (5):
>>    sdl: fix autoreconf timing issue
>>    sdl: add host version
>>    sdl_image: add host version
>>    dependencies.sh: XBMC needs java on the host
>>    xbmc: new package
>>
>>   package/Config.in                                  |   1 +
>>   .../sdl/sdl-0001-use-correct-directfb-config.patch |  19 +-
>>   package/sdl/sdl.mk                                 |   2 +
>>   package/sdl_image/sdl_image.mk                     |  11 ++
>>   package/xbmc/Config.in                             | 202
>> +++++++++++++++++++++
>>   package/xbmc/S50xbmc                               |  41 +++++
>>   package/xbmc/xbmc-0001-Fixup-include-path.patch    |  79 ++++++++
>>   .../xbmc-0002-RaspberryPi-Default-Settings.patch   | 167
>> +++++++++++++++++
>>   package/xbmc/xbmc.mk                               | 175
>> ++++++++++++++++++
>>   package/xbmc/xbmc.service                          |  12 ++
>>   support/dependencies/dependencies.sh               |  10 +
>>   11 files changed, 702 insertions(+), 17 deletions(-)
>>   create mode 100644 package/xbmc/Config.in
>>   create mode 100755 package/xbmc/S50xbmc
>>   create mode 100644 package/xbmc/xbmc-0001-Fixup-include-path.patch
>>   create mode 100644
>> package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
>>   create mode 100644 package/xbmc/xbmc.mk
>>   create mode 100644 package/xbmc/xbmc.service
>>
>> --
>> 1.8.5.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
