From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Mon, 6 Jul 2020 16:13:46 +0800
Subject: [Buildroot] [PATCH v3 2/2] configs/rock_pi_4: new defconfig
In-Reply-To: <CAM+7aWur5oFNZVCV5HddosWLVysbD9=heXYeY2QsbpN7JL=WjA@mail.gmail.com>
References: <1593893805-8430-1-git-send-email-sunil@amarulasolutions.com>
 <1593893805-8430-3-git-send-email-sunil@amarulasolutions.com>
 <f6046092-3cc2-7414-8741-612fddb1145f@aliyun.com>
 <CAM+7aWur5oFNZVCV5HddosWLVysbD9=heXYeY2QsbpN7JL=WjA@mail.gmail.com>
Message-ID: <8aab0e4a-af19-b988-be50-cce219b429a0@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I deleted some content for easy reading.
>> Hi Suniel,
>>> Add initial support for RK3399 based rockpi-4 targets (model A, B, C)
>>> with below features:
>>> ??? - Custom U-Boot 2020.07-rc4
>>> ????? https://github.com/amarula/u-boot-amarula.git
>>> ????? branch rock-pi
>>> ??? - Linux 5.4.46
>>> ??? - GPT partition layout is being used
>>> ??? - Default packages from buildroot
>>> ...
>>> +??? partition loader1 {
>>> +??????? image = "idbloader.img"
>>> +??????? offset = 32K
>>> +??? }
>>> +
>>> +??? partition loader2 {
>>> +??????? image = "u-boot.itb"
>>> +??????? offset = 8M
>>> +??? }
>> I think using u-boot-rockchip.bin is simpler.
>> ??? partition u-boot {
>> ??????? offset = "32K"
>> ??????? image = "u-boot-rockchip.bin"
>> ??????? in-partition-table = false
>> ??? } 
> Hi Tian,
> Rockchip uses unified GPT as its main partition table. We are just
> following that.
> doc/README.rockchip (GPT partition layout)
> http://rockchip.wikidot.com/partitions
See https://patchwork.kernel.org/patch/11326313/
u-boot-rockchip.bin consists of idbloader.img and u-boot.itb,
and contains a gap of 8355840 bytes.
The result is the same as yours, and more simple.

Regards,
Yuanhao
