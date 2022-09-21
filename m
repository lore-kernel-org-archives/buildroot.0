Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AE7C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B93D082F84;
	Wed, 21 Sep 2022 20:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B93D082F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xKvptArkQEvc; Wed, 21 Sep 2022 20:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9A6A82C7C;
	Wed, 21 Sep 2022 20:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A6A82C7C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A93051BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 921E561067
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 921E561067
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYH3uhkBzpVZ for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:17:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 341ED61064
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 341ED61064
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:17:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3336B240002;
 Wed, 21 Sep 2022 20:17:32 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:17:32 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20220921221732.086df4f0@windsurf>
In-Reply-To: <20220919062700.1095847-1-fido_max@inbox.ru>
References: <20220919062700.1095847-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663791453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OlQXExWzBNyeiWjuCkcnwmFymS7+9p56+WnokQivMlM=;
 b=B9KZopc7ym0Du2zXSxZvJMlhAu37jnyENgAvFafSv32kqzzHLvbfqg/rGVBljFCsxK7Gfm
 a5TQnFIr+e56ztPBtTrdBdsYqCK3VPDHl6lOaNCp4NuOzpL4zUIBsFpgo016Fkd/dSWQiP
 jYranC5PoUweWqbex+QU4VffbNEBHxp2Hmt4O8AjAqhdGaMxj1U3nsA4/tmNoiftXI7SVJ
 aHRiGAOR0AX//6DYHnNwTXKmPWsVURHXz/NmSV3t9NcUh6YTcTY/CfZg/Dk7khLU1ZoyLf
 c6/GEV7FVB51IgEUMW7dIzpn1G9f/XWrbzLnT5ugFol8ETodRiw6gux1HMG3zQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B9KZopc7
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to
 2.8.0
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

On Mon, 19 Sep 2022 09:27:00 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Release notes: https://github.com/timescale/timescaledb/releases/tag/2.8.0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/timescaledb/timescaledb.hash | 2 +-
>  package/timescaledb/timescaledb.mk   | 2 +-
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
