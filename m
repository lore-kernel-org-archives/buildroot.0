From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Sep 2017 22:01:46 +0200
Subject: [Buildroot] [PATCH 3/4] arch/bfin: internal backend not
 suitable for some cores
In-Reply-To: <20170902214812.70fc882f@windsurf.lan>
References: <cover.1504381100.git.yann.morin.1998@free.fr>
 <fd7e5dc963d17a2a1c33f575fbf73ab1140099f2.1504381100.git.yann.morin.1998@free.fr>
 <20170902214812.70fc882f@windsurf.lan>
Message-ID: <20170902200146.GC3396@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-09-02 21:48 +0200, Thomas Petazzoni spake thusly:
> On Sat,  2 Sep 2017 21:38:51 +0200, Yann E. MORIN wrote:
> > diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
> > index 90e4ab97b0..8c1c80ad52 100644
> > --- a/arch/Config.in.bfin
> > +++ b/arch/Config.in.bfin
> > @@ -6,12 +6,16 @@ choice
> >  	  Specify target CPU
> >  config BR2_bf606
> >  	bool "bf606"
> > +	select BR2_ARCH_NOT_UPSTREAM_GCC
> Where is this symbol introduced?

Grr... Bad rebase... I changed the name at the last minute, and there
was a conflict. Sigh...

> Seems like there is some issue in your patch series.
> 
> Also, as said in my review of PATCH 1/4, perhaps we should simply drop
> those Blackfin variants ?

Well, I personally don't care about bfin, so I'm also fine with removing
the support for those cores.

That being said, we still need the feature, if any thing for
consistency.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
