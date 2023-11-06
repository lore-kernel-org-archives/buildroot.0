Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DD1C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A2874175F;
	Mon,  6 Nov 2023 22:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A2874175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id swUgke2cpbHN; Mon,  6 Nov 2023 22:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B879417E5;
	Mon,  6 Nov 2023 22:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B879417E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B25791BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A66E82335
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A66E82335
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uv5I4n9OuWKu for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:07:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FDE882330
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FDE882330
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D68840004;
 Mon,  6 Nov 2023 22:07:37 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:07:37 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106230737.0b6544c7@windsurf>
In-Reply-To: <20231105030437.2772974-1-james.hilliard1@gmail.com>
References: <20231105030437.2772974-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699308457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTtrx6Wy4EwuyoNOxhdUiygUqzfFMQXMjOOvGgjUOsc=;
 b=fkRBCRWkpTC4+x8XD/NbQlAlb4eixSWoXhS+6jLjpYZh3SE4M1CL4w1qGF31npN/cbJZZI
 Y5D6Q3Z3G9ed8I2+skbZeeZAWMaYwkd/X5YvRAypLV/wP+ECVuAC5LftM07JlbwpTmhEDR
 WtiwLyRYeS/NmPTnDiafuqiryvyVg/jKxOlluU92K9gIj73h7lU9wX4+vM4eF5AF81y9c6
 CX7vOuycQy+vt1U2myoCtvsXm7aVipdMEupJ0a2FXzEcTyeThjexL4dMG1f7wBIRU6Stwa
 jloo2FXMlp/sRamimJdWMB6hfoKOmOHm3Kr7K47EHjZS86AF0JRYSSzsy+Nrzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fkRBCRWk
Subject: Re: [Buildroot] [PATCH 1/1] package/python-click: bump to version
 8.1.7
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 21:04:37 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-click/python-click.hash | 4 ++--
>  package/python-click/python-click.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
