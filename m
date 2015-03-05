From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 09:25:35 +0100
Subject: [Buildroot] [PATCH] pkg-generic: Fix host _DL_VERSION corner
 case
In-Reply-To: <CANn-YGRf7_yfdkXPwdjS-5CGSn8XkfUnhwKA+4-aO=PnAUOyxA@mail.gmail.com>
References: <1424816770-14271-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150304235606.23277563@free-electrons.com>
 <CANn-YGRf7_yfdkXPwdjS-5CGSn8XkfUnhwKA+4-aO=PnAUOyxA@mail.gmail.com>
Message-ID: <20150305092535.1f310c0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 4 Mar 2015 17:17:50 -0600, Clayton Shotwell wrote:

> >> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> >> index 1b09955..fcef461 100644
> >> --- a/package/pkg-generic.mk
> >> +++ b/package/pkg-generic.mk
> >> @@ -323,7 +323,11 @@ $(2)_RAWNAME                     =  $$(patsubst host-%,%,$(1))
> >>  # version control system branch or tag, for example remotes/origin/1_10_stable.
> >>  ifndef $(2)_VERSION
> >>   ifdef $(3)_VERSION
> >> -  $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
> >> +  ifdef $(3)_DL_VERSION
> >> +   $(2)_DL_VERSION := $$(strip $$($(3)_DL_VERSION))
> >> +  else
> >> +   $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
> >> +  endif
> >
> > However, I haven't yet made up my mind on whether this proposed
> > solution is the best one, or if we have a chance of doing something
> > clearer/nicer for this _VERSION vs. _DL_VERSION thing.
> 
> This was the simplest solution I could come up with without reworking
> a lot of the pkg-download logic. I figured that if the _DL_VERSION of
> non-host version was already set then it should be used, otherwise the
> _VERSION string should be modified.

Note that I was not saying that your proposal is not good. It's just
that it was already almost midnight my time, and it was too late to
really think about the right solution :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
