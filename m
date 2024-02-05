Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D09C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 14:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0ACC41925;
	Mon,  5 Feb 2024 14:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0ACC41925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cs8SugOdRSBF; Mon,  5 Feb 2024 14:51:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46BE44187F;
	Mon,  5 Feb 2024 14:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46BE44187F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 038DC1BF2F0
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A67464187D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 14:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A67464187D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFq51Advlttw for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 14:51:49 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC0B04187F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 14:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC0B04187F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 023BAFF80A;
 Mon,  5 Feb 2024 14:51:46 +0000 (UTC)
Date: Mon, 5 Feb 2024 15:51:46 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205155146.128e4d41@windsurf>
In-Reply-To: <20240116220258.1003073-1-fontaine.fabrice@gmail.com>
References: <20240116220258.1003073-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707144707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sF0ScpZp/DJ/S0RM4+G7rdjSTp/m2Ld1LoHA/Aiq9cY=;
 b=dE9mzx0rAIxMik7tRjhnmerQ4yU8YheoF+X+Esmh+0ZYzBti+jDI0xwjAZK3KUxCsDs7+h
 n4+4UlllksAw5MeR+mNNr9ciqcW6ri4fGH8LO+PgtGBCcOz/jRCX8j4hMowxbnaij/53by
 vmcbkp5uK3oI19mFYgLp7uguoXev9Q30lsWf5GFqxeTglbwz0HEiDNT7tHDStzbYzcyCeA
 uGdVQaYoxS8+JgUzYMygTvNte+6kEbB47Yk/vDdIP1B8RBnXu6jvIUFzbKveXOcBEOCSTA
 Irk73LcAasvr8hKI+dzmvoYRkU2ws+yO/T3Gq7AV1QI9AfRYmCHzVkKt+n+w3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dE9mzx0r
Subject: Re: [Buildroot] [PATCH 1/1] package/domoticz: drop fmt dependency
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

On Tue, 16 Jan 2024 23:02:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> fmt is not a dependency since bump to version 2022.1 in commit
> adca60540f4fd271dda48b9a121986492700e73a and
> https://github.com/domoticz/domoticz/commit/82043c4d5c79003792379be79b931eb85ab890c8
> https://github.com/domoticz/domoticz/commit/9e02d9a79c70c36db180d3242cbd03ff9b63e3cc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/domoticz/Config.in   | 1 -
>  package/domoticz/domoticz.mk | 2 --
>  2 files changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
