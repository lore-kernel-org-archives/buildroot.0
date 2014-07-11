From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Jul 2014 19:00:27 +0200
Subject: [Buildroot] PACKAGE_USERS does not work
In-Reply-To: <53BFE547.70600@posteo.de>
References: <i5np0ra770dn4ujwdmsweh48.1405067942517@email.android.com>
 <CAJtjsKbLN1-yEkBq=cCsoaOx_n+LUYof1P51T3wzOupaxR75JQ@mail.gmail.com>
 <53BFE547.70600@posteo.de>
Message-ID: <53C0182B.5080907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/07/14 15:23, J?rg Krause wrote:
> Hi Johan,
> 
> unfortunatly there is no error message. As I mentioned, I can build upmpdcli
> with success. Here is the contents of my package/upmpdcli/upmpdcli.mk:
> 
>     ################################################################################
>     #
>     # upmpdcli
>     #
>     ################################################################################
> 
>     UPMPDCLI_VERSION = 0.7.1
>     UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
>     UPMPDCLI_LICENSE = GPLv2
>     UPMPDCLI_LICENSE_FILES = LICENSE
>     UPMPDCLI_INSTALL_STAGING = YES
>     UPMPDCLI_INSTALL_TARGET = YES
>     UPMPDCLI_AUTORECONF = YES
>     UPMPDCLI_CONF_OPT = --prefix=/usr
>     UPMPDCLI_DEPENDENCIES = host-pkgconf
>     UPMPDCLI_DEPENDENCIES += libupnp
>     UPMPDCLI_DEPENDENCIES += libmpdclient
> 
>     define UPMPDCLI_USERS
>         upmpdcli -1 upmpdcli -1 * - - -
>     endef
> 
>     define UPMPDCLI_INSTALL_INIT_SYSV
>         $(INSTALL) -m 0755 package/upmpdcli/S99upmpdcli $(TARGET_DIR)/etc/init.d/
>     endef
> 
>     $(eval $(autotools-package))
> 
> I would expect that upmpdcli will be added to shadow, passwd, and group in
> output/target/etc, but it isn't. I think it has something to do with
> PACKAGES_USERS in package/pkg-generic.mk. If i rebuild avahi, I can see that
> make adds the entry of AVAHI_USERS to PACKAGES_USERS, but for my build of
> upmpdcli it doesn't. I also tried another custom package.


 Is it possible that you ran 'make upmpdcli' and don't have BR2_PACKAGE_UPMPDCLI
set?

 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
