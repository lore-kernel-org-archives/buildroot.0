From: Martin Bark <martin@barkynet.com>
Date: Tue, 16 Jun 2015 10:56:51 +0100
Subject: [Buildroot] [PATCH 1/4] package/nodejs: Update to allow
 selecting node.js version
In-Reply-To: <1434353886.5045.4.camel@embedded.rocks>
References: <1434298376-31893-1-git-send-email-martin@barkynet.com>
 <20150614225309.07f354ed@free-electrons.com>
 <1434353886.5045.4.camel@embedded.rocks>
Message-ID: <CAFGQKxcSLVYn6Xz5bZzA4A6JosVEeyCs_WRVNUOjK+bTBi8=uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas & J?rg,

On 15 June 2015 at 08:38, J?rg Krause <joerg.krause@embedded.rocks> wrote:
> Dear Thomas,
>
> On So, 2015-06-14 at 22:53 +0200, Thomas Petazzoni wrote:
>> Dear Martin Bark,
>>
>> What is the motivation for supporting more than one version of NodeJS
>> at a time?
>
> Nodejs 0.10 and 0.12 use different versions of the V8 engine. The V8
> version used in 0.12 unfortunatly dropped support for the ARMv5
> architecture.

Yes and now i think about it i probably should have added something like

    depends on !BR2_ARM_CPU_ARMV5

for node.js v0.12.4.  V8 after version 3.18 increased the minimum to
ARMv6 with VFPv2.  See
https://groups.google.com/forum/#!topic/v8-users/aSOFbaAQvMk.  To
confirm I just ran a test and the qemu_arm_versatile_defconfig will
build node.js v0.12.4 but it fails to run. qemu_arm_vexpress_defconfig
will build and run node v0.12.4.

>
>> We generally try to avoid supporting multiple versions of a given
>> component, unless there are some really good reasons to do so (like
>> python2 vs. python3, or qt4 vs. qt5).
>
> Nodejs 0.10 is still maintaned and new versions will follow. I would
> suggest to support both version until maintenance is dropped.
>

That was my thought too.  There are some details on the upcoming
0.10.39 release here https://github.com/joyent/node/milestones/0.10.39

Thanks

Martin
