From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 12 Dec 2015 23:39:40 +0100
Subject: [Buildroot] [PATCH v9 06/32] package/efl/libefl: new package
In-Reply-To: <566C699E.5070804@openwide.fr>
References: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
 <1449927215-3452-7-git-send-email-romain.naour@openwide.fr>
 <20151212151524.0b711e40@free-electrons.com> <566C699E.5070804@openwide.fr>
Message-ID: <566CA22C.6010808@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

>>
>>> +# Prefer openssl (the default) over gnutls.
>>> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
>>> +LIBEFL_DEPENDENCIES += openssl
>>> +LIBEFL_CONF_OPTS += --with-crypto=openssl
>>> +else ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
>>> +LIBEFL_DEPENDENCIES += gnutls libgcrypt
>>> +LIBEFL_CONF_OPTS += --with-crypto=gnutls \
>>> +	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
>>
>> Why do you need both gnutls and libgcrypt for gnutls support ?
> 
> I've keept libgcrypt dependency from the old libecore package. I'm not sure we
> still need it.

libgcrypt is still needed for the gnutls support otherwise:

lib/emile/emile_main.c:8:20: fatal error: gcrypt.h: No such file or directory
 #include <gcrypt.h>

Best regards,
Romain

> 
> Best regards,
> Romain
> 
>>
>> Thanks!
>>
>> Thomas
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
