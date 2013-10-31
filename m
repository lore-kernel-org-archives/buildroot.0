From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 31 Oct 2013 09:29:53 +0200
Subject: [Buildroot] [PATCH 5/5] util-linux: Fix cross-compile for
 host-util-linux when ncurses not selected
In-Reply-To: <20131030221859.0e7f43f6@skate>
References: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
 <1383164412-20657-5-git-send-email-olivier.schonken@gmail.com>
 <20131030221859.0e7f43f6@skate>
Message-ID: <CALdGsk+LHVm_bVsHbAz2zZguxKXpHxcrmNPKjsyrd30J_HihjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

I have again tried to reproduce the build failure, but I am unable.  My
only guess is that something went wrong while linking host-util-linux with
the installed ncurses-dev (64-bit) using the 32-bit gcc and g++ tools that
were installed at the time.  Will try to reproduce, but I might have to do
a clean install of ubuntu 13.10, and follow my exact steps.  Will remove
this patch from patchwork for now, and either resubmit, or report back once
I hit the issue again.

Regards

Olivier Schonken


On Wed, Oct 30, 2013 at 11:18 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Olivier Schonken,
>
> On Wed, 30 Oct 2013 22:20:12 +0200, Olivier Schonken wrote:
>
> > +ifeq ($(BR2_PACKAGE_NCURSES),y)
> > +HOST_UTIL_LINUX_DEPENDENCIES += ncurses
> > +else
> > +HOST_UTIL_LINUX_CONF_OPT += --without-ncurses
> > +endif
>
> This cannot be correct. BR2_PACKAGE_NCURSES tells whether ncurses is
> enabled for the target, but you're using that to decide how to
> configure the host util-linux.
>
> Since I believe we most likely don't need ncurses support at all in the
> host util-linux, we can unconditionally add a --without-ncurses to
> HOST_UTIL_LINUX_CONF_OPT. Could you resend an updated patch that
> implements this?
>
> Also, it would be good if you could improve the commit log by adding
> the relevant piece of build log containing the util-linux configure
> error.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131031/4f8c1ca7/attachment.html>
