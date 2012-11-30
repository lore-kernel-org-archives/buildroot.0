From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Nov 2012 17:38:37 +0100
Subject: [Buildroot] [PATCH 03/51] package/dtc: add option to install
	programs
In-Reply-To: <50B77872.80005@mind.be>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <1354146890-27380-4-git-send-email-yann.morin.1998@free.fr>
 <50B77872.80005@mind.be>
Message-ID: <201211301738.37463.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Thursday 29 November 2012 Arnout Vandecappelle wrote:
>   I (and I think Peter as well) prefer the more verbose
> 
> ifeq ($(BR2_PACKAGE_DTC_BINARY),y)
> DTC_INSTALL_RULE = install
> else
> DTC_BUILD_RULE   = libfdt
> DTC_INSTALL_RULE = libfdt_install
> endif

Yes, it's easier to read.

>   I would also call it _TARGET instead of _RULE.

Why? DTC_INSTALL_TARGET already exists, and is meant to specify if the
package is to be installed in tharget.

OTOH, DTC_INSTALL_RULE (or DTC_INSTALL_MAKERULE, but it's ugly) is more
explicit: it is the make rule to install the package.

>   I would prefer the same rule for staging and target install:
> - it doesn't hurt to have the executable in staging;
> - it's easier to read if it's the same;

Well, not too fond of it: staging serves a different purpose than target,
so I prefer separating the rules. Peter: arbitration, please! ;-)

> - when we finally get around to creating $(make-package), the default install
> commands will be
> $(MAKE) -C $(@D) DESTDIR=... $($(PKG)_INSTALL_TARGET)
> (where _INSTALL_TARGET is the same for target and staging and defaults to
> 'install')

I was not aware of the make-package upcoming infra. However:

- as already said above: $(PKG)_INSTALL_TARGET is already used.
- I'd suggest using _RULE (or _MAKERULE) as the suffix
- hopefully, we'll have a way to specify different rules for straging
  and target.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
