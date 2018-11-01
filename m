From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 1 Nov 2018 00:02:32 -0200 (BRST)
Subject: [Buildroot] Queries/suggestions regarding patch series "grub2:
 add support for arm and aarch64"
In-Reply-To: <CAK4VdL0+P6HLVcTb21ECatLwBb0jPQ2sVOYtMNCUiLyw44Z5-w@mail.gmail.com>
References: <CAFA6WYP2bTxdkAKUem_O9GtPdt_hi4Hbg59XiWwEfNvLoc8ghQ@mail.gmail.com>
 <CAK4VdL0+P6HLVcTb21ECatLwBb0jPQ2sVOYtMNCUiLyw44Z5-w@mail.gmail.com>
Message-ID: <1556527544.6024542.1541037752882.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Erico Nunes" <nunes.erico@gmail.com>
> To: "sumit garg" <sumit.garg@linaro.org>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Tuesday, October 30, 2018 4:23:27 PM
> Subject: Re: [Buildroot] Queries/suggestions regarding patch series "grub2: add support for arm and aarch64"

> Hi Sumit,
> 
> On Tue, Oct 23, 2018 at 7:58 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>>
>> Hello Erico,
>>
>> Firstly, apologies for not posting these comments on your patch-set
>> [1] as I joined Buildroot ML yesterday only.
>>
>> I was recently exploring to test EFI boot using Buildroot on qemu
>> aarch64 target. But currently GRUB support is missing for aarch64
>> target in Buildroot. So I came across your patch-set. I have tested
>> your patch-set on qemu/u-boot aarch64 target using efi. So I would say
>> its:
>>
>> Tested-by: Sumit Garg <sumit.garg@linaro.org>
> 
> Thanks for your testing and feedback.
> 
> Yes it is taking a while to have this patchset reviewed, but right now
> there are well over 200 patches in the patchwork queue, so I think it
> is understandable that it is taking some time. At this point I believe
> it will only be considered after 2018.11 (for 2019.02) anyway.
> 
>> However, I will suggest you to use PARTUUID for root path in grub.cfg
>> as it will make it more generic and device independent as we could use
>> either virtio, sata, usb or mmc. So I would propose a similar change
>> as in [2].
>>
>> Apart from that, how do you think about adding qemu/u-boot target for
>> aarch64 to Buildroot? As u-boot already have efi booting support using
>> bootefi.
> 
> Using PARTUUID seems to be an interesting change. I'd like to hear the
> opinion of the other Buildroot developers before making this change in
> this patchset though, since most other platforms in Buildroot are not
> doing this.
> If there is interest in it, maybe we can do this change for other
> platforms too and in a separate patchset?
> For example, then it might be also interesting to change it in the
> pc_* platforms, as it may solve /dev/sda and /dev/vda issue for
> testing them with qemu.

PARTUUID is certainly an improvement. I used it here:

    https://patchwork.ozlabs.org/patch/976538/

-- 
Carlos Santos (Casantos) - DATACOM, P&D
