From: Martin Banky <Martin.Banky@gmail.com>
Date: Tue, 5 Oct 2010 12:10:08 -0700
Subject: [Buildroot] [PATCH 06/10] microperl: convert to gentargets
In-Reply-To: <20101005111943.7ed624fa@surf>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
	<1286266963-23413-6-git-send-email-Martin.Banky@gmail.com>
	<20101005111943.7ed624fa@surf>
Message-ID: <AANLkTiky1e8pNGMw3=ocpK1sAZ3gnqmrsfG25q6pGnZv@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
     To be honest, I didn't delve into the reason why Errno.pm is needed by
the host. Also, the original makefile did not seem to really differentiate
between host and target. It modified the source and built both the host and
target from this one modified set of files. This is why I didn't create a
host build. I realize that 'ext/util/make_ext nonxs Errno MAKE="$(firstword
$(MAKE))" \' builds the host Errno.pm portion, but by that time so much work
has already been done, it seemed wasteful to repeat it for the target. I
couldn't figure out what modifications were only necessary for the host, and
which for the target, or if they were needed for both. I'm open to
suggestions.

Martin

On Tue, Oct 5, 2010 at 2:19 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue,  5 Oct 2010 01:22:39 -0700
> Martin Banky <martin.banky@gmail.com> wrote:
>
> > +define MICROPERL_CONFIGURE_CMDS
>
> I am not a huge huge fan of this, because it's subverting the purpose
> of MICROPERL_CONFIGURE_CMDS to do a more-or-less partial build of
> microperl for the host. Do we really need such a partial build ? If so,
> shouldn't we create a host-microperl package ?
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
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101005/79a8df39/attachment.html>
