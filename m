Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A93C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C60C40299;
	Mon,  6 Jun 2022 13:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdDocitVXzBP; Mon,  6 Jun 2022 13:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5F664167A;
	Mon,  6 Jun 2022 13:36:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC4CB1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9643415C9
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYo1_bQVYD-w for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:36:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FC0C410BB
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:36:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4013:c8f0:ae9b:2a1c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A1BAA78039D;
 Mon,  6 Jun 2022 15:36:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654522572;
 bh=X/RyApSuTYsRKJfGkHcC6ZCXJVEKhioMniyZbzZlLBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HKCDn8HbzdqHtfS4A624PR+5GszPRt0CyWRi0Tge6RgJJp8w6amZT2GUXiPWCxWsE
 1QSlIN52FMer1qO5eqJplY0ucFkWIHldgU+w+bmzl6D0qYUMNmdNwT/Pg/7pKOvj7a
 6YotinJXJG4z9J4G+LxUrc1TaAQMD7AoStTG6ZHOtuO55/wW2ewWMgNd7lsNpSuUdd
 7oaVHLgs+v++qXcQnMVU0XKUpq5bGBBntvoclaM0Mfq4O/4HYrzu8b0HWXHQ18DtAu
 Zq1X8Ludyv+PYOCpuxuuu4Bq4Fcl9f1uxYp5Vnenp5m9v6q8qpa1nspmFx1VHZ9YWG
 296FKhtwPs0Gg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 Jun 2022 15:36:10 +0200
Date: Mon, 6 Jun 2022 15:36:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dimi Tomov <dimi@tpm.dev>
Message-ID: <20220606133610.GY427639@scaer>
References: <20220605124749.719103-1-dimi@tpm.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220605124749.719103-1-dimi@tpm.dev>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: fix missing CA bundle
 when wolfssl is SSL/TLS provider
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dimitar, All,

On 2022-06-05 15:47 +0300, Dimi Tomov spake thusly:
> From: Dimitar Tomov <dimi@tpm.dev>
> 
> Without CA bundle curl can not verify the remote peer and work with https.
> This is fixed by adding a config option pointing to the default location
> for CA bundle in buildroot. Alternatives like OpenSSL and MbedTLS use the
> same path, however the wolfSSL build options for libcurl did not include
> this path until now.
> 
> Signed-off-by: Dimitar Tomov <dimi@tpm.dev>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcurl/libcurl.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 15943f7512..11f1e4de59 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -77,6 +77,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL_WOLFSSL),y)
>  LIBCURL_CONF_OPTS += --with-wolfssl=$(STAGING_DIR)/usr
> +LIBCURL_CONF_OPTS += --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
>  LIBCURL_DEPENDENCIES += wolfssl
>  else
>  LIBCURL_CONF_OPTS += --without-wolfssl
> -- 
> 2.27.0
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
