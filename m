From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 19:03:30 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/providers
In-Reply-To: <20131220103143.53d1434e@skate>
References: <cover.1387495624.git.yann.morin.1998@free.fr>
 <20131220103143.53d1434e@skate>
Message-ID: <20131220180330.GA3484@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-20 10:31 +0100, Thomas Petazzoni spake thusly:
> On Fri, 20 Dec 2013 00:43:23 +0100, Yann E. MORIN wrote:
> 
> > This series is a third attempt at trying to fix the BR2_EXTERNAL issue,
> > in that packages in BR2_EXTERNAL can't be providers of an implementation
> > for a virtual package, such as libegl.
[--SNIP--]
> A few minor questions:
[--SNIP--]
>  *) The jpeg virtual package should also be converted in the same way.

As you said, jpeg is also a virtual package. But since it is not written
the same way the others are, the change will be more involved than the
one done in this series.

So, I'd prefer this series (which is relatively simple) stays as-is, and
that once it is applied, we take care of jpeg (and cryptodev), by turning
them into "real virtual" packages (can't help but use that phrase of
yours, Gustavo! :-p).

>  *) In PATCH 1, in package/rpi-userland/Config.in, you're adding an if
>     BR2_PACKAGE_RPI_USERLAND ... endif block, but *before* the comment
>     related to the toolchain dependencies of rpi-userland. I never
>     remember if that is the situation causing indentation problem of the
>     comment in menuconfig or not. Would be good to check this.

Nope, since we're in a 'menu', not a 'menuconfig'.
The menu layout is still correct.

And even with a menuconfig, what is busted is if one option or a comment
is in the middle of other dependent options, such as:

    menuconfig FOO
        bool "foo"

    config BAR
        bool "bar"
        depends on FOO

    comment "FOO deps busted"

    config BUZ
        bool "buz"
        depends on FOO

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
