Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0EAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 19:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6158E60E39;
	Sun,  1 May 2022 19:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvsRoSUQGBHg; Sun,  1 May 2022 19:58:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52EC160E1E;
	Sun,  1 May 2022 19:58:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C960B1BF3FB
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5B1540896
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0vZJnvSaa7m for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 19:58:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98F36404B6
 for <buildroot@buildroot.org>; Sun,  1 May 2022 19:58:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9448:1aca:a169:bea6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5E53F780368;
 Sun,  1 May 2022 21:58:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651435114;
 bh=C9bCJQm/ctGxDgqS92lCm9f3c3wLm0M9cXIIVk7fRas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WtP8QTv0KU+dwHotGqmNZmrV8CbTPCqFwq+IuAhyJMSQ1w4CQY4LZrDSSyLY7/ecL
 oOs9jmyk+cGui4V16TY8fvhrbaqjhc9OweaBJ9zPFE9h9A0Vdy1fxC/WJuw+BnHxWD
 PRhFgM/p49TzGdtwTzoT2EFCrSAXyTol42n9KokShlctZ1xon/ZLvcDL5bNUfgCyoJ
 I2G0uIYRcGelUfq2wDdrKOY7DBk2Kw0FF/ezzCYTwbx+s/aqqP+UOzIkpccIjFBfwR
 U46HK00W5YBxceZNpXCm1QipEv2u+4VCZaCG6hbvyuiD61XCMWDD9asTmgJQ4hm4iz
 DVDDQNEQXpf2A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 May 2022 21:58:31 +0200
Date: Sun, 1 May 2022 21:58:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220501195831.GR3624965@scaer>
References: <20220501080102.3125294-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220501080102.3125294-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: fix symbol
 redeclared error
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-05-01 02:01 -0600, James Hilliard spake thusly:
> Backport a patch removing invalid OPENSSL_NO_PSK guard.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/1f2/1f2f203ee5130fdfce005281e71bf371699701f3
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...id-OPENSSL_NO_PSK-defined-guard-7146.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch
> 
> diff --git a/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch b/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch
> new file mode 100644
> index 0000000000..5d953b8931
> --- /dev/null
> +++ b/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch
> @@ -0,0 +1,56 @@
> +From 891a06101d7b48c61d0d3174f79e9962b995770e Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Fri, 29 Apr 2022 16:06:10 -0600
> +Subject: [PATCH] Remove invalid OPENSSL_NO_PSK defined guard (#7146)
> +
> +These symbols are not conditional on OPENSSL_NO_PSK in ssl.h
> +
> +SSL_CTX_set_psk_find_session_callback:
> +https://github.com/openssl/openssl/blob/openssl-3.0.2/include/openssl/ssl.h.in#L847
> +
> +SSL_CTX_set_psk_use_session_callback:
> +https://github.com/openssl/openssl/blob/openssl-3.0.2/include/openssl/ssl.h.in#L850-L851
> +
> +As such we can not guard the fallback with defined(OPENSSL_NO_PSK)
> +as this will result in redeclaration errors.
> +
> +Fixes:
> +build/temp.linux-sparc64-3.10/_openssl.c:2286:8: error: 'SSL_CTX_set_psk_find_session_callback' redeclared as different kind of symbol
> + 2286 | void (*SSL_CTX_set_psk_find_session_callback)(SSL_CTX *,
> +      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +In file included from build/temp.linux-sparc64-3.10/_openssl.c:832:
> +/home/giuliobenetti/autobuild/run/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:855:6: note: previous declaration of 'SSL_CTX_set_psk_find_session_callback' was here
> +  855 | void SSL_CTX_set_psk_find_session_callback(SSL_CTX *ctx,
> +      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +build/temp.linux-sparc64-3.10/_openssl.c:2293:8: error: 'SSL_CTX_set_psk_use_session_callback' redeclared as different kind of symbol
> + 2293 | void (*SSL_CTX_set_psk_use_session_callback)(SSL_CTX *,
> +      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +In file included from build/temp.linux-sparc64-3.10/_openssl.c:832:
> +/home/giuliobenetti/autobuild/run/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:858:6: note: previous declaration of 'SSL_CTX_set_psk_use_session_callback' was here
> +  858 | void SSL_CTX_set_psk_use_session_callback(SSL_CTX *ctx,
> +      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[james.hilliard1@gmail.com: backport from upstream commit
> +891a06101d7b48c61d0d3174f79e9962b995770e]
> +---
> + src/_cffi_src/openssl/ssl.py | 3 +--
> + 2 files changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/_cffi_src/openssl/ssl.py b/src/_cffi_src/openssl/ssl.py
> +index 1314b85b0..d036e4f2d 100644
> +--- a/src/_cffi_src/openssl/ssl.py
> ++++ b/src/_cffi_src/openssl/ssl.py
> +@@ -785,8 +785,7 @@ void (*SSL_CTX_set_cookie_verify_cb)(SSL_CTX *,
> + static const long Cryptography_HAS_SSL_COOKIE = 1;
> + #endif
> + #if CRYPTOGRAPHY_OPENSSL_LESS_THAN_111 || \
> +-    CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_IS_BORINGSSL || \
> +-    defined(OPENSSL_NO_PSK)
> ++    CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_IS_BORINGSSL
> + static const long Cryptography_HAS_PSK_TLSv1_3 = 0;
> + void (*SSL_CTX_set_psk_find_session_callback)(SSL_CTX *,
> +                                            int (*)(
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
