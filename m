Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0C4CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 016DC6172E;
	Thu, 27 Nov 2025 20:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugLS0A1wSvG2; Thu, 27 Nov 2025 20:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5036D60D97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5036D60D97;
	Thu, 27 Nov 2025 20:21:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 08E4D2A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBF1C404CD
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwF_82rvbI07 for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:21:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C4E24023A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C4E24023A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C4E24023A
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:21:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BEA7678035B;
 Thu, 27 Nov 2025 21:21:37 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 27 Nov 2025 21:21:37 +0100
MIME-Version: 1.0
Date: Thu, 27 Nov 2025 21:21:37 +0100
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>, Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <20250822-update_star64-v1-2-83fe87fbe8ea@bootlin.com>
References: <20250822-update_star64-v1-0-83fe87fbe8ea@bootlin.com>
 <20250822-update_star64-v1-2-83fe87fbe8ea@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ae22c8054cffc2195e92c4e82d9dc44f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764274902;
 bh=WT9DUbZuC7mBvGPEOP7HUxLKcobEYmYMMC2dyYS5iTM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ulJucQFeFkYhgVyiyGXy6czQvXzgpFtAKGpIBreOZstUJk/c42oaaRPZCf8quYgFE
 XXxI1yabwDsIOm3cFno+lBv8Ah9xQAxncuKiVdHr2SN5HI/3r29mfkn8E5UobBPiMl
 SSjGofGlpyFqepS2yO16nP3qMqatBPRni+6XsHHGaa7o+3Dws0/NVAXrG1NyKwmpcQ
 B5UIl0RZdy+orEY8rio7uqrBzKCrjlgywQN0bQAmYJvhq3m+VGVMQAMMjPy62YbYHw
 ROd60ogeongVRPTYnbao+xgPF1PSm/eiyjkwgaVF+guYajOzDRNa5ZknpwoF7qTe3m
 LV+otHf+sTFNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ulJucQFe
Subject: Re: [Buildroot] [PATCH 2/2] package/starfive-spltool: remove the
 starfive-spltool package
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

On 22/08/2025 10:11, Thomas Bonnefille via buildroot wrote:
> The starfive-spltool host package was added to Buildroot to create a
> bootable image for the Starfive JH7110 SoC.
> Mainline U-Boot can now build an image without it so it is not required
> anymore.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Applied to master, thanks.
For info, I also removed the DEVELOPERS entry.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
