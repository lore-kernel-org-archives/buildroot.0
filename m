Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6203EECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 11:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D94B60F8B;
	Mon,  5 Sep 2022 11:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D94B60F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQTj33hgrg4a; Mon,  5 Sep 2022 11:51:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62E7960AFC;
	Mon,  5 Sep 2022 11:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62E7960AFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B52FA1BF318
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 11:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89D4F401F2
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 11:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89D4F401F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpU9CriUnKjV for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 11:51:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB5C8400AF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB5C8400AF
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 11:51:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a5dc:9bd4:48b0:8ef0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9AA63B00772;
 Mon,  5 Sep 2022 13:51:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Sep 2022 13:51:21 +0200
Date: Mon, 5 Sep 2022 13:51:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20220905115121.GC1490660@scaer>
References: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662378684;
 bh=OfsgIMbAMMgIAicbQcos86gVu/7rCwK9rUp1KO7MagU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=coML8HknTlUMUz4HYWPub1d1A+5KEhR5NV67f+WWLDiGPosNtZLZwlEkZRftQ9fob
 m9IaP9v09hRkJ1j8+6xR0c9ZlmzLURebsbxmn/5mhXKJff2X+u5k4V36AIniYhUl8J
 Xb193EWAbI0BHLLgGTify1HZkdtRNgs08RQpWzrnBD7CpDb3TqXDk1kKeH1NrZiFcB
 RGQ0uvhgr8aIWAm5ulA1FfgVNMrgTHQa5/0/jQNvBl0qGLRop+t1pgNN0lMeXRzUcX
 zTr1qBoaAW7IKU7ApRI5CX8a0+Fxq8Qhp1L4N1QMvsYVewINXEAnEUfKJv5+x7SDu2
 zX2ferhtr/oQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=coML8Hkn
Subject: Re: [Buildroot] [PATCH v2 1/1] package/shadow: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Raphael, All,

On 2022-09-04 14:43 +0200, Raphael Pavlidis spake thusly:
> shadow provides utilities to deal with user accounts.

You will probably have more explanations to provide in the commit log,
to explain how the pacakge is integrated in Buildroot. See the qustions
below...

> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

In addition to Arnout's quick review, here's my own quick review...

[--SNIP--]
> diff --git a/package/shadow/Config.in b/package/shadow/Config.in
> new file mode 100644
> index 0000000000..616f002618
> --- /dev/null
> +++ b/package/shadow/Config.in
> @@ -0,0 +1,81 @@
> +menuconfig BR2_PACKAGE_SHADOW
> +	bool "shadow"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14

As Arnout noted, shadow, or ony some of its utilities, may come
conflicting with busybox' provided applets.

So, we also need a dependency in Config.in:

    depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

Note: *if* only sub-options of shadow do conflict, then the dependency
should be moved dow to those sub-options.

> +	help
> +	  Utilities to deal with user accounts.
> +
> +	  https://github.com/shadow-maint/shadow
> +
> +if BR2_PACKAGE_SHADOW
> +
> +config BR2_PACKAGE_SHADOW_SHADOWGRP
> +	bool "shadowgrp"
> +	default y

We usually have no option that defaults to 'y', and when we do, there
is a reason for that, so please explain that in the commit log. This
comment is also valid for all the symbols below that default to y.

> +	help
> +	  Enable shadow group support.
> +
> +if BR2_PACKAGE_LINUX_PAM

When there is a single symbol that is conditional, I think a singluar
depends on is better:

> +config BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID
> +	bool "account-tools-setuid"

    depends on BR2_PACKAGE_LINUX_PAM

Also, I was wondering if that should instead be a select rather than a
depends-on. I.e. is account-tools-setuid something that "manages" PAM
settings, or is it something that uses PAM to amanage accounts? If the
former, then a depends-on is more appropriate, but if the latter, then a
select is better.

If that makes more sense to select, then:

    config BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID
        bool "account-tools-setuid"
        depends on BR2_USE_MMU  # linux-pam
        depends on BR2_ENABLE_LOCALE  # linux-pam
        depends on BR2_USE_WCHAR  # linux-pam
        depends on !BR2_STATIC_LIBS  # linux-pam
        select BR2_PACKAGE_LINUX_PAM

    comment "account-tools-setuid needs a toolchain w/ shared libs, wchar, locale"
        depends on BR2_USE_MMU
        depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR \
                || !BR2_ENABLE_LOCALE

