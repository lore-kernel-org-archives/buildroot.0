From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 18 Feb 2014 18:03:39 +0100
Subject: [Buildroot] [PATCH v7 0/4] Introducing XBMC
In-Reply-To: <53039115.5000409@barkynet.com>
References: <1392680233-24585-1-git-send-email-maxime.hadjinlian@gmail.com>
 <53039115.5000409@barkynet.com>
Message-ID: <CAGduivzKasL665muN6pr6bmnJAhqAMuXkRStRCvSMKNk4EYn5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 18, 2014 at 5:57 PM, Martin Bark <martin@barkynet.com> wrote:
> Maxime,
>
> I retested this v7 patch set using this minimal defconfig
>
> BR2_arm=y
> BR2_arm1176jzf_s=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_XBMC=y
> BR2_PACKAGE_RPI_USERLAND=y
>
> and i can confirm it now builds (once i add host-gperf to xbmc.mk).  I also
> tested enabling all the xbmc options and that builds too.  I have not tested
> it runs on the raspberry pi yet.
Nice to know, thanks for your tests :)
I did the same test myself, maybe I should change then so we find more problems.
>
> Thanks
>
>
> On 17/02/14 23:37, Maxime Hadjinlian wrote:
>>
>> Here we go again with a new round.
>> Again most of the changes are located within the XBMC patch.
>>
>> Maxime Hadjinlian (4):
>>    sdl: add host version
>>    sdl_image: add host version
>>    infra: Introduce BR2_HOST_NEEDS_JAVA
>>    xbmc: new package
>>
>>   Config.in                                          |   5 +
>>   package/Config.in                                  |   1 +
>>   package/sdl/sdl.mk                                 |   4 +-
>>   package/sdl_image/sdl_image.mk                     |  11 ++
>>   package/xbmc/Config.in                             | 165
>> ++++++++++++++++++++
>>   package/xbmc/S50xbmc                               |  41 +++++
>>   package/xbmc/xbmc-0001-Fixup-include-path.patch    |  81 ++++++++++
>>   .../xbmc-0002-RaspberryPi-Default-Settings.patch   | 168
>> +++++++++++++++++++++
>>   package/xbmc/xbmc.mk                               | 149
>> ++++++++++++++++++
>>   package/xbmc/xbmc.service                          |  12 ++
>>   support/dependencies/dependencies.sh               |   8 +
>>   11 files changed, 644 insertions(+), 1 deletion(-)
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
