From: James Newell <jnewell@wgate.com>
Date: Thu, 08 Feb 2007 09:26:05 -0500
Subject: [Buildroot] building ARM toolchain with nofpu
In-Reply-To: <168013e20702072350j59e08339maf8cbc711f00d958@mail.gmail.com>
References: <c88e466f0701311609u4896b81ehb99cb2eb01f78886@mail.gmail.com>
	<1170878990.10007.4.camel@ndragon.eng.wgate.com>
	<200702072124.30009.yann.morin.1998@anciens.enib.fr>
	<200702072136.41131.yann.morin.1998@anciens.enib.fr>
	<168013e20702072350j59e08339maf8cbc711f00d958@mail.gmail.com>
Message-ID: <1170944765.10007.16.camel@ndragon.eng.wgate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2007-02-08 at 15:50 +0800, carl zhu wrote:
> Hi Yann, so you mean if use this patch, GCC 4.0.4 can work with
> uclibc? I still feel a little strange, because I have googled several
> days before, and  I have found someone fixed this issue with applied
> IIRC, Does it do help for this issue?

I think I'm just confused in general.

At first thought I needed a gcc EABI toolchain
(http://wiki.debian.org/ArmEabiPort) for performance reasons but looking
at this table for ARM cores
(http://en.wikipedia.org/wiki/ARM_architecture), I am using the Davinci
which is a ARM926EJ-S, and doesn't appear to have vfp support.  I assume
then it would be better to use soft toolchain.  Is there any way
distinguish an arm elf binary that was built with vfp, fpa, and soft
using the 'file' command or readelf command?  I appreciate the
discussion.  I'm fairly new to arm, and buildroot, but enjoying the
learning curve.
Thanks,
Jim


>  
> I am new for build cross-compiler.
>  
> related link:http://tech.groups.yahoo.com/group/gnuarm/message/1325
> 
>  
> On 2/8/07, Yann E. MORIN <yann.morin.1998@anciens.enib.fr> wrote: 
>         On Wednesday 07 February 2007 212, Yann E. MORIN wrote:
>         > Short answer: it does not work.
>         > See: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=29329  [1]
>         > (not directly related, but yet, useless on ARM).
>         
>         I realise I'm being vague. Some explanations below. 
>         
>         In fact, the patch I posted allows one to successfully build a
>         x-compiler
>         for soft-float armeb (mine is armeb-xscale-linux-uclibc, tuned
>         for Xscale).
>         Unfortunately, the resulting gcc barfs on the squashfs code in
>         the kernel. 
>         A smaller test-case is available in the bug report, suggesting
>         this is quite
>         easy to hit.
>         
>         That's why I've reverted to gcc-4.0.4, which still needs the
>         attached patch,
>         but Just Work (TM).
>         
>         Regards, 
>         Yann E. MORIN.
>         
>         --
>         .-----------------.--------------------.------------------.--------------------.
>         |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON |
>         Erics' conspiracy: |
>         | +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |
>         ^                | 
>         | --==< ?_? >==--
>         ?------------.-------:  X  AGAINST      |  /e\  There is no  |
>         | http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML
>         MAIL    |  """  conspiracy.  | 
>         ?------------------------------?-------?------------------?--------------------?
>         
> 
