From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Jul 2013 11:35:17 -0300
Subject: [Buildroot] [PATCH 0/9] Fix internal blackfin toolchain
In-Reply-To: <20130727162335.0e5bf70c@skate>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
 <20130727162335.0e5bf70c@skate>
Message-ID: <51F3DAA5.70903@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/27/2013 11:23 AM, Thomas Petazzoni wrote:
> Committed entire series, with the minor fixes I pointed on the
> individual patches.
> 
> Note that when you select FLAT format, it is still ELF binaries that
> are produced in $(O)/target. Most likely related to our non-working
> handling of elf2flt, as discussed recently on the list regarding ARM
> noMMU platforms. So this patch series certainly improves the situation,
> but doesn't fix the whole thing yet :)

Thanks.
Yes, as i've stated, it's a first patchset/try of fixing things, but
most certainly not tested :)
I've been playing a bit with fixing ARM nommu, quick notes say we need
to ditch libmudflap, change the tuple (uclinux-eabi & maybe
uclinux-elf), make host-elf2flt a hard dep (it's invoked at link time by
gcc with the appropiate tuple), probably add the mmu-less cortex
processors (M*, R4), and get someone to test the whole thing.
I've still didn't get the whole thing to build properly but it's close.
Regards.
