From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Sep 2016 14:53:47 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: Be sure to reconfigure
 the package on foo-reconfigure
In-Reply-To: <20160917144233.116fbc8a@free-electrons.com>
References: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
 <20160916190517.01d3dd5a@free-electrons.com>
 <20160916190244.GC3650@free.fr>
 <20160917144233.116fbc8a@free-electrons.com>
Message-ID: <20160917125347.GA3613@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-09-17 14:42 +0200, Thomas Petazzoni spake thusly:
> On Fri, 16 Sep 2016 21:02:44 +0200, Yann E. MORIN wrote:
[--SNIP--]
> > So, I'd like to argue that this patch fixes the reported issue and covers
> > the use-case you pointed to.
> 
> That was not the use-case I pointed to, what I pointed to what the
> following use-case:
> 
>  1. Create a Buildroot configuration, with Linux enabled, using the
>     omap2plus_defconfig
> 
>  2. Build your system.
> 
>  3. Go in menuconfig, and change the Linux defconfig to
>     mvebu_v7_defconfig.
> 
>  4. Run "make linux-reconfigure"
> 
> I would expect the newly defined Linux configuration to be taken into
> account, but it's not, it only re-does the fixups and doesn't reload
> the configuration from mvebu_v7_defconfig.

Ah, I did not understand that. Indeed, this use-case is not covered,
neitehr currently nor with this patch applied.

However, I wonder how we could detect that condition...

> Now, we can discuss whether this is the behavior that we want or not.
> But at least,  that's the behavior I was referring to, and which your
> patch doesn't address.

Indeed, that's not covered. But neither is it a regression...

> *But*, I'll apply your patch nonetheless because it fixes other issues,
> and doesn't change the behavior I'm describing.

Thanks!

I'll see if we can do something to cover your use-case...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
