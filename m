From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 12 Jun 2013 13:37:47 -0500
Subject: [Buildroot] [RFC] ti-gfx: add new package
In-Reply-To: <CALo-6+gN5w46v_AB7LqGNJ6K1ySY+HJw6--y-HUhMgzFnXv6rg@mail.gmail.com>
References: <CALo-6+j77P2RsdYRO9BR04rUX-j0HmxzXtBuHzo_UQ1wDjXbHQ@mail.gmail.com>
 <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
 <CALo-6+ihs6caa98RCvZmZKZ5pUsfXjXPPBJn_zG4J6eBBpsuAw@mail.gmail.com>
 <CAEBucnC-HdSyDttBo4te_=eOR259ebSAwWQuE_W3zcyLVjwSQA@mail.gmail.com>
 <CALo-6+gN5w46v_AB7LqGNJ6K1ySY+HJw6--y-HUhMgzFnXv6rg@mail.gmail.com>
Message-ID: <CAEBucnAOFQBgOTXuq+gkge_SnKeS6bO-cuuD2K4rCZ-OfO-izw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 12, 2013 at 12:55 PM, Charles Krinke
<charles.krinke@gmail.com> wrote:
> Unfortunately, the patch triggers a kernel build. The current issue is
> a defconfig for this kernel compile. For am AM3517, one would expect
> to use AM3517_evm_defconfig which does not exist in the mainline
> kernel, so the rootfs cannot be built with the patch.
>
> Perhaps some words on *how* make it get past errors might help use
> this patch, sir?
>
>
> On 6/12/13, Spenser Gilliland <spenser@gillilanding.com> wrote:
>> Charles,
>>
>>
>>> I believe including a kernel compile with this patch is a problem for
>>> several reasons.
>>
>> There is no kernel compile in this patch.   Only the sgx kernel modules are
>> built.  The make KERNELDIR=path/to/sgx/dir modules only builds the modules
>> in the current directory.
>>
>>> The first is that the TI defconfig for AM3517_evm never made it into
>>> the Linux kernel along with all the supporting changes, so the build
>>> fails.
>>
>> You can use any kernel you would like and are not bound to mainline
>> kernels.  If the ti kernel has the needed patches, you may use it.  The
>> only requirement is that the kernel is specified in the kernel
>> configuration section.
>>
>>> The second is that folks are using various versions of Graphics_SDK
>>> from 4_05_xx through 4_09_xx. These same folks generally build the
>>> Graphics_SDK once externally to buildroot to avoid carrying a 135MB
>>> file in the dl/ directory. This doesnt make sense for buildroot for
>>> two kernel .ko modules where 135MByte is larger then any other
>>> package.
>>
>> It has to be downloaded anyways and as long as you don't distclean often;
>> it will only be downloaded once.  It may make sense to provide an option to
>> select which version of the gfx sdk but there's no need if they maintain
>> backwards compatibility.
>>
>>> Perhaps you can consider making Graphics_SDK an external reference in
>>> your patch to make things go more smoothly?
>>
>> IMHO. This would complicate the process.   The method presented would allow
>> people with no ti-gfx experience to quickly get up and running.
>>
>> Thanks,
>>
>> Spenser
>>
>
>
> --
> Charles Krinke

Charles,

In mainline I believe AM35xx is covered by the omap2plus defconfig but
I'm not completely certain. You can also use a custom kernel location
with
LINUX_OVERRIDE_SRCDIR=/path/to/your/kernel/tree or If you obtained it
from git or a tarball, please tell me the source of your kernel and I
can help you setup the BR2_LINUX_KERNEL sections.

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
