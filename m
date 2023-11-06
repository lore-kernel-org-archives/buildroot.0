Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DEAC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3092F61245;
	Mon,  6 Nov 2023 19:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3092F61245
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCAW4ZYjHb7B; Mon,  6 Nov 2023 19:30:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D34161240;
	Mon,  6 Nov 2023 19:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D34161240
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDE021BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A248B41598
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A248B41598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9S-0nLOXmCCV for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:30:33 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BEBE41596
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BEBE41596
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AE6B240006;
 Mon,  6 Nov 2023 19:30:31 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:30:31 +0100
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20231106203031.383ad134@windsurf>
In-Reply-To: <20231106162102.2874943-1-festevam@gmail.com>
References: <20231106162102.2874943-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQSCiVMKrzgE9X09DDdIuf7xmsEgzvw8hdx0eyXjb+Y=;
 b=KrQHAr4QqZtf13RnOWi6APkmD8cj4Izy0iEiMz6n6inSwSDJoqb/JmcL4CYABho50OgIon
 xeSyl+V1KeZ9cyLxGD3B/PAaCqNDexneuV0BXz5iJzXWs5LYC92J2PWUGrBTCCC+btCA7X
 MwVK7V/ZhmNJv7mF5G/7Zp6xzHZhXPY0Axwttw1f34UWsSS8lwnTzcH9KXYIGENSwPMuPa
 U31hvxpE0BmfGK3jA8rOO0J9mpWCCZWv4wBPg7CsZ+N/zY44SPmotEHnIVIUP4+IWZHd18
 z798HJFo5asDIh4GjBDE6I1vZmmyktEcqx8JFERtn8qmmQbPNB+bP1hc1ncE/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KrQHAr4Q
Subject: Re: [Buildroot] [PATCH] configs/warp7: bump Kernel and U-Boot
 version
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

On Mon,  6 Nov 2023 13:21:02 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Bump U-Boot to 2023.10 and kernel to version 6.6.
> 
> There was a change in the location of the devicetrees for arm32
> platforms, so adjust it accordingly.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/warp7_defconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

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