> +	help
> +	  Install the user and group management tools setuid and authenticate the
> +	  callers.

(hint: here, it seems to suggest we would better use a select)

> +endif # BR2_PACKAGE_LINUX_PAM
> +
> +config BR2_PACKAGE_SHADOW_UTMPX
> +	bool "utmpx"
> +	help
> +	  Enable loggin in utmpx / wtmpx.
> +
> +config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
> +	bool "subordinate-ids"
> +	default y
> +	help
> +	  Support subordinate ids.

An help entry that just repeats the prompt is totally useless. If there
is nothing better than to repeat the prompt, then don't provide a help
entry. Otherwise, provide actual help.

> +config BR2_PACKAGE_SHADOW_SHA_CRYPT
> +	bool "sha-crypt"
> +	default y
> +	help
> +	  Allow the SHA256 and SHA512 password encryption algorithms.

Note: the is a very good and terse help entry.

> +config BR2_PACKAGE_SHADOW_BCRYPT
> +	bool "bcrypt"
> +	help
> +	  Allow the bcrypt password encryption algorithm.

s/bcrypt/blowfish block cipher/ and you get a better help entry.

> +config BR2_PACKAGE_SHADOW_YESCRYPT
> +	bool "yescrypt"
> +	help
> +	  Allow the yescrypt password encryption algorithm.
> +
> +config BR2_PACKAGE_SHADOW_NSCD
> +	bool "nscd"
> +	default y
> +	help
> +	  Enable support for nscd.
> +
> +config BR2_PACKAGE_SHADOW_SSSD
> +	bool "sssd"
> +	default y
> +	help
> +	  Define to support flushing of sssd caches.
> +
> +config BR2_PACKAGE_SHADOW_GROUP_NAME_MAX_LENGTH
> +	int "group-name-max-length"
> +	default 16

Does it really make sense to have this be configurable?
If so, why is 16 the default, rather than unlimited?

And if we keep it, then the prompt should not have dashes, but be a
sentence (i.e. it is not the name of program installed by shwadow):

    bool "max length of group names"

> +	help
> +	  Set max group name length. (0 equals infinity)
> +
> +config BR2_PACKAGE_SHADOW_SU
> +	bool "su"
> +	default y

This one will definitely conflict with Busybox' own su.

> +	help
> +	  Build and install su program.

This does not provide much help, so I'd just drop the help entry.

[--SNIP--]
> diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
> new file mode 100644
> index 0000000000..140d830cb9
> --- /dev/null
> +++ b/package/shadow/shadow.mk
> @@ -0,0 +1,171 @@
> +################################################################################
> +#
> +# shadow
> +#
> +################################################################################
> +
> +SHADOW_VERSION = 4.11.1
> +SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/v$(SHADOW_VERSION)
> +SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
> +SHADOW_LICENSE = BSD-3-Clause
> +SHADOW_LICENSE_FILES = COPYING
> +
> +SHADOW_CONF_OPTS += \

This is the first, unconditional assignment; it should be a simple
assignment, not an append-assignment.

> +	--disable-man \
> +	--without-btrfs \
> +	--without-skey \
> +	--without-tcb
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +SHADOW_CONF_OPTS += --enable-static
> +else
> +SHADOW_CONF_OPTS += --disable-static
> +endif
> +
> +ifeq ($(BR2_SHARED_LIBS),y)
> +SHADOW_CONF_OPTS += --enable-shared
> +else
> +SHADOW_CONF_OPTS += --disable-shared
> +endif

So, first, both options are already passed appropriately by the
autotools package infrastructure, so why do you need to pass them?

Second, --{en,disable}-{static,shared} is supposed to drive the build
of static or shared libraries, not the fact that anything is shared or
statically linked.

