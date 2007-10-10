From: Jonathan Nalley <buildroot@bluebot.org>
Date: Wed, 10 Oct 2007 15:24:51 -0500
Subject: [Buildroot] ARM soft-float toolchain build crashes 20071004
In-Reply-To: <209987.86403.qm@web32604.mail.mud.yahoo.com>
References: <20071006200755.GG20951@aon.at>
	<209987.86403.qm@web32604.mail.mud.yahoo.com>
Message-ID: <d83696340710101324r343d18d8r72e6160fc38b5979@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I have found that selecting:

(big endian)
BR2_armeb=y

with EABI + soft-float will NOT build correctly (svn revision: 20210)

It dies while building libmudflap (gcc).  I set
BR2_EXTRA_GCC_CONFIG_OPTIONS="--disable-libmudflap" and this got me a bit
further, but still died in gcc-final.

I then found that if I set:

(little endian)
BR2_arm=y

with everything else the same everything builds fine.

BTW - I had the buildroot working with armeb + eabi + soft-float + gcc
4.1.2quite a while back (svn revision: 18419).  I ran into the above
issue when I
updated to svn revision 20210.  I tried with both gcc 4.1.2 and 4.2.1 and
found that little endian (BR2_arm) works while (BR2_armeb) does not.  I have
set BR2_xscale=y, BR2_ARM_EABI=y and BR2_SOFT_FLOAT=y in all cases.

Regards,

Jon Nalley

On 10/10/07, Gertjan Hofman <gertjan_hofman@yahoo.com> wrote:
>
> Dear bernard,
>
> Sorry for the slow response. Aside from a long weekend
> here, it takes a while to run through various
> compilations from scratch. I am never sure that the
> various make cleans work properly so I often end up
> restarting a buildroot build from the tar file,
> leading to long download & compile times.
>
> If I copy the  integrator926_defconfig file as .config
> the make indeed works fine. So I suspect it's your
> different uclibc config file which makes it work.
>
> This is what I find difficult about BuildRoot - you
> choose an option in make menuconfig and it has an
> effect on a package that now needs a different config
> as well - but unless you familiarize your self with
> each package and create config files seperately, this
> is not a simple task.
>
> I note your file compiles for EABI by default. I tried
> setting back to OABI in the main config file and I
> would have expected BuildRoot to remake the tool
> chain. It doesnt.
>
> If I get any further I will post the information.
>
> Gertjan
>
>
>
>
>
>
>
>
> --- Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
>
> > On Thu, Oct 04, 2007 at 03:11:44PM -0700, Gertjan
> > Hofman wrote:
> > >Don't want to report this as a bug if it's
> > not...but.
> > >
> > >Dowload 4-Oct-2007 version of buildroot. Choose ARM
> >
> > Unfortunately this doesn't tell me what svn revision
> > that is, but this
> > doesn't really matter this time.
> >
> > >processor, choose 'soft-float' in make menuconfig.
> >
> > Please note that this is not a crash but a
> > build-failure.
> >
> > I have a sample for an ARM integrator in target/Arm.
> > Can you check your settings against this one and
> > follow-up with your
> > findings?
> >
> > TIA,
> >
>
>
>
>
>       ____________________________________________________________________________________
> Tonight's top picks. What will you watch tonight? Preview the hottest
> shows on Yahoo! TV.
> http://tv.yahoo.com/
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071010/7e092ab9/attachment.htm 
