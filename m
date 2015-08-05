From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Aug 2015 21:53:25 +0200
Subject: [Buildroot] [PATCH 4/9] docs/manual: document gcc version
 dependencies
In-Reply-To: <20150805110552.1846c7bf@free-electrons.com>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150804195858.GW3647@free.fr>
 <20150805110552.1846c7bf@free-electrons.com>
Message-ID: <20150805195325.GD3647@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-05 11:05 +0200, Thomas Petazzoni spake thusly:
> On Tue, 4 Aug 2015 21:58:58 +0200, Yann E. MORIN wrote:
> > > +* GCC version
> > > +** Dependency symbol: +BR2_TOOLCHAIN_GCC_AT_LEAST_X_Y+, (replace
> > > +   +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
> > > +** Comment string: +gcc >= X.Y+ and/or `gcc <= X.Y` (replace
> > 
> > One of the condition is between ++ and the other between ``. I konow you
> > just replicated what was done for the kernel headers, but wuld it not be
> > better to use only ++ (or only ``, I don't mind) but not both?
> 
> There is actually a good reason for that: if you use +...+ for +gcc <=
> X.Y+, then the <= gets replaced by the <= mathematic character rather
> than being the two characters < and =.

Ah, right. Now I remember why they were different. Still, we should not
mix the two possibilities, and just use `` since that's what works.

> So I've kept the special use of `...` for the time being.

Yep, good.

I'll prepare a patch to fix that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
