From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 May 2017 21:15:10 +0200
Subject: [Buildroot] [PATCH] package/kyua: fix unmet dependencies
In-Reply-To: <20170505190826.11902-1-yann.morin.1998@free.fr>
References: <20170505190826.11902-1-yann.morin.1998@free.fr>
Message-ID: <20170505191510.GA2652@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

S?bastien, All,

On 2017-05-05 21:08 +0200, Yann E. MORIN spake thusly:
> lutok is a lua module, so it depends on ! static libs. However, the
> dependency is implicit, being done because the lua modules are sourced
> globally under an if-block, and thus it is not easy to find that
> dependency.
> 
> Propagate that dependency to kyua, which was missing it (because it is
> not a lua module, so was missing the dependency).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>

You can try on current master (cfe6112780):

    $ make KCONFIG_SEED=0x6DC29DCB randconfig
    warning: (BR2_PACKAGE_KYUA) selects BR2_PACKAGE_LUTOK which has
    unmet direct dependencies (BR2_PACKAGE_HAS_LUAINTERPRETER &&
    !BR2_STATIC_LIBS && BR2_INSTALL_LIBSTDCPP && !BR2_PACKAGE_LUAJIT)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
