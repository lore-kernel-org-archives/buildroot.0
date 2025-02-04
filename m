Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8920C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 16:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88064820AE;
	Tue,  4 Feb 2025 16:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adEKxU-bNHIs; Tue,  4 Feb 2025 16:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97D12820D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97D12820D6;
	Tue,  4 Feb 2025 16:37:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AFAE185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33738820AE
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lEG388tPm_0 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 16:37:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB79582135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB79582135
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB79582135
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:37:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 965994441C;
 Tue,  4 Feb 2025 16:37:39 +0000 (UTC)
Date: Tue, 4 Feb 2025 17:37:38 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
Message-ID: <20250204173738.09cdf1a7@windsurf>
In-Reply-To: <20250120183422.3342199-1-dario.binacchi@amarulasolutions.com>
References: <20250120183422.3342199-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepuggrrhhiohdrsghinhgrtggthhhisegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghmrghruhhlrgesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738687059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEx6rEVVP8bPrmt4JbcCsp9l5u2t4nXDmdjzEKq3DSY=;
 b=arADkFEQCqQge729CL3jQcK7WCAYMCqwrUB3m70Bs6d5JktW+8xuZEkUcI6ejG8V0tdJN1
 5yZxHthHSykhRmfSBPQYjP0SswF3uJ+J6FHp8QneHRpGLM64QteeYsrnjPTQ5BkZwHK2ro
 iKS49xX8uu7mnr9cBdvYGUjcBIxDaGJdMepmBb4w4UtvbzuzCSHCcH8g9nkY4jdCuw6ayG
 YGCB49x8lzAAGdf0wptAanMfDcmMvJ8XWRBLHpCDeEVkhLMlTtK1qNWGucHzDY6sthsJS+
 SpcAupQkwuXdFUZNgJwwGvds0K3d5AW+7TMJL5d6mRvztrEUIsS48LtgWr8WKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=arADkFEQ
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux
 to 5.15.176 and U-Boot to 2025.01
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Jan 2025 19:34:22 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps the Linux kernel to version 5.15.176 and U-Boot to
> version 2025.01.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  .../stm32f769-disco/patches/linux/linux.hash                  | 2 +-
>  .../stm32f769-disco/patches/uboot/uboot.hash                  | 2 +-
>  configs/stm32f769_disco_sd_defconfig                          | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

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
