Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB8CC5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 16:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBF1840A07;
	Wed, 28 May 2025 16:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPeRRHUs0S1V; Wed, 28 May 2025 16:40:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE11D4035A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE11D4035A;
	Wed, 28 May 2025 16:40:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9A17DCA
 for <buildroot@buildroot.org>; Wed, 28 May 2025 16:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF38C40142
 for <buildroot@buildroot.org>; Wed, 28 May 2025 16:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8j7YcHEzqNc for <buildroot@buildroot.org>;
 Wed, 28 May 2025 16:40:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6287F40BF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6287F40BF7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6287F40BF7
 for <buildroot@buildroot.org>; Wed, 28 May 2025 16:40:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F10F143B63;
 Wed, 28 May 2025 16:40:48 +0000 (UTC)
Date: Wed, 28 May 2025 18:40:47 +0200
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
Message-ID: <20250528184047.3564a9db@windsurf>
In-Reply-To: <20250528-fix_license_toolchain-v1-1-34295630709b@bootlin.com>
References: <20250528-fix_license_toolchain-v1-0-34295630709b@bootlin.com>
 <20250528-fix_license_toolchain-v1-1-34295630709b@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeejjeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdtudemfedtieelmeeiudelgeemiedtfheimeguuggufhemvgdtfedumegvkedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtudemfedtieelmeeiudelgeemiedtfheimeguuggufhemvgdtfedumegvkedtpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtr
 dhorhhgpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748450449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAG4fEVzutjzGuZoB2Zn2qJ7GaXuoR7I7aqkp/v2y3A=;
 b=A5f1tLkcFmXPZEh4o0yNHRX9eFVEgv/p0FyxkcSKb78HFYN6KeE7CN1JmPoOnNblPD83JS
 agdQv5SRNCUkqDPLl75rHjVwtiCGbfdHAS8I1p34tdf/hJ2h7071eUMLS3oU7op4ILtDSP
 yDehPFa9uaaqeOke/PI2Sr27n6FtHY3CVvSi3S4vxnED38gxMUsMf3sJXU2WG/2BL/hRjN
 evSpLrH0Tmi9zfgGKTNyTPvFUfdZi8faN6tvOCTdjVzhO/LkPdSHYM6uGQd9YErM9XwtZL
 8iCzIqWXIgbcUmba8xAjXSaSpnV6Eih2P8gJYDHDtmfPoIZC9KPGXPdYqlBN+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A5f1tLkc
Subject: Re: [Buildroot] [PATCH 1/5] toolchain-external: Fix license file
 management after toolchain move
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

On Wed, 28 May 2025 16:57:58 +0200
Kory Maincent <kory.maincent@bootlin.com> wrote:

> The toolchain move to TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR was
> preventing license file management from working properly. Copy license
> files back to the original toolchain directory to resolve this issue.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index c08bf0a653..13d196a1c9 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -106,6 +106,11 @@ define TOOLCHAIN_EXTERNAL_MOVE
>  	rm -rf $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
>  	mkdir -p $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
>  	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)/
> +	# Copy back the license files needed for legal-info generation
> +	$(foreach f, $($(PKG)_LICENSE_FILES), \
> +		[[ -d $$(dirname $(@D)/$(f)) ]] || mkdir -p $$(dirname $(@D)/$(f))
> +		cp $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)/$(f) $(@D)/$(f)
> +	)

I am wondering if this is the right solution. The fact that we move
everything from $(@D) to $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR) is
kind of weird. For all packages we don't "move" things from $(@D) to
the installation location, we rather copy stuff.

Should we do the same here? Maybe with hard links so that we don't pay
the full price of the copy?

	rsync -a --hard-link --link-dest=$(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR) $(@D)

or something like this? Of course, then we should change the name of
the macro :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
