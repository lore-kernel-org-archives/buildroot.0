Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D19DC001E0
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 09:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08CC1401D1;
	Sat, 29 Jul 2023 09:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08CC1401D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vK38WJvUEjIV; Sat, 29 Jul 2023 09:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C540C415BA;
	Sat, 29 Jul 2023 09:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C540C415BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 412BE1BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B5E740106
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B5E740106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OBdbkKymYlU1 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 09:03:24 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E99D8400C7
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 09:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E99D8400C7
Received: by mail.gandi.net (Postfix) with ESMTPSA id C082C1C0007;
 Sat, 29 Jul 2023 09:03:20 +0000 (UTC)
Date: Sat, 29 Jul 2023 11:03:19 +0200
To: Gary Bisson <bisson.gary@gmail.com>
Message-ID: <20230729110319.173de4a0@windsurf>
In-Reply-To: <20230515142556.3718991-1-bisson.gary@gmail.com>
References: <20230515142556.3718991-1-bisson.gary@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690621401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hI7eyAaSknZN95b0JIE/gbuV+ZwljIiSHEqHuIOOgAM=;
 b=dTLMcniFTlSfdUYzKH7n+kO8ZLvDUGV0+8sGCFvELkUETmhOhsdK8rhycn4OOZz379low3
 NpUO7ZmlNfgJPnZrwP2BMVAhIF7Q0ScJrO4AgFHxob0XnnSMSmEebu4qpfmDIOQgVQSFkb
 dIC53q1aEFR9ECfZWr4vK3L9y0sCdlt600DBMmRziY7hyTpgq2jOSsGATRtMWdZo2VY07J
 pCFGC9rGv4NAsUYBQTcKjCyIwGUBjHxZQ7uCMjZWTX7k+otU07Ls3BjIueHiCTVz6khjSa
 ZUugliHp+9MDQTTGoQvhUIZlUDfHqPF6tL3AoaSU+rZKMOda2zVFLZrHAbYZnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dTLMcniF
Subject: Re: [Buildroot] [PATCH] package/sshpass: bump to version 1.10
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

On Mon, 15 May 2023 16:25:56 +0200
Gary Bisson <bisson.gary@gmail.com> wrote:

> Changelog 1.09 -> 1.10:
> ef1034d Tag version 1.10
> c596390 Controlling TTY code fix.
> 32b7553 Help message problems
> c89cee9 Convert repository from SVN to git
> 934f87f Sig unsafe functions in signal handler
> ed856e6 Better "-e" handling.
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> ---
>  package/sshpass/sshpass.hash | 2 +-
>  package/sshpass/sshpass.mk   | 2 +-
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
