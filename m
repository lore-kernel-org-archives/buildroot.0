Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6B7C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 13:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BB014092A;
	Sun, 18 May 2025 13:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgS5GShe0t_H; Sun, 18 May 2025 13:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A49C34092B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A49C34092B;
	Sun, 18 May 2025 13:31:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E4861BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63DA36064B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYDJm6VuDE-a for <buildroot@buildroot.org>;
 Sun, 18 May 2025 13:30:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35D756064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35D756064A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35D756064A
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:30:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E20F542E80;
 Sun, 18 May 2025 13:30:56 +0000 (UTC)
Date: Sun, 18 May 2025 15:30:56 +0200
To: Brandon Lumbra via buildroot <buildroot@buildroot.org>
Cc: Brandon Lumbra <brandon.lumbra@sense.com>, Sergey Matyukevich
 <geomatsi@gmail.com>
Message-ID: <20250518153056.5a087c9f@windsurf>
In-Reply-To: <20250404145544.971346-1-brandon.lumbra@sense.com>
References: <20250404145544.971346-1-brandon.lumbra@sense.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsghrrghnughonhdrlhhumhgsrhgrsehsvghnshgvrdgtohhmpdhrtghpthhtohepg
 hgvohhmrghtshhisehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747575057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewxV4ipqeuHXQanObeJ907vgFQcvC1jfmMW6MwUiOwI=;
 b=aZi3RRwnKq+bjrPX/Qy34jVUsHs5DftuRPvrp7LvrY7relO+ZWG+AetLdlSQP02ypgO+wI
 70P2rZUlLDGL87Glw+zOLgSRn26VE+n70wnNu+QLahDquixaz2MPvu4atHe8v8Q5YYE2lK
 91mzxjYGJjvmnbPGKsYuzk7MU2F7eI/3WaAfI3wrpIgbdC1a9eGY9BiFUZ7M2yXGwEWGJF
 5fAEfbgx0pQk7q6FHzsyvooNzmIYMoVjFFKLhssVCJd/hsuk6YioFcuoenx4fliauttA8w
 PAngyOENMdz5EHL4zcnrGgojXS8kfK3xlz4M7Ch2pNsR6R3NF6gbyBJW8gJBIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aZi3RRwn
Subject: Re: [Buildroot] [PATCH 1/1] wpa_supplicant: add config option to
 build in deprecated WEP support
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

On Fri,  4 Apr 2025 10:55:45 -0400
Brandon Lumbra via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Brandon Lumbra <brandon.lumbra@sense.com>
> ---
>  package/wpa_supplicant/Config.in         | 7 +++++++
>  package/wpa_supplicant/wpa_supplicant.mk | 4 ++++
>  2 files changed, 11 insertions(+)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
