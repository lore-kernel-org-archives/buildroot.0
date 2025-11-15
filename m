Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D397CEBF86
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 21:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D75860A7E;
	Sat, 15 Nov 2025 21:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMTWFZO3bDQA; Sat, 15 Nov 2025 21:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE1CD60A74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE1CD60A74;
	Sat, 15 Nov 2025 21:15:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E42ED5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 21:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D05E40E5C
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 21:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzDbp3QQhpc0 for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 21:15:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8ADC6402DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ADC6402DF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8ADC6402DF
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 21:15:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 795A413F879;
 Sat, 15 Nov 2025 22:15:23 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Nov 2025 22:15:23 +0100
MIME-Version: 1.0
Date: Sat, 15 Nov 2025 22:15:23 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251115175053.398944-1-dario.binacchi@amarulasolutions.com>
References: <20251115175053.398944-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <23dd080bbd4d8f128f76952c4c9d9dae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763241324;
 bh=CJg9cmY4yZ1sMS0euaGNExreNHvyRgzVcHaT9s6bJuM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bmLoRJFXmb2PghcvK0/X3XojMZqbZNkJfptV2mr08+wyC1MleUr8e16Rb5d6A/2LE
 jYGnG3n7u5e6xtYDAVtm7iW1NNt5sCDmP6WFgtOO71ziPEVlxyaqnudtc3GTH3/gWD
 rn60D1pR13h4a7sK+8Vz4l+ugLD9X0s//k2YJ9lO32kg4hLiCce1kmL2xM59BWnTQj
 qDftP8G3ykJkJbcJ7YJIPnkdJ2hC+dP7KqlszR8RVlRT2/vzuT1FOwZXq4odj35w26
 ympgxs/GaVrEBRjFZ4DSpIpEl5wa4t9jeI9R/7b6kv0nnOy/e12ctKtrDJTbL+j9yb
 uxPEjDB6vwMhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bmLoRJFX
Subject: Re: [Buildroot] [PATCH 1/1] package/netcat-openbsd: bump to version
 1.234
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On 15/11/2025 18:50, Dario Binacchi wrote:
> The hash file for license (netcat.c) has changed due to copyright year
> updates and changes not related to the license topic.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I applied this patch to master. I fixed the netcat.c license hash.
The hash you provided is the one from the original source archive,
before applying patches. Buildroot checks license hashes after
applying the patches (and the debian patches are modifying this
netcat.c).

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
