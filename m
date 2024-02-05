Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3B4C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E378640B7C;
	Mon,  5 Feb 2024 21:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E378640B7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYFSU2IBNQMi; Mon,  5 Feb 2024 21:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB77540A8A;
	Mon,  5 Feb 2024 21:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB77540A8A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 169E91BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6F6C81E68
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6F6C81E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qlbtw9QmvIL for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:39:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C43CC81E65
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C43CC81E65
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19F83240004;
 Mon,  5 Feb 2024 21:39:07 +0000 (UTC)
Date: Mon, 5 Feb 2024 22:39:06 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240205223906.39e92f87@windsurf>
In-Reply-To: <20240127163807.233065-1-yann.morin.1998@free.fr>
References: <20240127163807.233065-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707169147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ep1ppx5Wos5p+9WwB18pEJaeQ4JPbcwYi1X/woMB734=;
 b=BXpc6pJFVVdWwIceKIw+J/yktF+7aG8o128V4rDsfgO9NUOQQfaVZFROeGzB0ppWrqvlgB
 HD8JIWVw/C5CXKz0sC9EzfC20MxkoRgN+bewoPkZc3GzXDh9rEgzG09Zl/+XE67OgcGoc1
 NrgN4ejOTP9VXTjhAF4EIFA94gDZRGmd+Azncu4zIr0C7LhUFWcVKOCS/UPNQBXPtSnycb
 s/0dwySj2ylW3fQRGg/ijccD34eohtXIvTIIcnhaSNLwkKtX/flw7/BDN4m7byNpn/aX9d
 tt2hXxBKfI9/wIvTIiGES/ug16VlYTjbz6YjZpzzDF4m9G8KD8gCPiCLMk+sZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BXpc6pJF
Subject: Re: [Buildroot] [PATCH] package/pkg-utils: add missing licensing
 data to show-info
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

On Sat, 27 Jan 2024 17:38:07 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> While the list of licenses is present in the show-info output, the list
> of license files and the redistributable status were missing. Add them.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/pkg-utils.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
