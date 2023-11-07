Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A776FC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F3BF60D6E;
	Tue,  7 Nov 2023 21:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F3BF60D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M7eKWU7B3sC7; Tue,  7 Nov 2023 21:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 967CC60D52;
	Tue,  7 Nov 2023 21:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 967CC60D52
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1B911BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9484403E7
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9484403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vLmAKb7lpwFX for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:39:32 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 889D240182
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 889D240182
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:251d:f18c:43f3:5a5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ACDDF13F899;
 Tue,  7 Nov 2023 22:39:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 22:39:25 +0100
Date: Tue, 7 Nov 2023 22:39:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231107213925.GL229059@scaer>
References: <20231105142405.71631-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231105142405.71631-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699393170;
 bh=DPg+n0M9HDacQQYyffm3AtQvbyudGKSMECjWj1+Cs1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DkzW3cgoRG87+E+Y4QPvVQ3U7meVuhxW6m9l6/D8SpMp5SAtpZXfUSrEi97ua0S+M
 j80WEW8qq2Vw39uyTUpBNgEg8RJ2HcQD68z++36qhY2aeicBR/YC25Onfzw/nCX5/t
 sCMsHYyiYbNiYeMhCYGAYbM7/zU6L4cPFP89KEdYm92hPYI32S63y9Kg0SwVtVOw4H
 8JfWZvFZQjZ2ne3toCf4udI9WEn43cc0hjaEe3C9jsmYrglUfMswauzYUBA7LFkrd+
 EmNwi827JHMRpRLvzZoA0CS5qgcd2Qc9YiiRmWk4kglkV6Qbf9/U6Z03rH0r0ZBdDH
 UYayjnZmyKSvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DkzW3cgo
Subject: Re: [Buildroot] [PATCH] package/nodejs/nodejs-src: fix arch check
 on additional modules
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-11-05 15:24 +0100, Giulio Benetti spake thusly:
> At the moment check-bin-arch script finds NodeJS modules containing
> prebuilt binaries for different architectures and build fails.
> So let check-bin-arch to ignore folder /usr/lib/node_modules by setting
> NODEJS_SRC_BIN_ARCH_EXCLUDE to it.

I have extended the commit log drastically, to explain the situation is
more details, and why we decided to just ignore the issue.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/nodejs/nodejs-src/nodejs-src.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
> index 6fb550f158..8f934202b0 100644
> --- a/package/nodejs/nodejs-src/nodejs-src.mk
> +++ b/package/nodejs/nodejs-src/nodejs-src.mk
> @@ -244,6 +244,9 @@ define NODEJS_SRC_INSTALL_MODULES
>  	# help in diagnosing the problem.
>  	$(NPM) install -g $(NODEJS_SRC_MODULES_LIST)
>  endef
> +
> +# Exclude prebuilt binaries with different architectures and OS from check
> +NODEJS_SRC_BIN_ARCH_EXCLUDE = /usr/lib/node_modules/
>  endif
>  
>  define NODEJS_SRC_INSTALL_STAGING_CMDS
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
