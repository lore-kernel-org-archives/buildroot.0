Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8714C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 15:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BF4F40476;
	Sat, 16 Jul 2022 15:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BF4F40476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bcLt5ZkzggC; Sat, 16 Jul 2022 15:38:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D75D400FB;
	Sat, 16 Jul 2022 15:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D75D400FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44FE31BF4DA
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FA8D607F4
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FA8D607F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EldbIbAb44IO for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 15:38:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE0460AEB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FE0460AEB
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 15:38:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b44d:f503:4d93:3115])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1210CB00712;
 Sat, 16 Jul 2022 17:37:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Jul 2022 17:37:56 +0200
Date: Sat, 16 Jul 2022 17:37:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220716153756.GG2543@scaer>
References: <20220711215236.978488-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220711215236.978488-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1657985879;
 bh=KAaupnI0/cYNCcKvdlGob24HXS+g1mJonJEU2/TNBK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ORXM3Zotr/eXsEjVQ7bIjJLA/jt2BA4EwTOVlCTvW0ux0JEB6y82SPeJqtSo7z7hf
 +rFZW9/8rWDgRfeiOhivcKb0zFt0XAu3yh9d4KGl0oDJF9ckM+6vi9qjCvLAKrzKXD
 ixxgEN0oqxHpzs3UhJ5s6ASrjOs7ez+fjXwCZhNnyiaqOk3cOgVINrZU9RTZv7AOUB
 aGw3EDmp/67mn/73IV9sZj9SSRvJRFb6LNGpNGyUXBKFRpevdL7MxY9csH/yzzXEqM
 wTY3C6VsvEYBjRJMgAYQLP23+u+rrmQacgGTZOTEAFjwPALkexHOobyezsiIUWD6oz
 SlchDWsgCzONA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ORXM3Zot
Subject: Re: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.28.1
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

Fabrice, All,

On 2022-07-11 23:52 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2022-35409: Buffer overread in DTLS ClientHello parsing.
> 
> https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/advisories/mbedtls-security-advisory-2022-07.md
> https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mbedtls/mbedtls.hash | 4 ++--
>  package/mbedtls/mbedtls.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index 80ae173aff..38182fe119 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.0:
> -sha256  6519579b836ed78cc549375c7c18b111df5717e86ca0eeff4cb64b2674f424cc  mbedtls-2.28.0.tar.gz
> +# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.1:
> +sha256  6797a7b6483ef589deeab8d33d401ed235d7be25eeecda1be8ddfed406d40ff4  mbedtls-2.28.1.tar.gz
>  # Locally calculated
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index 8745ff33f4..af87d62b30 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MBEDTLS_VERSION = 2.28.0
> +MBEDTLS_VERSION = 2.28.1
>  MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
>  MBEDTLS_CONF_OPTS = \
>  	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
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
