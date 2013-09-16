From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 15 Sep 2013 21:16:08 -0400
Subject: [Buildroot] BeagleBoneBlack Updates?
In-Reply-To: <20130914073325.50417147@skate>
References: <CA+-urNRrUA_M45M_99OuGJvpvzRi40tCWoqPWVgUuGtpRPjj4w@mail.gmail.com>
 <20130914073325.50417147@skate>
Message-ID: <CA+-urNSk1Y4ch-GfPGYC52waPaBZ_hP=-iKtMjoXf73g3tmuUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 14, 2013 at 1:33 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Frank Hunleth,
>
> On Fri, 13 Sep 2013 08:58:27 -0400, Frank Hunleth wrote:
> > It's been a while since there's been discussion on the bbb, and I
> > wanted to check on the current status. I've been sitting on some
> > patches that have been working for me for the past few months. Spenser
> > Gilliland had also posted a github reference to his patches a month or
> > so ago. As far as I can tell, the main difference is HDMI and graphics
> > acceleration are either working or close to working in his tree. I
> > don't use either feature.
> >
> > I don't mind making a pass to clean up what I have and submit it to
> > the list, but if work is going on with Spenser's or someone else's
> > then I'll hold off.
>
> I believe Spenser might be busy with the other OpenGL work, so I think
> you could probably take your work and his BBB work, and submit patches
> to the list. I'd really to see the BBB be an officially supported
> platform in Buildroot.

Sounds good.

I just rebased to the upstream and was pleased to see the updated
Linaro compilers. The Beaglebone Debian work uses Linaro 4.8-2013.07,
and I had as a todo item to try to match up compilers when I had a
chance. Both Spenser and I were using EABI compilers (as opposed to an
EABIhf one like Debian.)

I tried making the switch to EABIhf, but found out a that init won't
start due to not being able to load libc.so.6. I assumed that
somewhere I just had a compiler option different so that busybox was
being compiled with a slightly different ABI than what Linaro had done
with their version of libc. As far as I can tell with readelf, I have
both busybox and libc.so.6 reporting ABI 3.1.1 and listing:

Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "7-A"
  Tag_CPU_arch: v7
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_FP_arch: VFPv3
  Tag_Advanced_SIMD_arch: NEONv1
  Tag_ABI_PCS_wchar_t: 4
  Tag_ABI_FP_rounding: Needed
  Tag_ABI_FP_denormal: Needed
  Tag_ABI_FP_exceptions: Needed
  Tag_ABI_FP_number_model: IEEE 754
  Tag_ABI_align_needed: 8-byte
  Tag_ABI_align_preserved: 8-byte, except leaf SP
  Tag_ABI_enum_size: int
  Tag_ABI_HardFP_use: SP and DP
  Tag_ABI_VFP_args: VFP registers
  Tag_CPU_unaligned_access: v6

Right now, I'm not sure where to look for possible other differences.
CodeSourcery and the built-in toolchains work fine (albeit with EABI).
I was wondering if anyone else has run into issues with EABIhf to
might help me debug this.

Thanks,
Frank



>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
