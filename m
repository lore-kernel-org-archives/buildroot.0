From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Aug 2018 23:12:47 +0200
Subject: [Buildroot] [PATCH] linux: kconfig needs the toolchain
In-Reply-To: <20180801154832.GB2294@scaer>
References: <20180731201617.20829-1-yann.morin.1998@free.fr>
 <d703b5fb-a3e9-6398-c5e8-bf63c25ba106@mind.be>
 <20180801083541.653e1abc@windsurf> <20180801154832.GB2294@scaer>
Message-ID: <20180801211247.GE2294@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On 2018-08-01 17:48 +0200, Yann E. MORIN spake thusly:
> On 2018-08-01 08:35 +0200, Thomas Petazzoni spake thusly:
> > On Wed, 1 Aug 2018 00:21:18 +0200, Arnout Vandecappelle wrote:
> > > > Like is done in the kconfig-package infra for the dependency on
> > > > $(1)-patch, we use an order-only prerequisites on the toolchain,
> > > > to guarantee the compiler is available before we can display the
> > > > kconfig of the kernel.  
[--SNIP--]
> > This could even be pushed one level up to the pkg-kconfig
> > infrastructure, as we're pretty likely to see other packages go down
> > this route in the future maybe ? Of course, it should be optional.
> 
> Well, I also thought about that, but decided against, because we don't
> want to generalise a behaviour based on a single case.
[--SNIP--]
> So I'd prefer waiting, and hard-coding that one peculiarity within the
> only user so far, the linux kernel.

And now, I changed my mind, seeing that the curent state of oaffairs
with host-flex and host-bison is already broken...

I'll post an updated series that implements this at the kconfig level
soon-ish.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
