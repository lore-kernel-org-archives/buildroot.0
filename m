Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B87CC369CA
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 13:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F9C540755;
	Sat, 19 Apr 2025 13:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbVJwntDmNOZ; Sat, 19 Apr 2025 13:59:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E5AC40757
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E5AC40757;
	Sat, 19 Apr 2025 13:59:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10C5D230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 13:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01FD381A6D
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 13:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34XSMoLTXmx5 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 13:59:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6D2281A39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6D2281A39
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6D2281A39
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 13:59:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74CFC43A23;
 Sat, 19 Apr 2025 13:59:51 +0000 (UTC)
Date: Sat, 19 Apr 2025 15:59:49 +0200
To: Guillaume Chaye <guillaume.chaye@zeetim.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <20250419155949.1b1f897e@windsurf>
In-Reply-To: <20250415164958.213674-1-guillaume.chaye@zeetim.com>
References: <20250415164958.213674-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehguhhilhhlrghumhgvrdgthhgrhigvseiivggvthhimhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhto
 hepjhhurdhosehfrhgvvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745071191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VV8D/SLQWF7oJUoO6K9pYnfHiTsbuud03IBCRODwcE0=;
 b=BByXoMDlDnvsuefytGcYiSqhX7rwOuLMmzMido7jHsQV0LJQscy0DOk3x1JzzL2e/iszzB
 vqpZ1k1JWa1SGWDoAdARIDcwuPDRhDwAPZ1uMkwjiCN0aBqi4jGAnhsqeEvXAQK4DpXk3D
 ESVsnvVNykzdR/X+e/dofJhsD0Be7RErsoUKHeMqDxGPAodcNIOs8r6Krtkq4Z9TV4+qta
 54tA20lg2QEdkr5ko8bRQzHX/h+d7qDXsSXOW901N5EnrVkG45+nPFW9uV15x5Jlpby9ZZ
 4deYANtmoM/AyoKZECfR+BPf5fNnjJXm7dL4Q/0OIAdICquIstj1X46zkHSveQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BByXoMDl
Subject: Re: [Buildroot] [PATCH 1/1] support/download/dl-wrapper: add basic
 support for smb file download using curl
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

Hello Guillaume,

On Tue, 15 Apr 2025 12:50:01 -0400
Guillaume Chaye <guillaume.chaye@zeetim.com> wrote:

> This patch introduces a simpler approach to downloading files over the SMB protocol by using `curl` instead of `smbget`.
> 
> Please let me know if you prefer this method, or if you'd prefer the other implementation.

Could you describe a bit the use-case?

Overall, if curl is able to retrieve files via SMB, I guess this patch
is the simplest solution, compared to your other patch that uses smbget.

Note that this needs a better commit log: explanation of the use-case,
no reference to the "other implementation", and text wrapped to 80
columns.

Also, I'm pretty sure updating the Buildroot manual is needed to
document this additional site method.

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
