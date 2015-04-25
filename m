From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 23:59:02 +0200
Subject: [Buildroot] [PATCHv3 17/18] packages: refactor checks using
 BR_BUILDING
In-Reply-To: <20150425205257.GT4275@free.fr>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-18-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150425205257.GT4275@free.fr>
Message-ID: <20150425215902.GV4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-25 22:52 +0200, Yann E. MORIN spake thusly:
> On 2015-04-25 16:43 +0200, Thomas Petazzoni spake thusly:
> > Instead of manually testing MAKECMDGOALS, use the newly introduced
> > BR_BUILDING variable to know if we're building or not.
[--SNIP--]
> >  # Checks to give errors that the user can understand
> > -ifeq ($(filter source,$(MAKECMDGOALS)),)
> > +ifeq ($(BR_BUILDING),y)
> >  ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
> 
> I think it would be good to have a single way we do those checks.
> 
> For example, compare at91bootstrap above and at91bootstrap3 here.
> The former is doing the BR2_BUILDING check and package-enabled check
> in a single ifeq, while the latter does it with two ifeq.
> 
> I don't really care which we use, but we should use the same everywhere.
> Maybe we could favour doing it with feq, for those packages that want to
> do multiple checks.

Slip of the fingers... I meant:  do it with two ifeq...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
