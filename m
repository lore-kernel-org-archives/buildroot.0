From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 13:14:43 +0100
Subject: [Buildroot] [PATCH] infra/ccache: avoid color diagnostics with
 GCC older than v4.9
In-Reply-To: <20170212100800.GC4533@free.fr>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
 <20170211163845.71459758@free-electrons.com>
 <20170212100800.GC4533@free.fr>
Message-ID: <20170212131443.155d5a7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Feb 2017 11:08:00 +0100, Yann E. MORIN wrote:

> > Another option would be to adjust this in ccache itself at compile time
> > (i.e when ccache gets built) rather than having to pass this additional
> > GCC_COLORS variable in the environment when building things. This way
> > we would be absolutely sure -fdiagnostics-color will never be passed.
> > Hence why I'd like the feedback from other developers.  
> 
> But there is no config option to disable that in ccache. The behaviour
> is hard-coded; we would need a patch to disable that.

We could sed it like we already do in package/ccache/ccache.mk for
other things.

> And we might need that for the host as well, no?
> 
>     ifeq ($(BR2_HOST_GCC_AT_LEAST_4_9),)
>     HOST_MAKE_ENV += GCC_COLORS=""
>     endif

Check Carlos original patch, it was there.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
