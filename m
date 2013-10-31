From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Oct 2013 08:40:18 +0100
Subject: [Buildroot] [PATCH 5/5] util-linux: Fix cross-compile for
 host-util-linux when ncurses not selected
In-Reply-To: <CALdGsk+LHVm_bVsHbAz2zZguxKXpHxcrmNPKjsyrd30J_HihjQ@mail.gmail.com>
References: <1383164412-20657-1-git-send-email-olivier.schonken@gmail.com>
 <1383164412-20657-5-git-send-email-olivier.schonken@gmail.com>
 <20131030221859.0e7f43f6@skate>
 <CALdGsk+LHVm_bVsHbAz2zZguxKXpHxcrmNPKjsyrd30J_HihjQ@mail.gmail.com>
Message-ID: <20131031084018.7322934a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Thu, 31 Oct 2013 09:29:53 +0200, Olivier Schonken wrote:

> I have again tried to reproduce the build failure, but I am unable.  My
> only guess is that something went wrong while linking host-util-linux with
> the installed ncurses-dev (64-bit) using the 32-bit gcc and g++ tools that
> were installed at the time.  Will try to reproduce, but I might have to do
> a clean install of ubuntu 13.10, and follow my exact steps.  Will remove
> this patch from patchwork for now, and either resubmit, or report back once
> I hit the issue again.

Well, anyhow, I believe it's safe and a good idea to pass
--without-ncurses when building host-util-linux, so that util-linux
doesn't try to look for some ncurses support on the host machine (we
don't need ncurses support in host-util-linux at all).

Can you send a patch that does just this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
