Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFCBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8499660E37;
	Sun, 29 May 2022 21:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQFPsONv8W0E; Sun, 29 May 2022 21:01:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 888CE60C13;
	Sun, 29 May 2022 21:01:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A17E71BF3D7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9038460C13
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5a_tmK39SDBz for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:01:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BA7260B9B
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:01:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c90:582e:b0d5:b1ff])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id AF4787802CE;
 Sun, 29 May 2022 23:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653858072;
 bh=vGTgGk9L09vQleeh6FcTqvMX2cZtll1bTL0UnJOFYog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CrfW3ZN4As7PkXMnrTkXczSk+inma9cBzxkfFP5/pwLakNRJDzeUV2M5fPcEcvvZa
 VPoANfePTjjT9kygYWE1wimgNinyxzqYbXLiGgksjgPlVBWtAcJQH9zh5WECfZzoDr
 jwq6MOLXXbVEpgl5HVpdiITJRtIFlKknR7V2oxs/3YbeKu2I+5bJatN0B5TQ/Jz0YT
 zZuH5c+izpBU28p00bgWJ5e6Irnio8CcRzdG/j/FVrj2VjuwEEEYGdgnubWWuPxUfm
 qwHD7RyEH6cfCSlPLk/n5Qzdd5Czj5XGV6aU6YkQEMilOnF2pgllNQM3U+tRPGfjnw
 vtzFFppMwmnLA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 23:01:10 +0200
Date: Sun, 29 May 2022 23:01:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220529210110.GF993669@scaer>
References: <20220521203713.3425992-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220521203713.3425992-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: fix uclibc without
 locale support build
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

James, All,

On 2022-05-21 14:37 -0600, James Hilliard spake thusly:
> Backport a patch fixing uclibc support when locale support is not
> enabled.
> 
> Fixes:
> http://autobuild.buildroot.net/results/658/658ace73425c93dfa34212564d19395c9018f3e6
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ild-on-uclibc-without-locale-support.patch | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch
> 
> diff --git a/package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch b/package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch
> new file mode 100644
> index 0000000000..0f2e6844e5
> --- /dev/null
> +++ b/package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch
> @@ -0,0 +1,65 @@
> +From 4738c934bbf2a86aa62d752a130d13c524a47696 Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Fri, 20 May 2022 20:18:07 -0600
> +Subject: [PATCH] Fix build on uclibc without locale support
> +
> +When uclibc is build with !UCLIBC_HAS_LOCALE the macro
> +__LOCALE_C_ONLY will be set, use this to disable unsupported and
> +not required(due to only supporting the C locale) locale functions.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[james.hilliard1@gmail.com: backport from upstream commit
> +4738c934bbf2a86aa62d752a130d13c524a47696]
> +---
> + spa/include/spa/utils/string.h | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/spa/include/spa/utils/string.h b/spa/include/spa/utils/string.h
> +index 43d19616c..edf4e954f 100644
> +--- a/spa/include/spa/utils/string.h
> ++++ b/spa/include/spa/utils/string.h
> +@@ -275,14 +275,20 @@ static inline int spa_scnprintf(char *buffer, size_t size, const char *format, .
> +  */
> + static inline float spa_strtof(const char *str, char **endptr)
> + {
> ++#ifndef __LOCALE_C_ONLY
> + 	static locale_t locale = NULL;
> + 	locale_t prev;
> ++#endif
> + 	float v;
> ++#ifndef __LOCALE_C_ONLY
> + 	if (SPA_UNLIKELY(locale == NULL))
> + 		locale = newlocale(LC_ALL_MASK, "C", NULL);
> + 	prev = uselocale(locale);
> ++#endif
> + 	v = strtof(str, endptr);
> ++#ifndef __LOCALE_C_ONLY
> + 	uselocale(prev);
> ++#endif
> + 	return v;
> + }
> + 
> +@@ -319,14 +325,20 @@ static inline bool spa_atof(const char *str, float *val)
> +  */
> + static inline double spa_strtod(const char *str, char **endptr)
> + {
> ++#ifndef __LOCALE_C_ONLY
> + 	static locale_t locale = NULL;
> + 	locale_t prev;
> ++#endif
> + 	double v;
> ++#ifndef __LOCALE_C_ONLY
> + 	if (SPA_UNLIKELY(locale == NULL))
> + 		locale = newlocale(LC_ALL_MASK, "C", NULL);
> + 	prev = uselocale(locale);
> ++#endif
> + 	v = strtod(str, endptr);
> ++#ifndef __LOCALE_C_ONLY
> + 	uselocale(prev);
> ++#endif
> + 	return v;
> + }
> + 
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
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
