Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CE8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 07:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CE83840F5;
	Wed, 25 May 2022 07:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mfzsMT6VVoe6; Wed, 25 May 2022 07:07:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DEEE83F1C;
	Wed, 25 May 2022 07:07:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9379E1BF418
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 07:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 817AF83F1C
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 07:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGncFDsachoy for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 07:07:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F23683EF7
 for <buildroot@buildroot.org>; Wed, 25 May 2022 07:07:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6823:fe26:3f6d:8e17])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B8C245FFAE;
 Wed, 25 May 2022 09:07:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653462461;
 bh=dUJJa8vkrV3kakvPpQsva5tplfjk0EaOk3VTpMNtR+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KzkZIwLb5d/kFu9byLuX2gMc9et13/atwKFYo9/aOeMc5MFqM+BbgxxU+nc1kCwBK
 VJEgnlCwC+BKzhjqXB9BURRW3JUM99A/6PkofP+DqC8w9tnABy0vXu/HRL+ATFyZ5Z
 excVd5N8C4j+sNAsAFY/np49X8g4HXpuYZ33B93afrn/ejn+cvhhPRvnnfn3NNbzLe
 aVNwCuzGQKU+pJZBwqsQknl372CSlI9e/ALUqBqAykV5ZKOPQRnj20yidB8NBtt/m5
 mUk2tNLOh4Sq/RsITlP5Bpsi8p1atvUoeLJfqiLPvT/JyQl8kqqaVARYyxtP3GnSA9
 hnE2antQiG8OA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 25 May 2022 09:07:37 +0200
Date: Wed, 25 May 2022 09:07:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Message-ID: <20220525070737.GB301044@scaer>
References: <20220524170541.93208-1-jarkko.sakkinen@iki.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220524170541.93208-1-jarkko.sakkinen@iki.fi>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: openssl dependency
 for x86_64 selftests
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jarkko, All,

On 2022-05-24 20:05 +0300, Jarkko Sakkinen spake thusly:
> On x86_64, libssl is a dependency for kselftests. selftests/sgx depends on
> it.  Thus, select it in "Config.in", and add it as a build dependency in
> "linux-tool-selftests.mk.in".
> 
> Link: https://lore.kernel.org/buildroot/20220517224809.21f77949@gmx.net/
> Suggested-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
> ---
> v2:
> Config.in: BR2_PACKAGE_LIBOPENSSL => BR2_PACKAGE_OPENSSL
> ---
>  package/linux-tools/Config.in                  | 1 +
>  package/linux-tools/linux-tool-selftests.mk.in | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 791f2c085c..6217fcfb7a 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -98,6 +98,7 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
>  	select BR2_PACKAGE_LIBCAP_NG
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS # runtime (taskset)
> +	select BR2_PACKAGE_OPENSSL if BR2_x86_64
>  	help
>  	  Build and install (to /usr/lib/kselftests) kernel selftests.
>  
> diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
> index b824c11bd6..06158e6147 100644
> --- a/package/linux-tools/linux-tool-selftests.mk.in
> +++ b/package/linux-tools/linux-tool-selftests.mk.in
> @@ -17,6 +17,9 @@ endif
>  endif
>  
>  SELFTESTS_DEPENDENCIES = libcap-ng popt
> +ifeq ($(NORMALIZED_ARCH),x86_64)
> +SELFTESTS_DEPENDENCIES += openssl
> +endif

I've changed ths codition to be in the package being actually enabled,
so that the real confdition to require openssl is only handled in
Config.in (or we'd have to sync the two everytime a new arch needs
openssl...)

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  SELFTESTS_MAKE_FLAGS = \
>  	$(LINUX_MAKE_FLAGS) \
> -- 
> 2.36.1
> 

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
