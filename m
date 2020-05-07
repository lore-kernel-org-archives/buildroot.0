From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 7 May 2020 23:28:07 +0200
Subject: [Buildroot] [PATCH] configs/rockpro64: new defconfig
In-Reply-To: <20200506150655.uqbqekv3mlanj3cc@marchewa.redembedded.pl>
References: <1588372460-5296-1-git-send-email-sunil@amarulasolutions.com>
 <379680d1-7ba1-fb36-cdf4-e5f7985c4cd4@gmail.com>
 <CAM+7aWsjaOtzdLiubXjkx2JDcKd67NJgGif9ZkB=0UdvrW34kg@mail.gmail.com>
 <eecc3083-2c9e-161c-d886-0b92bba79eb0@gmail.com>
 <20200503201501.brpmmjezpgfcxqif@marchewa.redembedded.pl>
 <20200506150655.uqbqekv3mlanj3cc@marchewa.redembedded.pl>
Message-ID: <aaf2b969-f280-754c-a550-7101a73b9773@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michal,

Le 06/05/2020 ? 17:06, michal.lyszczek at bofc.pl a ?crit?:
> On 2020-05-03 22:15:01, michal.lyszczek at bofc.pl wrote:
>> On 2020-05-03 11:54:07, Romain Naour wrote:
>>>>     Not related to this patch but our rock64 defconfig is currently broken [1] since
>>>>     a while due to incompatibility between uboot-2017.09-rockchip-ayufan fork and
>>>>     pylibfdt. Even with the latest version [2], it doesn't build.
>>>>
>>>>     Do you think we can update to rock64 uboot to 2020.04 and use
>>>>     rock64-rk3328_defconfig ?
>>>>
>>>>     [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/535054620
>>>>     [2]
>>>>     https://github.com/ayufan-rock64/linux-u-boot/releases/tag/2017.09-rockchip-ayufan-1065-g95f6152134
>>>>
>>>>     Thanks!
>>>>
>>>>
>>>> Yes you can try that, also you can bump up kernel and ATF versions. Hope that works.
>>>
>>> I changed those lines:
>>>
>>> -BR2_TARGET_UBOOT_CUSTOM_GIT=y
>>> -BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/ayufan-rock64/linux-u-boot.git"
>>> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="2017.09-rockchip-ayufan-1035-gd646df03ac"
>>> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>>> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
>>>
>>> Indeed it build correctly but I can't do a runtime test, I don't have the board.
>>>
>>> Micha?: At some point the defconfig will be removed if nobody is able to test.
>>
>> Hi,
>>
>> Don't remember the reason, but official uboot was not working for me, and
>> that's the reason why I used uboot from ayufan. Maybe things will be
>> different in 2020.04.
>>
>> I still have my rock64 board so I will look into this next week.
> 
> Ok, I've chcked this.
> 
> ayufan repo did not compile for me, I tried to fix it, but nothing really
> worked, and I do not fully understand what is going on there. Also
> ayufan repo seems to be dead now, last commit almost 2 years ago.
> 
> 
> uboot from rockchip does not build, gcc complains about unrecognized
> -mabi=aapcs-linux option.
> 
> 
> official uboot builds, but it won't boot due to error while reading
> mmc block (mmc_load_image_raw_sector: mmc block read error)

Thank for your time!

It seems a problem at spl boot stage...
If you have some more time, you may send a report to the uboot mailing list.

We usually we drop defconfig that doesn't work just before the release, but
still have some time before 2020.05 final release,

Best regards,
Romain

> 
> 
> This would take me quite some time to figure this out and I really don't
> want to waste my time on that board. Especially now that we have
> raspberry pi 4.
> 
> So, for me, that board can be removed. If someone wants to patch
> libftd in ayufan repo (so that the code compiles) I can take it
> and test on the hardware.
> 
