From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jul 2015 07:28:18 +0200
Subject: [Buildroot] [PATCH v8 1/1] Added linux drivers backports project
In-Reply-To: <1437519630-3674-1-git-send-email-petr.vorel@gmail.com>
References: <1437519630-3674-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <20150722052818.GA4041@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2015-07-22 01:00 +0200, Petr Vorel spake thusly:
> https://backports.wiki.kernel.org
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> TODO: still don't know how to handle dependency on linux .config for
> target linux-backports-menuconfig.
> TODO: use kernel-module? IMHO not suitable for linux-backports.

As I said in my previous mail, I have adopted this patch. It means I
did some changes to it locally, notably bump to 4.1.1-1 and solve
the configury dependency, see my branch:
    http://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/linux-backports

I was about to send it yesterday evening/night, but I was really
exhausted after a long working day, so I post-poned the respin to avoid
mishaps due to tiredness. ;-) I'll probably send it this evening when
I'm back home (UTC+2).

As for the configury stuff, it will need another patch to be applied
first, to fix a breakage in the pkg-kconfig infra (my bad!), see:
    https://patchwork.ozlabs.org/patch/498333/

> Changes v7->v8:
> * Bump version to latest stable 4.1.1-1 (dropped upsteam patx to fix
>   build error - released in new version).
> * s/TARGET_MAKE_ENV/LINUX_MAKE_ENV (suggested by Yann E. MORIN)
> * Improve text in menuconfig (suggested by Yann E. MORIN)
> * Move fragments list after the base files in menuconfig (suggested by
>   Yann E. MORIN)
> * Add comments for nesting ifeq-blocks (suggested by Yann E. MORIN)
> * Fix indentation in Config.in

I will see to include those changes from your v8 into my own branch (if
I missed anything).

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
