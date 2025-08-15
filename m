Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F35ECA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 18:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ABE640E9C;
	Fri, 15 Aug 2025 18:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcwP2nsno5il; Fri, 15 Aug 2025 18:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E8A7409FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E8A7409FB;
	Fri, 15 Aug 2025 18:29:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1EB7223
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3C1041224
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svtxr4JSwgtL for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 18:29:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A5D141220
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A5D141220
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A5D141220
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 18:29:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF84A442CF;
 Fri, 15 Aug 2025 18:29:26 +0000 (UTC)
Date: Fri, 15 Aug 2025 20:29:25 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Cc: Julien Olivain <ju.o@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>
Message-ID: <20250815202925.42d1667c@windsurf>
In-Reply-To: <SA1PR12MB56156FBEE60B08B4CF6E47FEF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250815152737.588503-1-ju.o@free.fr>
 <20250815173050.1cc70ac9@windsurf>
 <SA1PR12MB5615DBECDFACC784ACC244BFF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
 <SA1PR12MB56156FBEE60B08B4CF6E47FEF034A@SA1PR12MB5615.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeegieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughro
 hhothdrohhrghdprhgtphhtthhopehisggrihdrvghrkhhirghgrgdqvghlohhriigrsegrmhgurdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755282567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyIEUPl1tKthC9S/FyXK5h4wmTVneyqulsPqGVKiaSE=;
 b=XMzEKmEypk1BADniDzxwKoCRMjP7jLrvAlefS949eRs91rPao92tj5bQPUNTMcDZCVA6Qp
 kOeA7bqCOSs4xLWYRwgY/1YM0CfQLOZoelW51CrGtFLUV5X0lYKWnAut6JippbUS9zZD7g
 k5JeSAZJJeP5VmFGxX6/I4lvdIZ04CaR/r9z1K6T1G3zfcmkiud9cKoTOhmq2oKPib8s1/
 QJXVKyGCeuKIQhmFb4twPWbXp+YdZPIh9JuBD053IftrvwUIxrDtW4EG31KU3ndSKowR/d
 wlgwpKh8eUS8fz5BjvIzAnz+W7vTkqYrR6nH1MxAiX200qFb5Gck8wPGq6fVQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XMzEKmEy
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc-bare-metal: bump to version
 15.2.0 to fix build
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

On Fri, 15 Aug 2025 17:11:53 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> I just thought of a better idea.  How about we create an actual hash file for
> gcc-bare-metal instead of soft linking to gcc.hash?  This would make the
> gcc-bare-metal package 'Thomas-forgetting-proof' for future gcc version bumps.

What about the patches symlink? Perhaps we can decide that the stack of
patches doesn't need to be shared?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
