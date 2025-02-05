Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3838C02196
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 09:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5915B60D9D;
	Wed,  5 Feb 2025 09:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJMNmcBpd0s6; Wed,  5 Feb 2025 09:35:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70DB360F94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70DB360F94;
	Wed,  5 Feb 2025 09:35:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32BF612A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2248D60D9D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJhIK8vMpye5 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 09:35:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C1DF60F4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C1DF60F4D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C1DF60F4D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:35:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34DB143317;
 Wed,  5 Feb 2025 09:35:10 +0000 (UTC)
Date: Wed, 5 Feb 2025 10:35:09 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, Bernd Kuhls <bernd@kuhls.net>, Romain
 Naour <romain.naour@gmail.com>
Message-ID: <20250205103509.41ca1f6c@windsurf>
In-Reply-To: <20250124101900.99783-1-fiona.klute@gmx.de>
References: <20250124101900.99783-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehfihhonhgrrdhklhhuthgvsehgmhigrdguvgdprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738748110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oiq/mvE+B6OVC7II1wIYP7Ho5bZ/0nbk+CuvxoQOjZI=;
 b=phHBH74fe6EmVSVbPtns8saXA3VrIPEZTolXkG6b9v4FreFk64mdeg/q3LfYIm/aN+wqVn
 eCrbeeOFOWwdgyvlUZqVKD0qe3IencGDqol6RucNAMQoWEcc8Cs1MzO3lHOeJJy420q87f
 gb5S6telf6CsyyFeelYgkY7EtlrNSA/j/HBvZAKQSgUzlIwxKr+/sziNphMLRjkP7i+Sl9
 Zw0Gsx9d0QGnmUqdXtEx+V/KJb6AWrMCh/+CZjO+OTPZqrYUpJWLmCSPRkBafa2KpwWXoX
 fSFsY74CmC4mUmKOWgDAKeYp/tLzFrQhpRZgOkJp7zP8ZpI0hrtwVgxE1SWuaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=phHBH74f
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: add option to build
 kmsro and zink Gallium drivers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 24 Jan 2025 11:19:00 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> This allows using simple displays not directly connected to the GPU,
> and platforms supported only via Vulkan.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  package/mesa3d/Config.in | 22 ++++++++++++++++++++++
>  package/mesa3d/mesa3d.mk |  2 ++
>  2 files changed, 24 insertions(+)

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
