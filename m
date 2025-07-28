Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C45C83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 20:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E52E40F13;
	Mon, 28 Jul 2025 20:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyomOvRGHi7H; Mon, 28 Jul 2025 20:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0AC140F19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0AC140F19;
	Mon, 28 Jul 2025 20:44:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEFC891D
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D11EB40F19
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bG33fnNTronV for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 20:44:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 937DF40F13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 937DF40F13
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 937DF40F13
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:44:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 456D2442F1;
 Mon, 28 Jul 2025 20:44:15 +0000 (UTC)
Date: Mon, 28 Jul 2025 22:44:14 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250728224414.6d0833d2@windsurf>
In-Reply-To: <20250728131926.848832-1-shirokovalexs@gmail.com>
References: <20250728131926.848832-1-shirokovalexs@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelfeduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejvdejvdfgffevteeiffdugeeiveeliefgffetfeehhfethfeuleefkeejgfefvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehshhhirhhokhhovhgrlhgvgihssehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrg
 h
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753735455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w64fXw6fHgZXZy8Vs1aitkEXUNKE8xr8KjFwEdPxWH4=;
 b=TP1Oo1an2F8OTI+MSTlnv7gF3or4PGsgKiDuU/oc3c5pYqstSNDKIjxS5ZRMRTLQ8B4r88
 SpOIeDbQ7C06er8dyS7W4zd/L6HAr6CLfNrkkmZzo1kq107xT4vsWbxobtSjjNmbz27+qo
 JLJ99qvGqc1EKzZzf8DUp9YvhDVSRh88lrv5Ga0R5kSXnFgFFhRofecc5dMFDcPsQ0MVcC
 p8I5LF2qKIAVUA0C0dGUJ7cZ+pJ3VB7p55cIojyZlz2ZhVxQBlZ9GYNvaUbXpwQZ06nqB1
 LFKm82kFqHvluwIVtLu5I51kvJ2DNd15C/E21zUNg30DV0vkqtYoI4L32aa6/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TP1Oo1an
Subject: Re: [Buildroot] [v1,1/1] package/zellij: new package
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

Hello Alexander,

On Mon, 28 Jul 2025 15:19:26 +0200
Alexander Shirokov <shirokovalexs@gmail.com> wrote:

> An advanced terminal multiplexer with batteries included. Supports
> layouts, floating and stacked panes, plugins, and customization.
> Provides rich functionality out of the box.
> 
> Zellij is aimed at developers, operations-oriented users, and anyone who
> loves the terminal.
> 
> https://github.com/zellij-org/zellij
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Thanks for your contribution.

> ---
>  package/Config.in          |  1 +
>  package/zellij/Config.in   | 15 +++++++++++++++
>  package/zellij/zellij.hash |  3 +++
>  package/zellij/zellij.mk   | 12 ++++++++++++
>  4 files changed, 31 insertions(+)

All new packages need an entry in the DEVELOPERS file, could you add
one?


> diff --git a/package/zellij/Config.in b/package/zellij/Config.in
> new file mode 100644
> index 0000000000..24383511ce
> --- /dev/null
> +++ b/package/zellij/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_ZELLIJ
> +	bool "zellij"
> +	depends on BR2_x86_64 || BR2_x86_i686 || BR2_aarch64

Is there really something architecture-specific in zellij?

> +	depends on BR2_PACKAGE_HOST_RUSTC
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	help
> +

This blank line should be dropped.


> diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
> new file mode 100644
> index 0000000000..b015991aab
> --- /dev/null
> +++ b/package/zellij/zellij.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# zellij
> +#
> +################################################################################
> +
> +ZELLIJ_VERSION = v0.42.2
> +ZELLIJ_SITE = $(call github,zellij-org,zellij,$(ZELLIJ_VERSION))

This should be:

ZELLIJ_VERSION = 0.42.2
ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))

i.e, the version field should not contain the "v" prefix, so that the
version number can be matched against CVE reports, against
release-monitoring.org, etc.

Could you adjust those details and send a v2?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
