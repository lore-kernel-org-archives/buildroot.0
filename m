Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50989C04A68
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DADF640116;
	Tue, 26 Jul 2022 19:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DADF640116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AaTbuSxRvn4c; Tue, 26 Jul 2022 19:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC13440137;
	Tue, 26 Jul 2022 19:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC13440137
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C50F1BF27A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23E22408B0
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23E22408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dKBeqAbwzCiK for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:57:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56F5D4088B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56F5D4088B
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:57:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 43A3A1BF207;
 Tue, 26 Jul 2022 19:57:36 +0000 (UTC)
Date: Tue, 26 Jul 2022 21:57:34 +0200
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220726215734.253e9455@windsurf>
In-Reply-To: <20220725152229.3370033-1-arnout@mind.be>
References: <20220725152229.3370033-1-arnout@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658865456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19+O5WJBuvkTdZiADFfeF9TiX7sl47wegUkOfIxzJXg=;
 b=e6VeGWrQzJQm5wbuL8NEO20xoZmx/75XIimzAwb++s9rwmpnva42A3s0iVgoMw2Po9jsb3
 jfiqQpb1/q3b22Ha22//XI6RqPUUlpGIYvvkQqwsGTnHpo7nYr5+OMjAe+kWDWopsltge3
 IZgwXNg4g9tkBQTJArhmtE5/pvPrlELErAO0ppnpbM3BC/OHeky+j7Yps0loWYTVSdheST
 i47QruJTeI4uBeVaj9DCtexhEhkC5fsTEbWQ4b/2RxtQ9Y6lN/yfAppvcnn4A9qNQ4RGAg
 60BwFFd/fMcLOeWTYD6o9I/GW8DCiRV0UdZv6X0LdYHF1aA840fMskjDtIqw5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e6VeGWrQ
Subject: Re: [Buildroot] [PATCH 1/5] Config.in: add new option
 BR2_ENABLE_LTO to globally enable LTO
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter =?UTF-8?B?S8O8bW1lbA==?= <syntheticpp@gmx.net>,
 Douglas RAILLARD <public.douglas.raillard@gmail.com>,
 Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 25 Jul 2022 17:22:25 +0200
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> Some packages have a configure option to enable LTO. Add a global option
> to enable/disable this in packages.
> 
> Note that we could instead (or in addition) pass -flto directly to the
> compiler in the toolchain wrapper, but that has a *much* bigger impact,
> so for the time being let's not do that.
> 
> No toolchain dependency is added for this, because all toolchains now
> support LTO.
> - LTO support was merged in GCC years before 4.6 (our minimal version)
>   was released.
> - Our oldest external toolchain, Sourcery ARM 2014.05, has LTO support.
> - For our internal toolchains, it is supposedly regulated by
>   BR2_GCC_ENABLE_LTO. However, that option only *enables* it - it
>   doesn't disable LTO support when it's not provided. Since LTO support
>   defaults to enabled for a long time already in GCC, in practice all
>   Buildroot-generated toolchains do support LTO.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Config.in | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
