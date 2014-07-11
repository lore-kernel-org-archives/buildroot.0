From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Jul 2014 19:26:51 +0200
Subject: [Buildroot] PACKAGE_USERS does not work
In-Reply-To: <53BFE547.70600@posteo.de>
References: <i5np0ra770dn4ujwdmsweh48.1405067942517@email.android.com>
 <CAJtjsKbLN1-yEkBq=cCsoaOx_n+LUYof1P51T3wzOupaxR75JQ@mail.gmail.com>
 <53BFE547.70600@posteo.de>
Message-ID: <20140711172651.GC3739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2014-07-11 15:23 +0200, J?rg Krause spake thusly:
>   ################################################################################
>   #
>   # upmpdcli
>   #
>   ################################################################################
> 
>   UPMPDCLI_VERSION = 0.7.1
>   UPMPDCLI_SITE = [1]http://www.lesbonscomptes.com/upmpdcli/downloads
>   UPMPDCLI_LICENSE = GPLv2
>   UPMPDCLI_LICENSE_FILES = LICENSE
>   UPMPDCLI_INSTALL_STAGING = YES
>   UPMPDCLI_INSTALL_TARGET = YES
>   UPMPDCLI_AUTORECONF = YES
>   UPMPDCLI_CONF_OPT = --prefix=/usr
>   UPMPDCLI_DEPENDENCIES = host-pkgconf
>   UPMPDCLI_DEPENDENCIES += libupnp
>   UPMPDCLI_DEPENDENCIES += libmpdclient
> 
>   define UPMPDCLI_USERS
>       upmpdcli -1 upmpdcli -1 * - - -
>   endef
> 
>   define UPMPDCLI_INSTALL_INIT_SYSV
>       $(INSTALL) -m 0755 package/upmpdcli/S99upmpdcli $(TARGET_DIR)/etc/init.d/
>   endef
> 
>   $(eval $(autotools-package))

I added this package to my tree here (plus the missing Config.in, of
course), enabled upmpdcli in the menuconfig, and ran 'make'.

And I do have upmpdcli as a user in /etc/passwd:

    $ grep upm target/etc/passwd
    upmpdcli:x:1001:1001::/:/bin/false

And here is the relevant part of the log:

    printf 'toto -1 titi -1 * - - -\n       upmpdcli -1 upmpdcli -1 * - - -\n' >>
    /home/ymorin/dev/buildroot/br.config/build/rpi/minimal/output/build/_users_table.txt

The 'toto' user is a test user I added to another package, just to
check.

To be noted: users get created only when generating a filesystem.

Can you share the exact commands you used to build?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
