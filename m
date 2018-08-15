From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Aug 2018 18:16:57 +0200
Subject: [Buildroot] [PATCH 3/3] New <pkg>-update-last-config-fragment
 target in pkg-kconfig.mk
In-Reply-To: <20180815140413.62984968@windsurf>
References: <20180730155153.24091-1-m.patzlaff@pilz.de>
 <20180730155153.24091-4-m.patzlaff@pilz.de>
 <20180730234643.34315d11@windsurf> <20180731154948.GB8537@scaer>
 <20180814162705.505476fe@windsurf>
 <83afeab5-baf8-122e-15ab-17889c3a300d@mind.be>
 <20180815140413.62984968@windsurf>
Message-ID: <20180815161657.GC2556@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, Marcel, All,

On 2018-08-15 14:04 +0200, Thomas Petazzoni spake thusly:
> On Wed, 15 Aug 2018 01:20:29 +0200, Arnout Vandecappelle wrote:
> > > Marcel, do you think you could rework your patch series to go in the
> > > direction of showing a diff rather than arbitrarily adjusting the last
> > > fragment ?  
> > 
> >  Note that the diff really applies to the last fragment only, in the sense that
> > if the last fragment is setting CONFIG_BAR, the "is unset" bit has to come after
> > it. I don't think there is a way to say anything sensible automatically except
> > for the last fragment.
> 
> Yes, the diff cannot be blindly applied to anything but the last
> fragment. But the idea in showing the diff is not for the user to apply
> it blindly, but rather to determine which parts of the diff should be
> reflected to each fragment.

Indeed, it is not to be considered to be a diff of any of the fragment,
but of the configuration *as a whole*.

That's why I initially did not write a full diff, but only the delta
snippet, not the context, because it is a diff, not a patch.

But I think we should instead use the scripts/diffconfig script that is
in the linux kernel tree, and which outputs looks like:

    $ cat config.000
    CONFIG_FOO=y
    $ cat config.001
    CONFIG_FOO is not set
    $ ./scripts/diffconfig config.000 config.001
     FOO y -> n

which IMNSHO is exactly the message we want to convey.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
