Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C73C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 07:53:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 454B861B31
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 07:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 454B861B31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1579C848CA;
	Sun,  3 Oct 2021 07:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPuVeo33xd7W; Sun,  3 Oct 2021 07:53:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ABC684889;
	Sun,  3 Oct 2021 07:53:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 864871BF5A5
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 07:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8290D84889
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 07:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjYlW43qcx1X for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 07:53:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CA95847F5
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 07:53:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:acc5:ef3b:8cb0:272a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 383F2B0055A;
 Sun,  3 Oct 2021 09:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633247608;
 bh=wEC98tB0Cagc+3DR5RcfN63hlDAFnmczUpZ4wmCiYL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U/6gEf3fC/A1W8JiUfIN4p4r3J6rD5ACr3Ws2GwCoLJtzbOyzpmHNA21W+LJH9tvw
 qake/L4jnELiFwH2d7gOZ7CPGSzZ9ClmKsalJ5gljXdwUxBILMQBs+H16doFrVhL9I
 rv0RbpW4WWkl6XA8La081DVw3A+ifPEAthl4cB//9eCM2cUyo4UTewaW41Xgh97tId
 QYVuSPJh8RRTQMXw0bc+uS0MZOAE0kdilZWf4+A1UO4J/e36yfaFpbRxZ+ZtEjRkV+
 mvQoA44Wz/4RmvkUz+T7EG56AOcX95MVS/HmrtJZQmyBYKjY0WrxH/2hzawzxDOPFq
 Qz1yk+IFaHX+A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 09:53:19 +0200
Date: Sun, 3 Oct 2021 09:53:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20211003075319.GD1504958@scaer>
References: <20211001222952.670649-1-christian@paral.in>
 <20211001222952.670649-2-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001222952.670649-2-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/runc: fix typo of toolchain in
 config.in
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2021-10-01 15:29 -0700, Christian Stewart via buildroot spake thusly:
> BR2_TOOLCHAN_USES_UCLIBC -> BR2_TOOLCHAIN_USES_UCLIBC
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/runc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/runc/Config.in b/package/runc/Config.in
> index f181ee334f..66203896a8 100644
> --- a/package/runc/Config.in
> +++ b/package/runc/Config.in
> @@ -13,4 +13,4 @@ config BR2_PACKAGE_RUNC
>  comment "runc needs a glibc or musl toolchain w/ threads"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
>  		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAN_USES_UCLIBC
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
> -- 
> 2.33.0
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
