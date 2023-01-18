Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F46DC38147
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 21:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C54E409AE;
	Wed, 18 Jan 2023 21:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C54E409AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTn7ZGmN8kmq; Wed, 18 Jan 2023 21:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11AB1416E7;
	Wed, 18 Jan 2023 21:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11AB1416E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F6081BF308
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 21:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 644B94023D
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 21:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 644B94023D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PiCItY0V1fWs for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 21:08:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ED08400D2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6ED08400D2
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 21:08:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3B6F85FFA6;
 Wed, 18 Jan 2023 22:08:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 22:08:34 +0100
Date: Wed, 18 Jan 2023 22:08:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230118210834.GM2770@scaer>
References: <20230118173718.207535-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118173718.207535-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674076118;
 bh=fd79W7ql4QWONVVB81oLUnpAolx3JoyEElOrg7Ndgco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dWh1BdI7QdkJQtZJx7CBNao4qLMrSYKWx5py+C488PXfzG0chBPTcQFM4977/BExm
 auOJnT1QUl1wgco6iqS3vS+8xzQ72n1nQv3SL4HUS8F1rpWS6jopgoDOOTB51WhFoG
 IGkNrAiPlxRRC6uYBLfWNllP4NDjUJ5kHsYYTWCHILLTa4Z5cRi2Kf8I847v0nKvt2
 1si8POtsQ67RSQznie0+whFYh/j/eM1Uo/YDOWNB1wf+Ner08SSd05xc2RraWFvnYh
 nKCHrMv/KRz25rwcQWUyFROkmKvR6NQEmosBIGp57g0Prfu9Y4Fvq96eBE2mUBi5nP
 IXzxBIYeR2yzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dWh1BdI7
Subject: Re: [Buildroot] [PATCH 1/1] package/proftpd: disable sftp with
 libressl
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

Fabrice, All,

On 2023-01-18 18:37 +0100, Fabrice Fontaine spake thusly:
> sftp doesn't build with libressl >= 3.5.0 resulting in the following
> build failure since commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
> 
> mac.c: In function 'init_mac':
> mac.c:189:3: warning: implicit declaration of function 'HMAC_CTX_init'; did you mean 'HMAC_CTX_new'? [-Wimplicit-function-declaration]
>   189 |   HMAC_CTX_init(hmac_ctx);
>       |   ^~~~~~~~~~~~~
>       |   HMAC_CTX_new
> mac.c: In function 'set_mac_key':
> mac.c:435:14: error: storage size of 'ctx' isn't known
>   435 |   EVP_MD_CTX ctx;
>       |              ^~~
> 
> So disable sftp with libressl

This, and the commit title, are misleading: sftp is not _disabled_ with
libressl; if you had done that, then the code would have looked like:

    config BR2_PACKAGE_PROFTPD_MOD_SFTP
        bool "mod_sftp"
        depends on !BR2_PACKAGE_LIBRESSL

Realy, what this change does, is to force use of openssl for sftp.

So, I tweeaked the commit title and log to reflect that.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> as no feedback was received on
> https://github.com/proftpd/proftpd/pull/1481
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a16ccd7cc78eb63de06a6d738fccc6b947da13e7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/proftpd/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
> index 83094028a0..aed1958b8d 100644
> --- a/package/proftpd/Config.in
> +++ b/package/proftpd/Config.in
> @@ -29,7 +29,8 @@ config BR2_PACKAGE_PROFTPD_MOD_REDIS
>  config BR2_PACKAGE_PROFTPD_MOD_SFTP
>  	bool "mod_sftp support"
>  	select BR2_PACKAGE_OPENSSL
> -	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
>  	help
>  	  Compile ProFTPD with mod_sftp support
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
