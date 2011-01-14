From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Fri, 14 Jan 2011 10:14:33 -0600
Subject: [Buildroot] [PATCH] htop: new package
In-Reply-To: <20110114085941.6df4841d@surf>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EE63C42@EXV1.corp.adtran.com>
	<20110114085941.6df4841d@surf>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EED6864@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Your patch is word-wrapped. Could you check your e-mail
> client configuration ? You should probably try git send-email, as this
> will guarantee that your patches will make it properly to the list,
> without being word-wrapped or damaged in anyway by the mail client
> you're using.

GGGGRRRRR!!!  I'm using Outlook and I'm behind an Exchange server.  To
that end, will git sendmail work?

> > +       select UCLIBC_HAS_BACKTRACE if BR2_TOOLCHAIN_BUILDROOT
> 
> We can't do that. UCLIBC_HAS_BACKTRACE does not exist in the current
> version of Buildroot. Probably a left over from the packaging of htop
> 0.9, which requires backtrace support.

Leftover from 0.9 -- that's why I went backwards to 0.8.3


> 
> However, even when you'll package htop 0.9, the current policy is not
> to do something like selecting a given UCLIBC option. We either :
> 
>  *) Enable the needed option in our default uClibc build, if the
>     footprint impact is reasonable and the option is sufficiently
> useful
>     for different packages.
> 
>  *) Or add a comment in the package help in Config.in stating that the
>     package would not build with the default uClibc configuration.
> 
> None of those options are perfect, but we'd like to avoid adding
dozens
> and dozens of options at the Buildroot level to tweak every possible
> option of uClibc.


Nah, no reason to.  The HTOP guys say that their next release will auto
detect the presence of backtrace and use it if it is there, so we'll
skip right on past 0.9 when they get it fixed.


> 
> > diff -Naur a/package/htop/htop-cross-no-proc-check.patch
> > b/package/htop/htop-cross-no-proc-check.patch
> > --- a/package/htop/htop-cross-no-proc-check.patch       1969-12-31
> > 18:00:00.000000000 -0600
> > +++ b/package/htop/htop-cross-no-proc-check.patch       2011-01-12
> > 14:51:53.000000000 -0600
> 
> Patch lacks a description of why it is needed and the Signed-off-by
> line.

Hmm, so naming the file htop-cross-no-proc-check is not sufficient for
the comment?  Will fix and resubmit.

> 
> Regards,
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