> +ifeq ($(BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID),y)
> +SHADOW_CONF_OPTS += --enable-account-tools-setuid
> +SHADOW_ACCOUNT_TOOLS_SETUID = \
> +	/usr/sbin/chgpasswd f 4755 0 0 - - - - - \
> +	/usr/sbin/chpasswd f 4755 0 0 - - - - - \
> +	/usr/sbin/groupadd f 4755 0 0 - - - - - \
> +	/usr/sbin/groupdel f 4755 0 0 - - - - - \
> +	/usr/sbin/groupmod f 4755 0 0 - - - - - \
> +	/usr/sbin/newusers f 4755 0 0 - - - - - \
> +	/usr/sbin/useradd f 4755 0 0 - - - - - \
> +	/usr/sbin/usermod f 4755 0 0 - - - - -

Use a define here (also, the other two conditional permissions end with
_PERMISSIONS, so do it here to):

    define SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS
    	/usr/sbin/chgpasswd f 4755 0 0 - - - - -
    	/usr/sbin/chpasswd f 4755 0 0 - - - - -
    	/usr/sbin/groupadd f 4755 0 0 - - - - -
    	/usr/sbin/groupdel f 4755 0 0 - - - - -
    	/usr/sbin/groupmod f 4755 0 0 - - - - -
    	/usr/sbin/newusers f 4755 0 0 - - - - -
    	/usr/sbin/useradd f 4755 0 0 - - - - -
    	/usr/sbin/usermod f 4755 0 0 - - - - -
    endef

Note: ditto for SHADOW_SUBORDINATE_IDS_PERMISSIONS: use a define rather
than a multi-line (and I suspect a multi-line does not actually work...)

> +else
> +SHADOW_CONF_OPTS += --disable-account-tools-setuid
> +endif

[--SNIP--]
> +ifeq ($(BR2_PACKAGE_ACL),y)
> +SHADOW_CONF_OPTS += --with-acl
> +SHADOW_DEPENDENCIES += acl

Pet peeve of mine: I prefer that dependencies be listed before config
options. Indeed, semantically, we need the dependency to be fulfilled
before we can use it; it also more closely match the unconditional
dependencies and config options.

> +else
> +SHADOW_CONF_OPTS += --without-acl
> +endif
[--SNIP--]
> +ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +SHADOW_CONF_OPTS += --with-libpam
> +SHADOW_DEPENDENCIES += linux-pam
> +else
> +SHADOW_CONF_OPTS += --without-libpam
> +endif

Is the dependency on linux-pam only needed for account-tools-setuid, or
can shadow also use linux-pam for something else?

If the former, then the dependency and activating of the PAM opotion
should be moved together in the conditional block that deals with
enabling account-tools-setuid. If the latter, then a small comment could
be added, like:

    # linux-pam is also used without account-tools-setuid enabled

> +ifeq ($(BR2_ENABLE_LOCALE),y)
> +SHADOW_CONF_OPTS += --enable-nls
> +else
> +SHADOW_CONF_OPTS += --disable-nls
> +endif

This is supposed to also be already handled by the autotools-package
infrastructure, see:
    package/pkg-autotools.mk@201
    package/Makefile.in@392

So, why is it needed to explicitly handle them here?

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_PACKAGE_SHADOW_GROUP_NAME_MAX_LENGTH),0)
> +SHADOW_CONF_OPTS += --without-group-name-max-length
> +else
> +SHADOW_CONF_OPTS += --with-group-name-max-length=$(BR2_PACKAGE_SHADOW_GROUP_NAME_MAX_LENGTH)
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SHADOW_SU),y)
> +SHADOW_CONF_OPTS += --with-su
> +SHADOW_SU_PERMISSIONS = /bin/su f 4755 0 0 - - - - -
> +else
> +SHADOW_CONF_OPTS += --without-su
> +endif
> +
> +define SHADOW_PERMISSIONS
> +	/usr/bin/chage f 4755 0 0 - - - - -
> +	/usr/bin/chfn f 4755 0 0 - - - - -
> +	/usr/bin/chsh f 4755 0 0 - - - - -
> +	/usr/bin/expiry f 4755 0 0 - - - - -
> +	/usr/bin/gpasswd f 4755 0 0 - - - - -
> +	/usr/bin/newgrp f 4755 0 0 - - - - -
> +	/usr/bin/passwd f 4755 0 0 - - - - -
> +	$(SHADOW_ACCOUNT_TOOLS_SETUID)
> +	$(SHADOW_SUBORDINATE_IDS_PERMISSIONS)
> +	$(SHADOW_SU_PERMISSIONS)
> +endef
> +
> +$(eval $(autotools-package))
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
