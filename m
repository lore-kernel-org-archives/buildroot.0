Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D984FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 09:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84EDD4056A;
	Sat, 15 Jan 2022 09:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nz5qfDMpbhRr; Sat, 15 Jan 2022 09:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 709FC4010E;
	Sat, 15 Jan 2022 09:23:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F57F1BF34B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C3BD4010E
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 09:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59iAMt6w17TH for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 09:23:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 687BC40004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 09:23:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:edb9:18:17ad:29d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id CE1DC19F5A6;
 Sat, 15 Jan 2022 10:22:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642238579;
 bh=LFkE6AsvvDQVzWYhhwLNqad/ZkLZYOZcdrtNmUdUrEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pmSogIrueVBajSv8/+0w2ZfpNLxeP8wo4o1+KbZ93b9GLPnAhzmxxYQyhEuiakP43
 SAZOGDE1eGcNQNp3P9AxJ2MqjndGaxH4ECRXnfT1vE+Jyz+v/jtANlBjpxbY+S0Ht9
 zj/0xsfcYGRv5Wi1Jf8GgOr/qKbIPElClyhrbICn53/QegucEroY7LOL8FRegaILQA
 VqaxRHkm0V5SIEqaM2qE9gOy1pytm9XimWU7Fk7DFzeEEU7rKnSIoqdD6PFpfTVuhC
 ki16vChc+4/UzENXxCgseBbLPbQsLy/M3Qu7rvrLFwnaVx03mZucxVjaaCIQiOZiDu
 k74tMX9Qi5Z6A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 10:22:57 +0100
Date: Sat, 15 Jan 2022 10:22:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220115092257.GD1945846@scaer>
References: <20220114220954.1179812-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220114220954.1179812-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/open62541: add
 OPEN62541_CPE_ID_VENDOR
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

On 2022-01-14 23:09 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:open62541:open62541 is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopen62541%3Aopen62541
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/open62541/open62541.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
> index 66777ce501..fb28a614e2 100644
> --- a/package/open62541/open62541.mk
> +++ b/package/open62541/open62541.mk
> @@ -11,6 +11,7 @@ OPEN62541_GIT_SUBMODULES = YES
>  OPEN62541_INSTALL_STAGING = YES
>  OPEN62541_LICENSE = MPL-2.0
>  OPEN62541_LICENSE_FILES = LICENSE
> +OPEN62541_CPE_ID_VENDOR = open62541
>  
>  # Force Release build to remove -Werror.
>  # Don't use git describe to get the version number.
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
