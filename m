Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCCCC83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 20:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 791D681232;
	Mon, 28 Jul 2025 20:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWxPiLn6AdnZ; Mon, 28 Jul 2025 20:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D82A81233
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D82A81233;
	Mon, 28 Jul 2025 20:47:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C413AD78
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9A4B81232
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCjFEpuhvmEd for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 20:47:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93E8581228
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93E8581228
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93E8581228
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:47:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B02BF44465;
 Mon, 28 Jul 2025 20:47:34 +0000 (UTC)
Date: Mon, 28 Jul 2025 22:47:33 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250728224733.1d1727e9@windsurf>
In-Reply-To: <20250727192537.1164560-1-thomas.perale@mind.be>
References: <20250727192537.1164560-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -110
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelfedujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlqddutddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegfeffteelveegleefgeeggfefkeffjeefffevieeuudeuhefhkeegueegjeevueenucffohhmrghinhepnhhishhtrdhgohhvpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghrr
 ghlvgesmhhinhgurdgsvg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753735654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XWceIudmPRy/jXpXlvsf4Zg5GiFpNljwumXolI4Z5XY=;
 b=Is4wRyVPloQWk9YCfYETPklbqiGLRc4Fj19FkJ1h2nQIpN+HK0GdYfHgvTPvOWmZJA1DHT
 A4Y/1bXu8+2qUMIk0MMRTcspErhjjMdo0IG50+akKv6qNPI0m6Jva8vck/QwFmVsN4TKEA
 FrcVlYBPcp3QYNGopXln3nlui+nXlcaPaQWq0AuX932GGWKXQzvSUu/odv6tb87fJWQV0l
 ocDmC+ZAKppaR+hKUDsfvmuJGKfEYURbzcKHO+K7Abz+smeuGuorzlSJUxSDAy59OeFMtq
 wkvFg3dnr2zA0PnNRlJBKtDQCAvzZGQlkW11b0uTmHBXmJNrvG4wxGopKVPC+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Is4wRyVP
Subject: Re: [Buildroot] [PATCH] package/aardvark-dns: add CPE identifier
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

On Sun, 27 Jul 2025 21:25:37 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> The cpe:2.3:a:containers:aardvark-dns:*:*:*:*:*:*:*:* is
> valid for this package.
> 
> See https://nvd.nist.gov/products/cpe/detail/5F79D5CD-D716-4190-BE08-31EB5EEB233F
> 
> The CPE version strip the 'v' prefix from the version.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

even though, I would really prefer us to be able to have the _VERSION
field without the v prefix in the first place. Indeed your tricky with
AARDVARK_DNS_CPE_ID_VERSION works for the CVE matching, but it doesn't
work for release-monitoring.org matching.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
