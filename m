From: Martin Banky <Martin.Banky@gmail.com>
Date: Tue, 5 Oct 2010 11:54:47 -0700
Subject: [Buildroot] [PATCH 05/10] microcom: convert to gentargets
In-Reply-To: <20101005112147.2bc80d0e@surf>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
	<1286266963-23413-5-git-send-email-Martin.Banky@gmail.com>
	<20101005112147.2bc80d0e@surf>
Message-ID: <AANLkTim76qFFMTStNN-D_ompE2Bcw+ZeT0aWgBE3bd=e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
     I guess I should have explained this better. What I meant about
microcom being a flat archive, is that when you extract it, it does not
create a directory for itself. It just sticks its files, without a directory
being created, in the current directory. $(TAR_STRIP_COMPONENTS)=1 is
'Automatically detect tar --strip-path/components option', which, equates to
either --strip-path or --strip-components, depending on the version of tar.
Per the man page: --strip-components = 'strip NUMBER leading components from
file names on extraction', which means that for microcom, which doesn't have
a directory structure, it strips all the file names off, so no files
actually get extracted. This in turn, means that the patch routine does not
work. Hence, the reason for manually patching microcom. If you have a better
solution, I'd appreciate it, if you would show me, because I couldn't figure
one out. I hope this makes more sense.

Martin

On Tue, Oct 5, 2010 at 2:21 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Tue,  5 Oct 2010 01:22:38 -0700
> Martin Banky <martin.banky@gmail.com> wrote:
>
> > +define MICROCOM_CONFIGURE_CMDS
> > +     $(ZCAT) $(DL_DIR)/$(MICROCOM_SOURCE) | tar -C $(@D) $(TAR_OPTIONS)
> -
>
> This sounds strange to me. The extraction is already done by the
> package infrastructure.
>
> >       toolchain/patch-kernel.sh $(MICROCOM_DIR) package/microcom/
> \*.patch
>
> This as well.
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
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101005/f8254073/attachment.html>
