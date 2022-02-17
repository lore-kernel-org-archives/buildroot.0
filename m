Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABB1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3374560BC6;
	Thu, 17 Feb 2022 20:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LwJnUa_E5c94; Thu, 17 Feb 2022 20:50:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51F0960A8A;
	Thu, 17 Feb 2022 20:50:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78A761BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7412F83F67
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0bx06bPr5GEx for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:50:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 423E883E93
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:50:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d44f:202d:8a3e:695f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 69FB813F87F;
 Thu, 17 Feb 2022 21:50:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645131007;
 bh=HLvzrvktMYqDzhCuaBgs7/1L2EJHRLugGU+EVkGe60c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mRIWTR3FoeYIsl1iOBe0kSAFpnrxzImhqqLnidCak/mZF0qZ8SyAHatT/iWIH4HUu
 eD8Sfx7HNGQh2J3YzBaIXY1ZE41lCZtXl3bkd5SOM5z5yeDwXmHVL5PXhTKn6gSPOf
 jG28f0e18H+7UWPYqL7y7aW7wH4Vsjxxo5JXyufmJUBBi2iIDzCePbafz6GXt7oygy
 GxbE/OXbdeX6zbxnewBnJRmNhNdrPUmm0OjZwunb8CrhibKZbTEnl6vwFc1EJopAcO
 JfDe2I6Bmb/7PmW8DtosS/upbJW3ddwqtDEWNMizt7Pj7iSSGfRYraDf6PwVAAJ3Ne
 P0y85Vat70Vzw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 21:50:04 +0100
Date: Thu, 17 Feb 2022 21:50:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220217205004.GK522310@scaer>
References: <20220213212909.1504992-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220213212909.1504992-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptsetup: openssl is the
 default crypto backend
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-02-13 22:29 +0100, Fabrice Fontaine spake thusly:
> openssl is the default crypto backend since version 2.1.0 and
> https://github.com/mbroz/cryptsetup/commit/bc3d0feb5cd33f9181102b418cc7bf44fe112e82
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cryptsetup/cryptsetup.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 55cc70576c..b50ac698bb 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -22,15 +22,15 @@ CRYPTSETUP_AUTORECONF = YES
>  CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
>  CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
>  
> -# cryptsetup uses libgcrypt by default, but can be configured to use OpenSSL
> +# cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt
>  # or kernel crypto modules instead
> -ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +CRYPTSETUP_DEPENDENCIES += openssl
> +CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
> +else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  CRYPTSETUP_DEPENDENCIES += libgcrypt
>  CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
>  CRYPTSETUP_CONF_OPTS += --with-crypto_backend=gcrypt
> -else ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -CRYPTSETUP_DEPENDENCIES += openssl
> -CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
>  else
>  CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
>  endif
> -- 
> 2.34.1
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
