Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297F1C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 08:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C58BF607EC;
	Mon, 19 Aug 2024 08:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zei61fc-japU; Mon, 19 Aug 2024 08:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D484607E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D484607E7;
	Mon, 19 Aug 2024 08:31:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF56E1BF3EF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAB8540395
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 08:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKH3KhCKFZPx for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 08:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 952A540132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 952A540132
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 952A540132
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 08:31:17 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4325D3536302; Mon, 19 Aug 2024 10:31:15 +0200 (CEST)
Date: Mon, 19 Aug 2024 10:31:15 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsMC07n1jPXRg3Bt@waldemar-brodkorb.de>
References: <20240818214305.1051667-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818214305.1051667-1-thomas.petazzoni@bootlin.com>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724056275; bh=NDfLrHxsSzoZeKd1CS8jscbcuXxfGAYG6iE90LbOg1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rn3EIf9Z1g00iCBwY/OnvZlUq2PqSquG+MLu/wyseyBhVYnUDPplzOHmE+fOO6cYH
 yk9o7OH9uLlXjx5Lk9HjOR2amSRl+zeGZw+UpMhh428K1oYLG80drk/RALQsqvqA52
 pK2SQjsYnauY4QIgHKui/LJakIHz50ynhSMIzwIQ4VKsfBlSiTj4FrdMG7JmRR7s6z
 IgJLDq35u4nzF5qljj6iNJoxK1O+l7nDUPlwTYXcDqnssEv2qrJ8T4EiivW0IZ0nkb
 AxZ8Po5muc46VcpotxHqI74a5jqrNSmG/Pp8O3dbFaHzjiDmcPusEdD2Ca+9jYDQXD
 UHJUH2+5qGqpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=Rn3EIf9Z
Subject: Re: [Buildroot] [PATCH next 0/2] Update to Bootlin toolchains
 2024.05
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thomas Petazzoni via buildroot wrote,

> Hello,
> 
> This short series updates toolchain-external-bootlin to the 2024.05
> toolchains.
> 
> NOTE: this series depends on
> https://patchwork.ozlabs.org/project/buildroot/patch/20240810215624.482529-2-thomas.petazzoni@bootlin.com/,
> which introduces the BR2_ARCH_NEEDS_GCC_AT_LEAST_15 symbol also used
> in this series.

Congrats to the new release.

Dear maintainers, what do you think about adding it to master
instead of next? From uclibc-ng point of view the new toolchains are
really a nice improvement.

Just my 2 cent.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
