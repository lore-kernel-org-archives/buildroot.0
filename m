Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8619C432BE
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:33:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92C1860FC3
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92C1860FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6429A605FA;
	Wed,  4 Aug 2021 20:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EHj3Fd74gCl9; Wed,  4 Aug 2021 20:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FCD060A66;
	Wed,  4 Aug 2021 20:33:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36BDB1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2556F60A66
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHS3tJmo63Bo for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:33:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0589B60A62
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:33:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8405:26f6:b20a:5f5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 936A51402FB;
 Wed,  4 Aug 2021 22:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1628109207;
 bh=zuXy2Bnke333qqiWYVc5rWBWn6QzCotNjCa4csEec9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a60+g3+YmBeQ/JxlavSkFAqFJbeYKGEId1pgGkrBaGRZtCx587GAvW+T43UKS6o86
 n7gPU6tcOvZuezWaudUPI8vgyNtDVaAZpDERZIKFA5lI4VubSqsz7QsZLJzrQaE9o0
 gkkGlnENyQ+SVQFZF0U3yn4GE96QbGxB8fhcyynbhGD04FIIxDXiaRuo3cFueIS98H
 KvResoiBFdMf7EwkULdSxjuG3QSyAEnBZV7lTQ6wasoW7YshJcD/sXVBOAOP54ojsW
 24zBk3aHv9Op2taBNSns1d2FaAI1YfEZ/7xSYahXMjJnjLuZtAeiNrlBg2iBACCEPQ
 5fDnPyFjDixaQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 04 Aug 2021 22:33:21 +0200
Date: Wed, 4 Aug 2021 22:33:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210804203321.GL27036@scaer>
References: <20210804202354.1160141-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804202354.1160141-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libuhttpd: fix build with
 wolfssl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-04 22:23 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with wolfssl raised since bump to
> version 3.12.1 in commit 4d85defa7103aadc74223868fb83ed0bed144f4d:
> 
> /tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c: In function 'ssl_context_new':
> /tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c:174:33: error: 'tls13_ciphersuites' undeclared (first use in this function)
>   174 |     SSL_CTX_set_ciphersuites(c, tls13_ciphersuites);
>       |                                 ^~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/25db1e999950bbee069ba7364a228184a6a77808
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-openssl.c-fix-build-with-wolfssl.patch | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch
> 
> diff --git a/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch b/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch
> new file mode 100644
> index 0000000000..deb1a0f93b
> --- /dev/null
> +++ b/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch
> @@ -0,0 +1,47 @@
> +From e5c5ed1c64cfc715729c9bfbfdcc4be225f344ff Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 4 Aug 2021 11:32:39 +0200
> +Subject: [PATCH] openssl.c: fix build with wolfssl
> +
> +Fix the following build failure with wolfssl:
> +
> +/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c: In function 'ssl_context_new':
> +/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c:174:33: error: 'tls13_ciphersuites' undeclared (first use in this function)
> +  174 |     SSL_CTX_set_ciphersuites(c, tls13_ciphersuites);
> +      |                                 ^~~~~~~~~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/d0fb629b40b05ad828775894fabed878692bb222
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/zhaojh329/ssl/pull/1]

I was wondering why this was a PR on the 'ssl' repository, when you aply
it to the libuhttpd package. But it turns out that both are maintained
by the same person, and 'ssl' is a git submodule for libuhttpd.

I've added a note in the commit log about that, and applied to master,
thanks.

Regards,
Yann E. MORIN.

> +---
> + openssl.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/openssl.c b/openssl.c
> +index 8f3d8b7..c42638c 100644
> +--- a/src/ssl/openssl.c
> ++++ b/src/ssl/openssl.c
> +@@ -71,14 +71,14 @@
> +                 "TLS13-AES256-GCM-SHA384:"		\
> +                 ecdhe_aead_ciphers
> + #else
> +-# define tls13_ciphersuites	"TLS_CHACHA20_POLY1305_SHA256:"		\
> +-                "TLS_AES_128_GCM_SHA256:"		\
> +-                "TLS_AES_256_GCM_SHA384"
> +-
> + # define top_ciphers							\
> +                 ecdhe_aead_ciphers
> + #endif
> + 
> ++# define tls13_ciphersuites	"TLS_CHACHA20_POLY1305_SHA256:"		\
> ++                "TLS_AES_128_GCM_SHA256:"		\
> ++                "TLS_AES_256_GCM_SHA384"
> ++
> + #define ecdhe_aead_ciphers						\
> +                 "ECDHE-ECDSA-CHACHA20-POLY1305:"	\
> +                 "ECDHE-ECDSA-AES128-GCM-SHA256:"	\
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
