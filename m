From: PHIL.EDWORTHY at renesas.com <PHIL.EDWORTHY@renesas.com>
Date: Tue, 10 May 2011 08:34:19 +0100
Subject: [Buildroot] [PATCH] sh: Fix Buildroot sh targets to match
 gnuconfig targets
In-Reply-To: <20110510084704.7cd44147@surf>
References: <1304946773-5734-1-git-send-email-phil.edworthy@renesas.com>
	<20110510084704.7cd44147@surf>
Message-ID: <OF668F5E2A.89729554-ONC125788C.00277D08-8025788C.002987DD@eu.necel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> On Mon, 09 May 2011 14:12:53 +0100
> Phil Edworthy <PHIL.EDWORTHY@renesas.com> wrote:
>
> > sh2eb and sh2a_nofpueb gnuconfig targets are no longer supported
> > in Buildroot. This patch replaces these Buildroot targets with sh2
> > and sh2a respectively, and adds sh4a targets as these are widely
> > used.
> >
> > To build for devices without an fpu, the relevant toolchain flags
> > will have to be specified.
>
> Thanks a lot for coming back so quickly with an updated patch and
> clarification about SuperH support. That's really nice!

Well I use Buildroot a lot for SH4A devices and appreciate all the hard
work that has gone into it.


> > diff --git a/fs/jffs2/Config.in b/fs/jffs2/Config.in
> > index 5748fbb..9a96d7d 100644
> > --- a/fs/jffs2/Config.in
> > +++ b/fs/jffs2/Config.in
> > @@ -94,8 +94,8 @@ choice
> >     prompt "Endianess"
> >     default BR2_TARGET_ROOTFS_JFFS2_BE if BR2_armeb || \
> >           BR2_avr32 || BR2_m68k || BR2_mips || \
> > -         BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
> > -         BR2_sh3eb || BR2_sh4eb || BR2_sparc
> > +         BR2_powerpc || BR2_sh2 || BR2_sh2a || \
> > +         BR2_sh3eb || BR2_sh4eb || BR2_sh4aeb || BR2_sparc
>
> Not your fault, but we should probably try to use BR2_ENDIAN here, in
> order to have the big/little endian list of architectures in a common
> location and not duplicated here in JFFS2. But that's a separate
> matter, and should be fixed in a separate patch.

Yes, I thought that as well. I took the view that a simple update for the
moment was best.


> > diff --git a/toolchain/elf2flt/elf2flt/config.sub b/toolchain/elf2flt/elf2flt/config.sub
> > index 4279c84..2072457 100755
> > --- a/toolchain/elf2flt/elf2flt/config.sub
> > +++ b/toolchain/elf2flt/elf2flt/config.sub
>
> Just curious, as I have never used Buildroot to build a toolchain for
> non-MMU platforms (only used pre-built Blackfin toolchains so far). How
> does this elf2flt thing fits into the toolchain build process ?
>
> Instead of patching this config.sub file, wouldn't it be possible to
> use the one we have in package/gnuconfig/ ? Or, put it differently, is
> there an upstream location for elf2flt we could use instead of having
> its source code directly into the Buildroot tree ?

When I created this patch I tried to build some SH toolchains using BR.
This failed for both SH2A and SH4A and I probably can't find the time to
fix these at the moment. I only use the pre-built CodeSourcery toolchains.

So to answer your question about elf2flt, I don't know. However, I noticed
the targets were wrong so I thought it would make sense to correct it as its
related. Unfortunately, I know nothing about elf2flt...

Thanks
Phil
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110510/fcc99450/attachment.html>
