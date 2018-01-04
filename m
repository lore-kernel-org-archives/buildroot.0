From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Jan 2018 16:20:48 +0100
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <20171229105521.78a4e35a@windsurf.lan>
References: <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
 <20171214061850.62bb4ae9@windsurf.png.is.keysight.com>
 <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
 <20171228162307.GD3428@scaer> <20171228225639.GK3428@scaer>
 <20171229055921.abdwvjddkvcuncyr@tarshish>
 <20171229093818.GA3176@scaer>
 <20171229104219.71c908e6@windsurf.lan>
 <20171229095242.GB3176@scaer>
 <20171229105521.78a4e35a@windsurf.lan>
Message-ID: <20180104152048.GA3684@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-12-29 10:55 +0100, Thomas Petazzoni spake thusly:
> On Fri, 29 Dec 2017 10:52:42 +0100, Yann E. MORIN wrote:
> > > > Rather than duplicate the optional dependency on Busybox in all the
> > > > packages (and as Thomas demonstrated, there are quite a few of them).  
> > > Seems like a good idea to me.  
> > For that, we'll need the three-patch series I submitted to Busybox:
> >     http://lists.busybox.net/pipermail/busybox/2017-December/086039.html
> Absolutely. Hopefully, upstream will give some feedback soon.

Upstream has merged those three patches now, so we can rely on a clean
way to install without clobbering existing utils; we just have to use:
    make install-noclobber

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
