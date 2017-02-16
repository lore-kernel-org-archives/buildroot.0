From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Feb 2017 18:45:38 +0100
Subject: [Buildroot] How to force AUTORECONF for everything
In-Reply-To: <089f01d28877$aa0cff70$fe26fe50$@codeaurora.org>
References: <089f01d28877$aa0cff70$fe26fe50$@codeaurora.org>
Message-ID: <20170216174538.GC4986@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sydney, All,

On 2017-02-16 11:11 -0600, Sidney Manning spake thusly:
> I've made a change to libtool which requires that I set PACKAGE_AUTORECONF =
> YES to many of the library packages.  Rather than changing each package, I'd
> like to force this globally.  Is there a way to do that?

No, there is no global setting that forces that behaviour.

You'll have to hack the autotools infra. See in package/pkg-autotools.mk at 143:

  139 ifndef $(2)_AUTORECONF
  140  ifdef $(3)_AUTORECONF
  141   $(2)_AUTORECONF = $$($(3)_AUTORECONF)
  142  else
  143   $(2)_AUTORECONF ?= NO
  144  endif
  145 endif

You may want to change that "NO" to a "YES"

But beware, here be dragins...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
