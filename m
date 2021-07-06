From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Jul 2021 23:22:07 +0200
Subject: [Buildroot] [PATCH v2 08/18] package/pkg-generic.mk: move
 python fixup to generic package infrastructure
In-Reply-To: <20210706195048.GO2521@scaer>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-9-herve.codina@bootlin.com>
 <20210706195048.GO2521@scaer>
Message-ID: <20210706212207.GR2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-07-06 21:50 +0200, Yann E. MORIN spake thusly:
> On 2021-07-06 16:24 +0200, Herve Codina spake thusly:
> > Fixing _sysconfigdata*.{py,pyc} was previously done by python package
> > infrastructure. Some packages use python stuff without using python
> > package infrastructure.
> > These packages perform overwrites and need the specific python fixup
> > to fix them.
> > 
> > In order to be sure to fix all of these packages, the python fixup
> > is moved to the generic package infrastructure and applied to all
> > packages.
[--SNIP--]
> But then, re-reading the above about the two find commands: if you had
> just moved the macro out of pkg-python.mk and into here, and just added:
>     $(2)_POST_PREPARE_HOOKS += PKG_PYTHON_FIXUP_SYSCONFIGDATA

And as usual, it would probably need another name, since it no longer is
in pkg-python.mk. This is a fixup, it's about python, so what about:

    $(2)_POST_PREPARE_HOOKS += FIXUP_PYTHON_SYSCONFIGDATA

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
