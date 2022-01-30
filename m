Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A27DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2F9F402B2;
	Sun, 30 Jan 2022 14:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gI679nUWtQl; Sun, 30 Jan 2022 14:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CD6E40245;
	Sun, 30 Jan 2022 14:56:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7549E1BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6188C40332
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abHMw03xHkVS for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:56:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AAC14017C
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:56:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E616E40008;
 Sun, 30 Jan 2022 14:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643554560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHGueMY9Qcy1GWliH8Wl4E2ydn/LLrD7V7PGr+rF8a4=;
 b=jGxDM87owQOocobzy9Uxwu9eBbMf6+rfoFkdUr2j70IPWUEVpfcIG6CfaVC52qCouKlQee
 seg05aJw5T1r0st+5u4kfFNY0o2u1s9B7wW88t+3Jzdc6Psgv6tQ6khYrMKQSzqB+dQ8+m
 539Eo0RO59e7LoOYvuqbbRpr6DlPvwzUAiN9JejP8OB2fPml6jxhFjppzGVnAggwuLZR65
 qkXKJjTSNfnbko7N8uO9uV0YxpnxrO3qiR9+HfiYZnRFyzUlWj1noUCFUstSYwAOusMVeA
 ebhyc69AUmnQQD6PQfWh9IauAzAFmNdlorcv67eX2DAIVhq1Z+Px8uFQunofZA==
Date: Sun, 30 Jan 2022 15:55:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220130155559.11d4fea3@windsurf>
In-Reply-To: <20220129094222.3583303-1-fontaine.fabrice@gmail.com>
References: <20220129094222.3583303-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo: fix debug build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Jan 2022 10:42:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> There is no --debug mode for cargo resulting in the following build
> failure in ripgrep since its conversion to cargo infrastructure in
> commit 342fd3e7350479dc368541ac77a5130ebb53194c:
> 
> error: Found argument '--debug' which wasn't expected, or isn't valid in this context
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/772ebdd6a39950457a59419bdc1376cb0e0a3611
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pkg-cargo.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

However, I'm wondering if we shouldn't instead use:

	--profile=release

and

	--profile=dev

See https://doc.rust-lang.org/cargo/reference/profiles.html

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
