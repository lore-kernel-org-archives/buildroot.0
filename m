Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063D7EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 22:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B549540B60;
	Mon, 21 Aug 2023 22:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B549540B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9h_N0kP87Tux; Mon, 21 Aug 2023 22:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAE1B40B59;
	Mon, 21 Aug 2023 22:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAE1B40B59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0DE81BF35B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 957A740918
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 22:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 957A740918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ky_poE9qp4TN for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 22:07:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A97F40908
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 22:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A97F40908
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEF971C0004;
 Mon, 21 Aug 2023 22:07:18 +0000 (UTC)
Date: Tue, 22 Aug 2023 00:07:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230822000718.70e35501@windsurf>
In-Reply-To: <20230816200310.1363595-1-bernd@kuhls.net>
References: <20230816200310.1363595-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692655639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aHZUWKnpTXkeihGByAkHp6Et9Vct5tXeBAM6cnznV7w=;
 b=gkSrO2CdaC1RK8F7JXxCaD7Dxxhu52k13b0ZweKy22TApiPCmrFacz8el7YtUeowv2qxy6
 KuC42jVDNyYCUJW5hoh5MJQk8ndgYGmZfxKXc+N7En7hDGaVteonHLOz5guWdZ9gP5zONz
 v5XYuz2pnKrRYFvnNQStTF5BN87UF10Elo0g0Zx+RZAkCsbDse/vo98eDNbxNeo3uwSxb6
 /S+5OdFNnU2Y8MadvlmN41xEWKRD+MW2LM6T9lQbSZfF/uF4gCsncUvZlMJCUsNVputjyf
 geB9CSpmYrGdONf/CQAiS40wT5SpKYzVEJCoKNQwbGMKVP7MHa9ovKNgi6Fuvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gkSrO2Cd
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 1.0.2
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

On Wed, 16 Aug 2023 22:03:10 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes: https://blog.clamav.net/2023/07/2023-08-16-releases.html
> 
> Fixes CVE-2023-20197 & CVE-2023-20212.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/clamav/clamav.hash | 2 +-
>  package/clamav/clamav.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
