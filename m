Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED925CAC597
	for <buildroot@archiver.kernel.org>; Thu, 18 Sep 2025 22:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 784FF80724;
	Thu, 18 Sep 2025 22:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJwWrycV5CN3; Thu, 18 Sep 2025 22:24:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5A418071D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5A418071D;
	Thu, 18 Sep 2025 22:24:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63EFC150
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 22:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55655806F6
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 22:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzZ02lMoL14S for <buildroot@buildroot.org>;
 Thu, 18 Sep 2025 22:24:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB3E480706
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB3E480706
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB3E480706
 for <buildroot@buildroot.org>; Thu, 18 Sep 2025 22:24:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 980B313F861;
 Fri, 19 Sep 2025 00:24:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 19 Sep 2025 00:24:16 +0200
MIME-Version: 1.0
Date: Fri, 19 Sep 2025 00:24:16 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Niklas Cassel <niklas.cassel@wdc.com>,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>, Mark Corbin
 <mark@dibsco.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Dmitry Chestnykh
 <dm.chestnykh@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Dick Olsson <hi@senzilla.io>, Romain Naour <romain.naour@gmail.com>,
 Alexander Egorenkov <egorenar@linux.ibm.com>, Joel Stanley <joel@jms.id.au>
In-Reply-To: <20250918174133.6713-1-fancp2007@gmail.com>
References: <20250918174133.6713-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4d16966fe657590471b7e5137bab9c55@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758234269;
 bh=9UWm/pt/Ealx/4peq3Fh1WkndbQsu9L4UuQiagWNh5g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MQqTIkiPY3E+6UuvlT1BWtqeZGI1QIpEAeCV9chGcGxeELma3iuQafuzaTNya1+mb
 yF+lOKRPnYi7De0ml+wYjNDrsXjqU3vgk2L9rbPpVbhYVQzz5466gzEMDyiYh3JXtf
 1RyMQp8+ZNbGirw+MV8r11F5jGGX3NyIiG09wivTx51AcJZ6hO1OVhlBZNaRNex7tx
 VRVG1N4U2TBPt4nDNJ4J3IKvJxrWLyH4rvImTF8zmkfRZ6epHkNM9HwwsAgnpIRged
 t2HV8hh1bl5a3s23kXGNMvemulcembwQ3RrH9uftxEfV5/3plneTU2qSa3/Ep69c61
 84rC97ZjpqKng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MQqTIkiP
Subject: Re: [Buildroot] [PATCH] configs/qemu: update defconfigs to Linux
 6.12.47
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

On 18/09/2025 19:41, Scott Fan wrote:
> Update all qemu defconfigs to the latest Kernel LTS version.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
