From: Paul Cercueil <paul@crapouillou.net>
Date: Mon, 30 Jun 2014 09:44:33 +0200
Subject: [Buildroot] Patchwork cleanup #10: triaging proposal
In-Reply-To: <20140628220856.5fa5db8b@free-electrons.com>
References: <CAAXf6LX2ma3KGuJvskRdLapnev6S2_honVsYaQ5RCzkizbs9OQ@mail.gmail.com>
 <20140628220856.5fa5db8b@free-electrons.com>
Message-ID: <53B11561.5030705@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On 06/28/2014 10:08 PM, Thomas Petazzoni wrote:
> Dear Thomas De Schampheleire,
>
> On Sat, 14 Jun 2014 22:02:31 +0200, Thomas De Schampheleire wrote:
>
>> Triage proposal for this (short) session:
>>
>> qemu: add to host utilities menu
>> Frank Hunleth <fhunleth@troodon-software.com>
>> http://patchwork.ozlabs.org/patch/299014
>>
>> A accept
>
> If this gets applied, it needs to go together with
> http://patchwork.ozlabs.org/patch/319108/. However, I'd like to see a
> solution that merges the existing qemu package with the qemu-system
> package proposed by Gustavo.
>
>> mono runtime porting to buildroot
>> Alexander Varnin <fenixk19@mail.ru>
>> http://patchwork.ozlabs.org/patch/299488
>>
>> B reject/superseded
>> There is a newer patch that not only adds the runtime part, but also
>> the host part, see http://patchwork.ozlabs.org/patch/351871/
>> For the same reason, I already marked
>> http://patchwork.ozlabs.org/patch/323246/ as Superseded.
>
> ACK, so this has already been done, and you don't need more feedback
> about 299488, right?
>
>> udev: Set the default action to "add" in the startup script
>> Paul Cercueil <paul@crapouillou.net>
>> http://patchwork.ozlabs.org/patch/301972
>>
>> C unsure: I asked for more feedback on this patch from the community
>> but no feedback yet. I don't know if this is correct or not.
>
> Same thing here. Unfortunately, Paul rarely gives any feedback about
> the patches he posts, so they often become abandoned in patchwork. Not
> much we can do about it, unfortunately.
>

Sorry about that :/ I don't have internet at home anymore for more than 
one month now so it's not ideal. I will double-check this patch tomorrow 
to be sure that the fix belongs there.

>> [1/2] uclibc: add a missing function member to siginfo.h
>> Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> http://patchwork.ozlabs.org/patch/308384
>>
>> Based on the feedback from Thomas Petazzoni on this patch, I would say:
>> B reject
>
> Well, maybe we should just apply it, and make rt-tests available on
> mips/uclibc for internal toolchains, and keep it disabled for external
> toolchains. Unfortunately, in the autobuilders, we mainly test external
> toolchains, so we're not giving to test rt-tests much. So I still have
> a mixed opinion about such patches. But the uClibc release process is
> dead...
>
>> [2/2] uclibc: Make __SIGEV_PAD_SIZE to take __WORDSIZE into account
>> Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> http://patchwork.ozlabs.org/patch/308383
>>
>> I would guess the same decision as the previous patch applies here:
>> B reject
>
> Yeah, same problem. Maybe my previous opinion is wrong, and we should
> just patch Buildroot's uClibc as needed, and not exclude all
> problematic packages from being used with an external uClibc toolchain.
>
>> [2/2] package: add paragui package
>> H Hartley Sweeten <hsweeten@visionengravers.com>
>> http://patchwork.ozlabs.org/patch/309336
>>
>> Although this package could use a good review because it has some
>> issues, in general we accept new packages so I would mark this as
>> A accept
>
> To be honest, I started having a look at this package, and I continue
> to believe that's it's a totally unmaintained GUI toolkit, with very
> few users, and apparently not a very strong effort to push it from the
> original contributor. So I'd prefer to simply reject the patch.
>
>> [v2,1/1] gst-ffmpeg: add option for LGPL build
>> Danomi Manchego <danomimanchego123@gmail.com>
>> http://patchwork.ozlabs.org/patch/312360
>>
>> I assume this should be
>> A accept
>> but the patch needs review and testing I think.
>
> No opinion on this one, I don't do much gst stuff.
>
> Thomas
>
