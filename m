From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Jul 2014 19:28:21 +0200
Subject: [Buildroot] PACKAGE_USERS does not work
In-Reply-To: <53C0182B.5080907@mind.be>
References: <i5np0ra770dn4ujwdmsweh48.1405067942517@email.android.com>
 <CAJtjsKbLN1-yEkBq=cCsoaOx_n+LUYof1P51T3wzOupaxR75JQ@mail.gmail.com>
 <53BFE547.70600@posteo.de> <53C0182B.5080907@mind.be>
Message-ID: <20140711172821.GD3739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-07-11 19:00 +0200, Arnout Vandecappelle spake thusly:
> On 11/07/14 15:23, J?rg Krause wrote:
> > unfortunatly there is no error message. As I mentioned, I can build upmpdcli
> > with success. Here is the contents of my package/upmpdcli/upmpdcli.mk:
> > 
> >     ################################################################################
> >     #
> >     # upmpdcli
> >     #
> >     ################################################################################
> > 
> >     UPMPDCLI_VERSION = 0.7.1
> >     UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
> >     UPMPDCLI_LICENSE = GPLv2
> >     UPMPDCLI_LICENSE_FILES = LICENSE
> >     UPMPDCLI_INSTALL_STAGING = YES
> >     UPMPDCLI_INSTALL_TARGET = YES
> >     UPMPDCLI_AUTORECONF = YES
> >     UPMPDCLI_CONF_OPT = --prefix=/usr
> >     UPMPDCLI_DEPENDENCIES = host-pkgconf
> >     UPMPDCLI_DEPENDENCIES += libupnp
> >     UPMPDCLI_DEPENDENCIES += libmpdclient
> > 
> >     define UPMPDCLI_USERS
> >         upmpdcli -1 upmpdcli -1 * - - -
> >     endef
> > 
> >     define UPMPDCLI_INSTALL_INIT_SYSV
> >         $(INSTALL) -m 0755 package/upmpdcli/S99upmpdcli $(TARGET_DIR)/etc/init.d/
> >     endef
> > 
> >     $(eval $(autotools-package))
> > 
> > I would expect that upmpdcli will be added to shadow, passwd, and group in
> > output/target/etc, but it isn't. I think it has something to do with
> > PACKAGES_USERS in package/pkg-generic.mk. If i rebuild avahi, I can see that
> > make adds the entry of AVAHI_USERS to PACKAGES_USERS, but for my build of
> > upmpdcli it doesn't. I also tried another custom package.
> 
> 
>  Is it possible that you ran 'make upmpdcli' and don't have BR2_PACKAGE_UPMPDCLI
> set?

Yes, that's what I suspect, too; hence the reason I asked J?rg to share
the exact commands he used to do the build.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
