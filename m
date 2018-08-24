From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Aug 2018 17:40:54 +0200
Subject: [Buildroot] [PATCH] package/rauc: needs kernel headers >= 3.0
In-Reply-To: <20180824143728.05576d39@windsurf>
References: <20180824080217.16181-1-yann.morin.1998@free.fr>
 <20180824134900.1ccc9c2c@windsurf> <20180824120119.GO9365@scaer>
 <20180824143728.05576d39@windsurf>
Message-ID: <20180824154054.GP9365@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-08-24 14:37 +0200, Thomas Petazzoni spake thusly:
> On Fri, 24 Aug 2018 14:01:19 +0200, Yann E. MORIN wrote:
> > That is not really possible, because emmc support is core to rauc; it is
> > not even optional in the current code. Removing it (by making it
> > conditional) does not make sense IMHO (but I'm not using rauc).
> > 
> > And then, technically, it would require quite some overhaul in rauc,
> > because access to the emmc code is made from a lot of places.
> 
> Tadada. The problematic piece of code is not used for eMMC support in
> general, just for eMMC boot partition support. It was added by a single
> commit between v0.3 and v0.4 and is pretty self-contained and
> well-isolated.
> 
> So I took what you said as a challenge, and came up with:
> 
>   http://patchwork.ozlabs.org/patch/961842/
> 
> Which has the added benefit of fixing the build issue of host-rauc :-)
> 
> Since it took me 36 minutes between your e-mail and this e-mail being,
> I don't think "quite some overhaul in rauc" was really needed :-P

Wooo... You took the bait quite easily! ;-)

But seriously, I indeed only skimmed for 'emmc' in the code. and there
are quite a few call sites. Now, does it make sense to disable this emmc
boot support at all? Let's see what upstream has to say about that. ;-)

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
