Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0DCC433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 17:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC94741C58;
	Wed,  1 Dec 2021 17:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWYqyb4BVAbf; Wed,  1 Dec 2021 17:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1408441C5F;
	Wed,  1 Dec 2021 17:34:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 746C91BF2A0
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 17:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60E7440168
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 17:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVbZ6MZQfAQq for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 17:34:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5C4040539
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 17:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638380055;
 bh=2ntZVb5tm4/MS+RCCOqjiOggg9LBNpwtaE9X7cwHDgk=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=R8DVakuKlPTGP9iHeMYt3Fvr/Z41TTpphZ5lvEgwA2jwhTc6wDOC3qdKpnnJStMss
 h2tId1QP1LkgKiIJQJDusRILsF4PMnbHkLeUc9OJ990VtjHWJ8qDTetFoIgHpinoXb
 SpsUY5MlA9ecmhVRh/6hfGkV1k/Uf6Y1FcMzN/UI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.208.65]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUjC-1maFvB1VDe-00rY0T; Wed, 01
 Dec 2021 18:34:15 +0100
Date: Wed, 1 Dec 2021 18:34:13 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211201183413.2a98291c@gmx.net>
In-Reply-To: <20211201135103.2302297-1-james.hilliard1@gmail.com>
References: <20211201135103.2302297-1-james.hilliard1@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:bOZjmndmaVA8E84UZyT2HICCz0BNP4amK7gt5yE86KW5M2cudwu
 yZJ+SeU+itq+MJEicQbLrQfTDn8m/v8klgpLp5eKbzbkvcepC5mTm6OpLTqot5VU9iByY23
 UtEXqE5VbWCMg4v+aKaKlx3XYg7nmY8pqPtX31KQ1F6SgE1gK0YkjMqFXj/GOxSrq/kois+
 fb+rf/31MkgjYX1hy3xCA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iOzmGSmgQho=:sfy+uAXTbRos6tcgxo0Pbk
 unN+NKfUZSUxaOv8wIZNE8R3hlzFy5oiiCfb1WK/dgrmGeqOg0uq4sx2DcnlkvCkiY3ZZ0cm8
 qYCSgPm1CXmpZrpnbr2RWpgMCCITl/VuSImL9xOeI+ckO89SkjN1CVjW2LuDQjBa1ip1PbmB+
 PX9wdYjygGqm0Nf6X9YmPTpU6INHqraUxNdGoHj2CewHBQ7+V4ztajS+iL4+8sawK3JNVJlhM
 9JiI396gCrr3Nq8WFnQKJ5HQxwrNIhhvm4zVfD/hZjsy+buv72wTH+0JgOIQvV3H/C7atPqgR
 iawhzid7zMVaa4cS0Bckojav2ZZd723Hb2Mjp5CcmqpwrUMnSnLG0nUSfmaIC1sBuz837X9yG
 7n0ASghlDAwHOi1MsWVbr/vxXx6KF78FzRyu4G2gBaFWziGgt6DZpwpOsjNIcSaDyL7N+ulvJ
 K+wy2SIYlCWkoZqW5mQgO4vkJ3HHfo+ZSiHBz6BeV8vT3QhrnzeHheCuYE18U12TeAmLmuf1a
 HRLuxJn5t1s/gqbd/nv5ec7Mle20aQ/LhixWR8SzPAVBR+3z1h/SreuSF9+iqPTz/8Op/0jxU
 ENlJfZa+ranIlG9+PU4P1+19Z33sBn4/QNOAQyKC8MJoAhXML4jqeryxDvNjyouypXvzqgAW8
 lHlQpCF2CXUpjmad9pN/vZhalluH7nRc1D5LqrLdUl07ozTenj4jru75a0AxwH6+8UNq31f+S
 YZ6wr4a0SGp1A+no5fHG51q85n7KN46ShFoRlOCHl+7HNit7FhHxauifpRNbjxZuZ4ZRuF7hf
 RlXv1+a2NAXNqLSyzJUmqShP5HShgEd6/BK+23ORNLfp6E1bHI6/0lYMJlBPYLdz2/sVoMRYw
 HDtR6wIvisWJ2urI6SGBBgcOVUZaDcZZqt4y/Bf8YhZ3UtJ05zd/UKCo+X5b3ThIjoB4GL0HS
 oAG2c/svOKRbjbdQvZwFtirrhDEYYpKVyptfSkTdei2TgjqPSHllouwIUljI94/NSL2698TLK
 MKwGLD3jqwrdooyBynrPnv5sbyL+LRArDv+Bx/Affc2NbG3CvsQpKA5qheUArIdKUSdp21BGq
 pUBUd7vlopcLyo=
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: enable required kernel
 dependencies
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Wed,  1 Dec 2021 06:51:03 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:

> Required kernel options are listed in check_crypto() in srv/main.c:
> https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/main.c?h=1.20#n268

Thanks for doing this (one less point on my long standing ToDo list) ;-)

>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/iwd/iwd.mk | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index 96bdc56e93..8bcd406ea0 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -63,4 +63,34 @@ define IWD_INSTALL_INIT_SYSV
>  	ln -sf /tmp/iwd/hotspot $(TARGET_DIR)/var/lib/iwd/hotspot
>  endef
>
> +define IWD_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_KEY_TYPE)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES_NI_INTEL)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_AES_X86_64)

Not sure if it is good idea to add the x86_64 specific ones unconditionally
(they are marked in check_crypto() with ADD_OPTIONAL instead of ADD_MISSING)?

Regards,
Peter

> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CBC)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_CMAC)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES3_EDE_X86_64)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_ECB)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_HMAC)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD4)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD5)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1_SSSE3)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256_SSSE3)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA512)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA512_SSSE3)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_HASH)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_USER_API_SKCIPHER)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_KEYS)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_KEY_DH_OPERATIONS)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_PKCS7_MESSAGE_PARSER)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_PKCS8_PRIVATE_KEY_PARSER)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_X509_CERTIFICATE_PARSER)
> +endef
> +
>  $(eval $(autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
