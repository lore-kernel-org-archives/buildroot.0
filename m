Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328E1C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3AF3820C7;
	Wed,  5 Feb 2025 15:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8_sT2WVuKYe; Wed,  5 Feb 2025 15:20:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAD0F820DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAD0F820DC;
	Wed,  5 Feb 2025 15:20:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA08312A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD94760678
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0QE8EKr_GJPs for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:20:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9379F605A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9379F605A1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9379F605A1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:20:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4FF9443FC;
 Wed,  5 Feb 2025 15:20:35 +0000 (UTC)
Date: Wed, 5 Feb 2025 16:20:34 +0100
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250205162034.3be981f5@windsurf>
In-Reply-To: <20241207203438.597639-1-geomatsi@gmail.com>
References: <20241207203438.597639-1-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehgvghomhgrthhsihesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738768835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWY/p8vsnzVAD7zRm3arao1TlmVtsmAZuZvaKtVZlpU=;
 b=XCsROhc2QDFbMZGo41UjwH3BqJRBvEfFGivm02xEV+npsYv34XTCE8fMcl/XgYlbOm762C
 jvFrdhkud0hsORegcEtj6DmcFdFjeUzW9a15DDy2FZaEnG03DBIg3bNzkEXDfTU7QfuZgx
 dqlb8BfNPuxGPZ7XXz0EUAHluYQuEgsE2fJn86QrW0Zp5o3D0nBkpMql+cOz/60oiLSbZL
 7hkLcOyGyE4NA4eX54JWQWf9ebYSnFY5GsH4YnSXSpsSLPEJYj3HcpTgk1HRlsJrY8Sta2
 vFYY6PrTMZeOi/lyTnJnWxEFhn/WFkf9rM/aMLnueoxhbg1fAaOieoaln/koeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XCsROhc2
Subject: Re: [Buildroot] [PATCH v2] package/elfutils: enable zstd support
 for host package
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

On Sat,  7 Dec 2024 23:28:52 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Buildroot fails to build Linux kernel configurations where BTF support
> is enabled together with zstd compression of debugging information.
> The reason is in host-elfutils zstd support being explicitly disabled.
> So enable zstd support in host-elfutils by default to fix such builds.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---

Applied to master, thanks. I'm not a big fan of unconditionally adding
zstd support, as it adds build time, but we don't really have a simple
good way to make it optional, and other compression algos are already
unconditionally enabled.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
