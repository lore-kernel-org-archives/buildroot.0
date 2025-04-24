Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47124C369D5
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 20:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F40540750;
	Thu, 24 Apr 2025 20:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGV4Ay40PrYb; Thu, 24 Apr 2025 20:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E2A340382
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E2A340382;
	Thu, 24 Apr 2025 20:57:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B6E3127
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 20:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5248D406EC
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 20:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qcKzbX21imPp for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 20:56:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3EF1D40339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EF1D40339
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EF1D40339
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 20:56:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0FA843B6C;
 Thu, 24 Apr 2025 20:56:55 +0000 (UTC)
Date: Thu, 24 Apr 2025 22:56:55 +0200
To: Lars Wikman <lars@underjord.io>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20250424225655.188ed9f3@windsurf>
In-Reply-To: <20250422072717.153123-1-lars@underjord.io>
References: <20250422072717.153123-1-lars@underjord.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehlrghrshesuhhnuggvrhhjohhrugdrihhopdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehgvghomhgrthhsi
 hesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745528216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TQWM5Vd63hlLXXyuX5BFWRsSNl+oEDpCCjo38/w5QEA=;
 b=ljqXZVfYy5KgffhG0kV9r0PAXVU1GRCwqtY9umgCyMZ2IWReWdof+OfgtCMMWf+vJH8qyU
 /h7iQLp7siK/fjGAkVHOfTKKc6MIA+R+mbIzTCsoj9Gy0R+qF8oMMPvfrK1wnX52L8L/ku
 r/mLWYE1QKcYmylRJ3Nh4LYO19tpQuhnuiHfFpuTReWdWzrdqOjOhhn4sqHH6iX3Fl/w9N
 EvzZrhxIff/4JMyXdmcd4+bTFrA/eaAp5HbzlTkxeP7xPUbKYUQCKnpl+5qGWtRtWZ3TEi
 D85fxr09UR1+HrdcKEjOvqZERW7MW0xVcaGAlMNxz+cA/nOI9a+LV+ndW6Alug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ljqXZVfY
Subject: Re: [Buildroot] [PATCH] package/wpa_supplicant: add Smart card
 option
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

On Tue, 22 Apr 2025 09:27:17 +0200
Lars Wikman <lars@underjord.io> wrote:

> CONFIG_SMARTCARD was unconditionally disabled which has meant that
> even if OpenSSL is compiled with engine support and the supplicant
> is configured to use an engine it would warn that it was compiled
> without engine support.
> 
> This mechanism is used to enable the more secure forms of 802.1x
> networking authentication such as EAP-TLS with hardware-delegated
> cryptography and private keys protected in hardware.
> 
> It is still disabled by default in case there was an original reason.
> 
> Enabling the option will allow delegating private key access to TPM2,
> ARM TrustZone and other specialized secure hardware for establishing
> a network connection.
> 
> Signed-off-by: Lars Wikman <lars@underjord.io>
> 
> ---
> Changes v1 -> v2:
>   - Change option name to focus on smartcard  (suggested by Sergey)
> Changes v2 -> v3:
>   - Change setting disabled to match convention (suggested by Baruch)
> Changes v3 -> v4:
>   - Add selecting OpenSSL for smartcard (suggested by Thomas)
> ---
>  package/wpa_supplicant/Config.in         | 8 ++++++++
>  package/wpa_supplicant/wpa_supplicant.mk | 9 ++++++---
>  2 files changed, 14 insertions(+), 3 deletions(-)

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
