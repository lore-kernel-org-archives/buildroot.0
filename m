From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 29 Jun 2021 23:32:08 +0200
Subject: [Buildroot] Trouble with u-boot on a ZynqMP board
In-Reply-To: <CAM+bi4syAU=jhC9VqE5eqfK5aO-c3ErfS2nUoXAz7AYPLAOCTg@mail.gmail.com>
References: <CAM+bi4s4Nueb96Xyo5dY7vwDhJO1xFnzcdrky5U3qsBBNf8EHQ@mail.gmail.com>
 <1ae87e6c-9b70-9492-6efd-b67d06d91433@lucaceresoli.net>
 <CAM+bi4sU71gkigZ_-T-AXKYtqYOA1cn+0bU=_TiThf94K2C4yQ@mail.gmail.com>
 <62bea3e6-dfdd-d230-e833-80775f065f83@lucaceresoli.net>
 <07bd6c4b-ad67-bf4c-b32c-aff2d5d7637b@lucaceresoli.net>
 <CAM+bi4syAU=jhC9VqE5eqfK5aO-c3ErfS2nUoXAz7AYPLAOCTg@mail.gmail.com>
Message-ID: <b277f25a-c56a-f414-8cc2-5ba5ba7435d5@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alvaro,

On 29/06/21 11:19, Alvaro Gamez wrote:
> Hi Luca,
> 
> El lun, 28 jun 2021 a las 18:47, Luca Ceresoli
> (<luca@lucaceresoli.net>) escribi?:
>>
>> Hi Alvaro,
>>
>> On 24/06/21 23:51, Luca Ceresoli wrote:
>> [...]
>>>>> I haven't been working on zynqmp recently but back at the times
>>>>> (2018~2019) one needed to have the various booting components "in sync",
>>>>> expecially pmufw, U-Boot and SPL or FSBL. I don't remember whether ATF
>>>>> was critical too in that respect. By "in sync" I mean the major version
>>>>> number (the year) should be the same.
>>>>>
>>>>> Here you are using a 2018 pmufw and 2021 U-Boot so you muight want to
>>>>> build a more recent pmufw and see if you get any improvements.
>>>>
>>>> Great, that's a nice idea, thank you!
>>>
>>> Try that, which seems to be required:
>>> https://forums.xilinx.com/t5/Embedded-Linux/problem-on-u-boot-quot-Synchronous-Abort-quot-handler-esr/m-p/1060937/highlight/true#M39206
>>
>> Did you make any progress?
> 
> Thanks for asking and continuing with your help! Indeed I did, just a
> couple hours ago. I am now able to run U-Boot SPL, which runs
> U-boot, which is able to reprogram the FPGA, and boot linux!
> 
> I started from scratch since I was accumulating lots of different tries and,
> either I or the computer were about to go crazy, so I reset everything
> and carefully crafted the final buildroot and u-boot configurations. I was
> able to use your pmufw 2018 version.

Cool! I can feel your relief feeling now. ;)

> I need to finish a few things before, but I want to send a patch to add this
> configuration as board/digilent/genesys-zu/ , which I hope to send in some
> moment during the next few days.

Yes, please do so!
Don't forget to Cc: me.

>> I was able to build and test more recent versions of pmufw (2019.2 amd
>> 2020.1) and pushed them to [0]. They are tested and working. Not sure
>> it's useful, but that's what I can provide at the moment.
> 
> Great, thanks a lot! I will try them too and will use either the
> latest or the one that
> matches the kernel I'm using, but it looks that it's not a requirement
> to have all
> pieces of software running the same version

I think these pieces of firmware have grown more stable recently than
they used to be in early zynqmp era when I have been working on them.
Thus mixing them is now possible, and it's OK until it works. But I
still would start with versions from the same year when starting from
scratch as it's what Xilinx is testing IIUC, so it has more probability
of success.

> I was wondering... there are lots of boards and SoCs which fit
> different types of
> processors, of different architectures. Wouldn't it be nice if
> buildroot itself could
> compile additional firmware, such as pmufw? Its toolchain for microblaze should
> be able to, but then Buildroot for zynqpm would need three toolchains: arm64,
> host and microblaze. It's probably too much and probably out of scope for a
> "root filesystem generator".

I agree it would be out of scope, Buildroot is not really meant to build
a single firmware. The complexity of the zyqmp-pmufw-builder script
confirms that pmufw needs very little to build.

Enjoy to fun part of zynqmp hacking now!

-- 
Luca
