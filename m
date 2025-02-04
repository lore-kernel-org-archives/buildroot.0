Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB020C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 16:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 971C282106;
	Tue,  4 Feb 2025 16:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KY9tuWaOwsk; Tue,  4 Feb 2025 16:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C54A88201B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C54A88201B;
	Tue,  4 Feb 2025 16:53:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EAB5185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A49C8207E
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btjp-JMl0spM for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 16:53:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A12381F4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A12381F4F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A12381F4F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:53:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F29644329;
 Tue,  4 Feb 2025 16:53:06 +0000 (UTC)
Date: Tue, 4 Feb 2025 17:53:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20250204175305.7bb93994@windsurf>
In-Reply-To: <20250118214053.115126-1-bernd@kuhls.net>
References: <20250118214053.115126-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejvdejvdfgffevteeiffdugeeiveeliefgffetfeehhfethfeuleefkeejgfefvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738687986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BIdwC/0LhLqUzNnBhT15/eW1LbCWdBB70mx6qEoH1bE=;
 b=ByfTLj/WMnt6sSxHhHV6uNvk5rSRJ5CDnLDmfOCZBti7/nl077frzvbSfo4YcUa3t7ehKi
 o1hsZRrGwZglB+cRcZbPawh4cgLOYPNIuC2sKM2vk7YgPKO6ceDLSDP+MpkHHeZUHltJ2t
 ne9CraAOfPCAypN433oly/qnmqj9t0uZVc5gCoQUsSJAzemAePK91dd0OBWT9dageWmk5f
 Z74VnR6Th0hXu2ZKwaouUZIYhXd4vII81dwj32K748UvrCa/Shn9tW0zHG0R4u6cYbrioK
 6usHf/MMPLYSvHb7rCm25KKDC1uZzgjIG8gPP0g62347zMlNGKonl73wpb0AGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ByfTLj/W
Subject: Re: [Buildroot] [PATCH 1/2] package/utfcpp: new package
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

Hello,

On Sat, 18 Jan 2025 22:40:52 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/utfcpp/Config.in b/package/utfcpp/Config.in
> new file mode 100644
> index 0000000000..d48209aef2
> --- /dev/null
> +++ b/package/utfcpp/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_UTFCPP
> +	bool "utfcpp"
> +	help
> +	  UTF-8 with C++ in a Portable Way
> +
> +	  https://github.com/nemtrif/utfcpp

I've added a dependency on BR2_INSTALL_LIBSTDCPP here. Even though
strictly speaking for utfcpp itself, it is needed for all packages that
will use it, so it makes sense to "annotate" this as a dependency on
utfcpp.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
