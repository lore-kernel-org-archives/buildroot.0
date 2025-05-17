Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCC9C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 14:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2F1760E5E;
	Sat, 17 May 2025 14:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdTDyrq33Oki; Sat, 17 May 2025 14:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C192D60E44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C192D60E44;
	Sat, 17 May 2025 14:35:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B010E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE88382230
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwI3ZJdLbQcr for <buildroot@buildroot.org>;
 Sat, 17 May 2025 14:35:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CA3E80CF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CA3E80CF5
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CA3E80CF5
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:35:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF38643A0D;
 Sat, 17 May 2025 14:35:10 +0000 (UTC)
Date: Sat, 17 May 2025 16:35:10 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <20250517163510.62c20e61@windsurf>
In-Reply-To: <20250516141021.600390-1-adam.duskett@amarulasolutions.com>
References: <20250516141021.600390-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudehkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegruggrmhdrughushhkvghtthesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrg
 hdprhgtphhtthhopegrnhhgvghlohdrtghomhhprghgnhhutggtihesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747492511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7Rrcfdm7XMnyNYZ7swf+YKs/eSVBPxkXsW0JU1YtuU=;
 b=GD6+JQC7y8W6BNuzTGpZZNKe0yQIhxgmgFdDUXBPJxX9Se2wQX5elDMTUoT0xac/d3Y09A
 inFg/QrsiXZ5c5+kgAqD3JiDw0JcOAY+1GHjznJNKROhnLm5Bk30S4ORXSl3SJmLIw7j7v
 A1yuF8a9hSTh7cYLzsJSrQs6QJlKuNl0m82yHqBZtK95VIK4jagH8XMfxCwhvrOd+qeo9X
 HNmkpRYIpKMz24GxJosXzs6UzW1A0JCKRpMcaD/LAvG/wTKsGIWeaITBc6BBee9t4J5Y7k
 zj+EcRWT3cEmz/7nUc568ecjcEpWKK/xqy1vivlgjFOnYwfx2fqat/13Qrbdvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GD6+JQC7
Subject: Re: [Buildroot] [PATCH v4 1/2] package/mender-update-modules: new
 package
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

On Fri, 16 May 2025 16:10:20 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Contains community supported Update Modules. An Update Module is an extension
> to the Mender client for supporting a new type of software update, such as a
> package manager, container, bootloader or even updates of nearby
> microcontrollers. An Update Module can be tailored to a specific device or
> environment (e.g. update a proprietary bootloader), or be more
> general-purpose (e.g. install a set of .rpm packages.).
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v2 -> v3:
>   - Remove incorrect dependencies and simply depend on mender (Thomas)
>   - Fix indent formatting in mender-update-modules.mk (Thomas)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
