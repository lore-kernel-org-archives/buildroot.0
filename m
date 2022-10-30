Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EAFC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5869F80C38;
	Sun, 30 Oct 2022 20:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5869F80C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9x7x86-Ji2uo; Sun, 30 Oct 2022 20:29:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8690C80C02;
	Sun, 30 Oct 2022 20:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8690C80C02
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 468491BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1492C400EC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1492C400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlOX6p2hqKll for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:29:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FAC0400DC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FAC0400DC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:29:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CF424E0002;
 Sun, 30 Oct 2022 20:29:21 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:29:20 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030212920.3dd30baa@windsurf>
In-Reply-To: <20221015005813.4055238-1-james.hilliard1@gmail.com>
References: <20221015005813.4055238-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667161762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdqZBjeVt2o6BDz2V2jkzguGxODWsHQ8ViwIMGgy6Ck=;
 b=Sd7cDjpQT/8zRJjEBVKfp2DXON5pSYU7YxjEnckemTwj59FW27JamfDVJL3LKbwcJezTxC
 E+Ep9gI288LDQfXA2zNnvFnaOqbg62moSrmi3tqXf4r6/nZsvgvpgWWK9hpzE0Wl8X126x
 5PGSoKFP57HeucrTfLLMCvdE6+vjCYfy8DbRljpMH4n5QJiSkVt3BU+zZbhuRl2c1PvZ22
 q68SyCJPk2oV82ZA1xlr8jXrRgu19ULOQqPx03B9aBXhAw2ZCDLSJ9FNK6jE8vBdDT9JCm
 rOXP7z2w3CL18akrYTa7tKIHSZtkOczTmT7HCHIwjCFyq7rrrZrE7+YPOOOS9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Sd7cDjpQ
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Fri, 14 Oct 2022 18:58:13 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The bearssl package is not compatible with parallel builds.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/5e1/5e1b72db206b2d17fa5ce378a70fdc2f3f5bf773
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/bearssl/bearssl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Based on the feedback which said that fixing bearssl was preferred over
using $(MAKE1), I have marked this patch as Changes Requested. Could
you see at fixing the bearssl build system, submit the fix upstream,
and provide the fix for Buildroot?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
