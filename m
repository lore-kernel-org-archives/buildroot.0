Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF34C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 09:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F68760E57;
	Sat,  4 Jun 2022 09:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5HFB8cMUqhu1; Sat,  4 Jun 2022 09:31:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E1E860E72;
	Sat,  4 Jun 2022 09:31:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 535E21BF27A
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 09:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42462405B3
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 09:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7byaPZACfuy for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 09:31:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29C2940158
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 09:31:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1D5E75FFB1;
 Sat,  4 Jun 2022 11:31:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654335098;
 bh=uhp3QJlx3n4nxclspEA6gYi3x18leNV2shOQWk5UNGI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YNOELVbZJ1lNWXCUc3PMRnZesxtHAyD/8YD3XDOZwNNTPKxShuU+8ZgpjuV2+Gj24
 S9cIssXmq4xyKeIib6rJDBTwJgWxPmsONxUAX3TWi9kc8W8ppYrvQdYpjTjmmpX25e
 G4b8ZMSQQQotvOjHu2PoE+tp3IU/XT9sfS0hfJmiznfLb5VPrTDxcMe/IKC1PJrb1G
 oePYlQcbLePPxxIx1F1AZtI2RS4uFdSOYsWM1+ANUdm96juR1DKLha6w5S4d/gq90w
 VN/5nZ6MHEMld6mtXjWfJDqaGpu69SPfDhSS55Xt3v3CQJAc9PpjTsywVAhXZYpK49
 odObaa51eXynw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 11:31:33 +0200
Date: Sat, 4 Jun 2022 11:31:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <foss+buildroot@0leil.net>
Message-ID: <20220604093133.GF427639@scaer>
References: <20220511110619.1610327-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511110619.1610327-1-foss+buildroot@0leil.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] manual: add _TARGET_FINALIZE_HOOKS in
 the list of hooks
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

On 2022-05-11 13:06 +0200, Quentin Schulz spake thusly:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> While reading the docs to find hooks, I completely missed the
> LIBFOO_TARGET_FINALIZE_HOOKS one which was actually matching my
> use-case.
> 
> Though it is documented in a subsection a few lines below, let's also
> have it in the list of supported hooks so it's not hidden away.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-hooks.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
> index 0ce79f8907..741b71ca29 100644
> --- a/docs/manual/adding-packages-hooks.txt
> +++ b/docs/manual/adding-packages-hooks.txt
> @@ -46,6 +46,8 @@ The following hook points are available:
>  * +LIBFOO_PRE_LEGAL_INFO_HOOKS+
>  * +LIBFOO_POST_LEGAL_INFO_HOOKS+
>  
> +* +LIBFOO_TARGET_FINALIZE_HOOKS+
> +
>  These variables are 'lists' of variable names containing actions to be
>  performed at this hook point. This allows several hooks to be
>  registered at a given hook point. Here is an example:
> -- 
> 2.35.3
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
