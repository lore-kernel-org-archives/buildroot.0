Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C20CCA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 17:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AB20612F5;
	Sat, 16 Aug 2025 17:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioNaXQlZJXBU; Sat, 16 Aug 2025 17:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43E706130E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43E706130E;
	Sat, 16 Aug 2025 17:52:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD28275
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 17:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF547407AE
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 17:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iAbxfi8wf7j for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 17:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::236;
 helo=relay16.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC2A64051C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC2A64051C
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC2A64051C
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 17:52:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCA64449BB;
 Sat, 16 Aug 2025 17:52:08 +0000 (UTC)
Date: Sat, 16 Aug 2025 19:52:07 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>, James Hilliard
 <james.hilliard1@gmail.com>
Message-ID: <20250816195207.5f8136a3@windsurf>
In-Reply-To: <20250816130105.3359292-1-thomas.perale@mind.be>
References: <20250816130105.3359292-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgurdgsvgdprhgtphhtthhopehjrghmv
 ghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755366729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsZlTlqrh7invV1I0m8kee3IMJ4ABixrb40kWUJ8XXE=;
 b=brBHdku3LzJSiA+9JKm9LWbklWNHmetT7vtFYVoYxOMeUern0vEKL8ZaHHQhJufI4OWzPT
 B/wt9AsZsjHdzTlVDUyob7cEFXGg7lmGPBFdF+urOvLj+kC12fq07glNoqKUR/3KKRCCPB
 QZAjvBZAte9bhWA5hhfMptMvciffgShHM5P7NN+cLdFBe8ZuSJP4wb2QDkPosDhZyN/LNM
 GbQhBIOcHg5O6xCuzzCfdpV9G8CY8ScaRRan63rN0pDzncQBCxSre6N7LaNO1QAB/oQGPZ
 YCRxndOZ7pBszB7c79HafXv5i8BYIpRudad8Ubb7rCvv/RXKYKnEvOQVVfcGcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=brBHdku3
Subject: Re: [Buildroot] [PATCH 1/2] package/python-yarl: add missing select
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

On Sat, 16 Aug 2025 15:01:04 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> `python-yarl.mk` depends on the host-python-cython package. This patch
> adds a `select BR2_PACKAGE_HOST_PYTHON_CYTHON` to correctly express this
> dependency in KConfig.

This is not quite needed, nor required. We do not enforce adding select
for host packages. When a package needs host-pkgconf, we do not select
BR2_PACKAGE_HOST_PKGCONF for example. I'm sure you will find tons of
other packages that have host-python-cython in their <pkg>_DEPENDENCIES
but that don't select BR2_PACKAGE_HOST_PYTHON_CYTHON.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
