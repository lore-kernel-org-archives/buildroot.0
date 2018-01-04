From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Jan 2018 16:39:22 +0100
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <20180104162957.4290e890@windsurf.lan>
References: <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
 <20171228162307.GD3428@scaer> <20171228225639.GK3428@scaer>
 <20171229055921.abdwvjddkvcuncyr@tarshish>
 <20171229093818.GA3176@scaer>
 <20171229104219.71c908e6@windsurf.lan>
 <20171229095242.GB3176@scaer>
 <20171229105521.78a4e35a@windsurf.lan>
 <20180104152048.GA3684@scaer>
 <20180104162957.4290e890@windsurf.lan>
Message-ID: <20180104153922.GB3684@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-01-04 16:29 +0100, Thomas Petazzoni spake thusly:
> On Thu, 4 Jan 2018 16:20:48 +0100, Yann E. MORIN wrote:
> > Upstream has merged those three patches now, so we can rely on a clean
> > way to install without clobbering existing utils; we just have to use:
> >     make install-noclobber
> Great! So the idea is to have Busybox install its stuff *after* all the
> packages that install full-blown versions. Correct ?

Yes, that is what I understood from the discussion, we would just need to:

1. remove the conditional dependencies on busybox in all packages;

2. add a conditrional dependency in busybox for each package of which
   busybox may install an applet;

3. use the install-noclobber rule;

4. drop the BUSYBOX_NOCLOBBER_INSTALL hook.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
