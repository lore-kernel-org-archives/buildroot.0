Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BDCC001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 112D360A64;
	Mon, 31 Jul 2023 14:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 112D360A64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pTSKXAieAfpr; Mon, 31 Jul 2023 14:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CCFD610BA;
	Mon, 31 Jul 2023 14:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CCFD610BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6F271BF31B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE42B81A92
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE42B81A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L6MccXKC1z1j for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:55:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BE7B81A29
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 14:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BE7B81A29
Received: by mail.gandi.net (Postfix) with ESMTPSA id 338D8C0005;
 Mon, 31 Jul 2023 14:55:33 +0000 (UTC)
Date: Mon, 31 Jul 2023 16:55:32 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20230731165532.7ab18b50@windsurf>
In-Reply-To: <20230731061201.26156-1-fido_max@inbox.ru>
References: <20230731061201.26156-1-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690815334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SW5VXSSyPpsBy+fVun8fP6CmqQdLs+VjJktGW3S0nnw=;
 b=O5Rsv6Bw6Sm+bOn5kiBiuFKrJ/RVyBiP3RsIMZ2twQxUCtyCZzbljCPxUaM5DUxJZ2kjev
 4Y+h3+M92XlwjOyAubPoPj9DwUmrgmWTFktBcAUqQNSWvXkEQLYPVxxeey7peO0UCgGoy1
 ksziQrdE7LMGV75u0tMRcojVjPXtIldfvu9BnDfIYzq3bsuvg0j3H691JNDAe1G0PoALmJ
 /QToMslaYWjWufjpxNj9J+5+7G3uoy0IcZXI5Cmh+rWUV2D7/e6fVtU7wth1UUMPgARoBJ
 bCVOEoYm/6Z4zUy0e6ccW9GgFO75rS1W9LpnfFtzPQII7fMFT9UrPn7bbycmZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O5Rsv6Bw
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.12.0
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

On Mon, 31 Jul 2023 09:12:01 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Changelog: https://github.com/libgeos/geos/releases/tag/3.12.0
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/libgeos/libgeos.hash | 2 +-
>  package/libgeos/libgeos.mk   | 2 +-
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
