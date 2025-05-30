Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20200C5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 20:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D820B60DDD;
	Fri, 30 May 2025 20:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDCZg-xFfdsu; Fri, 30 May 2025 20:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC5360DAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CC5360DAD;
	Fri, 30 May 2025 20:01:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECBD8127
 for <buildroot@buildroot.org>; Fri, 30 May 2025 20:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD58360DAD
 for <buildroot@buildroot.org>; Fri, 30 May 2025 20:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wO1_cSKLYsz7 for <buildroot@buildroot.org>;
 Fri, 30 May 2025 20:01:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C258C60D8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C258C60D8F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C258C60D8F
 for <buildroot@buildroot.org>; Fri, 30 May 2025 20:01:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3B49439EB;
 Fri, 30 May 2025 20:01:27 +0000 (UTC)
Date: Fri, 30 May 2025 22:01:25 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
Message-ID: <20250530220125.3b1c7c5f@windsurf>
In-Reply-To: <20250527152342.4288-1-fl@n621.de>
References: <20250527152342.4288-1-fl@n621.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleeludculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudeimeefleemkegtugejmegvuddtleemledvtdgtmedvfedvkeemieejvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduieemfeelmeektggujeemvgdutdelmeelvddttgemvdefvdekmeeijedvvddphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehflhesnheivddurdguvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748635288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7EGhtzNoPSNAzbZxB2Km2FvRg4lIbb5nw7CjGTE51M=;
 b=FelFPSxLi0aeN0f8xJzRfmRaKWAF3D134V+L4qKS279l8QO6NKOyq5Zq471DktasRg5hFk
 mfF2DJjs5mp2T2jbarHxwYJYIDNSe/3iVkxEH/vSgIq9GuhRhDMN4JIMqWsA0qumyneflg
 exN8Qu0EMhKQjUWj4Hes9rAEjTxbBWGRXn4u0tUoz7UImL5Dc3HXGHJm1eOWO8V/a2AF/7
 mMaLWnVJ2hKbkX5hi7uLqA4piGtVnhPNMberzU9LtudBgrHLQEdkpLlF05Qc4bLGFdKYRf
 wR8JMDWY1/Z8xcjAr81cP9rD8qWl4SGzkRv+ft+ddbsc4JClCvLAmOfI5B3j9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FelFPSxL
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: make
 cryptography library optional
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

Hello Florian,

Thanks for the patch!

On Tue, 27 May 2025 17:23:38 +0200
Florian Larysch <fl@n621.de> wrote:

> The network-manager package currently pulls in either gnutls or libnss,
> neither of which are very common and it might be the only reason why
> they are present on a system.
> 
> However, most of NetworkManager works just fine without any cryptography
> support, it only seems to be used in test cases and 802.1X support code.
> 
> Make the crypto backend configurable and optional to make it possible to
> avoid this dependency while keeping the default behavior the same.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>
> ---
> 
> The select vs depends on thing is a bit hacky because I've tried to set
> it up in a way that keeps the existing behavior for backwards
> compatibility. I'm not even sure if this is the best way to go about it
> or if all the options should maybe just depend on the respective
> libraries to make it less implicit.

In this kind of situation, I'm not sure keeping backward compatibility
is really a good idea. Indeed, we have two conflicting goals:

(1) Not break backward compatibility. This would encourage in
continuing to automatically select gnutls as a dependency of
network-manager, like your patch does

(2) Have minimal dependencies by default, which is one of the great
things about Buildroot: it doesn't pull in needless stuff for no
reason. This would encourage NOT automatically selecting any crypto
library by default.

And I think my preference goes to (2) in this situation.

> -ifeq ($(BR2_PACKAGE_LIBNSS),y)
> +ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CRYPTO_LIBNSS),y)
>  NETWORK_MANAGER_DEPENDENCIES += libnss
>  NETWORK_MANAGER_CONF_OPTS += -Dcrypto=nss
> -else
> +else ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CRYPTO_GNUTLS),y)
>  NETWORK_MANAGER_DEPENDENCIES += gnutls
>  NETWORK_MANAGER_CONF_OPTS += -Dcrypto=gnutls
> +else ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_CRYPTO_NONE),y)
> +NETWORK_MANAGER_CONF_OPTS += -Dcrypto=null
>  endif

So the change would be just:

ifeq ($(BR2_PACKAGE_LIBNSS),y)
NETWORK_MANAGER_DEPENDENCIES += libnss
NETWORK_MANAGER_CONF_OPTS += -Dcrypto=nss
else
else ifeq ($(BR2_PACKAGE_GNUTLS),y)
NETWORK_MANAGER_DEPENDENCIES += gnutls
NETWORK_MANAGER_CONF_OPTS += -Dcrypto=gnutls
else
NETWORK_MANAGER_CONF_OPTS += -Dcrypto=null
endif

and of course drop the select in Config.in. We might discuss whether
gnutls should take priority on libnss if both are available. Maybe NM
documents that one is "better" over the other?

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
