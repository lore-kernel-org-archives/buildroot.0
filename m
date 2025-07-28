Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C998AC83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 20:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 913AB8128D;
	Mon, 28 Jul 2025 20:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P63kh9X8osuM; Mon, 28 Jul 2025 20:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D7578122B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D7578122B;
	Mon, 28 Jul 2025 20:45:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E9FD91D
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70ABD40F3A
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvT0Sx9NFV36 for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 20:45:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E41440F3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E41440F3D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E41440F3D
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 20:45:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F40C442F1;
 Mon, 28 Jul 2025 20:45:23 +0000 (UTC)
Date: Mon, 28 Jul 2025 22:45:22 +0200
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>, Eric Le Bihan
 <eric.le.bihan.dev@free.fr>
Message-ID: <20250728224522.359de135@windsurf>
In-Reply-To: <20250728102956.81525-1-titouan.christophe@mind.be>
References: <20250728102956.81525-1-titouan.christophe@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -110
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelfeduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlqddutddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegfeffteelveegleefgeeggfefkeffjeefffevieeuudeuhefhkeegueegjeevueenucffohhmrghinhepnhhishhtrdhgohhvpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhithhouhgrnhdrtghhr
 hhishhtohhphhgvsehmihhnugdrsggvpdhrtghpthhtohepvghrihgtrdhlvgdrsghihhgrnhdruggvvhesfhhrvggvrdhfrh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753735523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g41REiydPNkw5hTQx/fCXPWSr5nG8LEQQrc7ntFx9Us=;
 b=fBM675h5VgfotgpdDgCZoWGZL2sc7QMpkep/IFHAKX+ZOtny1+GoBgbv9Z4SUjASLcUimc
 q2VkahSN5jkjaV3rc8Luy7KpIKGXSzZVpF2EHGe9jkcjLoZ05vJ9LKPR0efw7N78qvtggb
 v+66YvSO2CHyc6R3XBuoNJNzhF5M9GjfGjcpXtYqGC9j+TjKcLCvhNF4ssjGFphMUHEgI0
 y81pAKnQMjyzLdPGtJP9zS9i+l1bhj8wat7HZm/eo7lsgbyGAUYD+9VAijsVxuYKzt2Z7V
 ReqbuMssTAp+fdGl8D+zxt878NIAdVW+Zdep2QzTA7nIm+mfcLfOBFvAtjwu0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fBM675h5
Subject: Re: [Buildroot] [PATCH] package/rust: add CPE_ID_VENDOR
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

Hello Titouan,

On Mon, 28 Jul 2025 12:29:56 +0200
Titouan Christophe via buildroot <buildroot@buildroot.org> wrote:

> This gives a proper cpe-id string to the Rust buildroot package
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

We typically want some kind of proof/evidence that this string is
correct, like:

    package/python-future: add CPE identifier
    
    The cpe:2.3:a:pythoncharmers:python-future:*:*:*:*:*:*:*:* is
    valid for this package.
    
    See https://nvd.nist.gov/products/cpe/detail/6E3F033B-5565-461B-8450-D23E68419313

> +RUST_CPE_ID_VENDOR = "rust-lang"

Doubles quotes around the variable value are not needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
