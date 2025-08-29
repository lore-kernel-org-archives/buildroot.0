Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09CACA0FFD
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 07:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B900614E1;
	Fri, 29 Aug 2025 07:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGeTOA2btUxW; Fri, 29 Aug 2025 07:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80948614C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80948614C8;
	Fri, 29 Aug 2025 07:14:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB0616C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD007614C0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSJYlzfUAsrz for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 07:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A6A0760652
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6A0760652
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6A0760652
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 07:14:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C98643B39;
 Fri, 29 Aug 2025 07:14:27 +0000 (UTC)
Date: Fri, 29 Aug 2025 09:14:26 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250829091426.17a7a814@booty>
In-Reply-To: <20250826041709.163460-2-neal.frager@amd.com>
References: <20250826041709.163460-1-neal.frager@amd.com>
 <20250826041709.163460-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeefvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueevveettddtieegveegffdugeevgffgleeuleejteeggfehueeffeffkefgkeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehnvggrlhdrfhhrrghgvghrsegrmhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehjuhdrohesfhhrv
 ggvrdhfrhdprhgtphhtthhopehmrghrthhinhdrtghhrggsohhtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhujhhusegtohhtughsrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghrnhhouhhtsehrnhhouhhtrdgsvgdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1756451668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ROOMZtKePLC4wDgV88vckSoiKgj4ehJU/QJTvC+sOV4=;
 b=k72ZbnspFIEunr4odpTGIzGv29vghmRgh6XF1Llh4u79dovZbSO97CKVS8H0w16h3kk/+z
 CSv5k+koRYsv6jrADHhUfDaMWwyVUWEXhz0rReDeXNkmax9Ioam/Vqbu0Wh+koiysWcNOc
 bAinNxpXzI5nU9H+RWoYi3aiT9NZj+P64zSHAjgE7bFAKmhDkhR6g/3KCRu4j449tfqlxQ
 I6nLGf50qFeL5GkRGgVVmPtGLDp2MairZKU9xmTvqp8cB7SuUWvDGiOV238pHRTRF1RGp8
 qFUe7T6vPl1KrugAU3gb5xHvdlirKnUfircIe/YHqoU+m3EtBSr86JG23hCVhA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k72Zbnsp
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynq_*: bump to Linux 6.12.40
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: martin.chabot@gmail.com, buildroot@buildroot.org, brandon.maier@collins.com,
 ju.o@free.fr, juju@cotds.org, thomas.petazzoni@bootlin.com,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Aug 2025 05:17:09 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynq defconfigs to Linux 6.12.40.
> 
> The memory leak patch is included with the Linux 6.12.40 release tag, so it no
> longer needs to be applied to these defconfigs:
> https://github.com/Xilinx/linux-xlnx/commit/9691533f6e6fd0a596ac7688e82eeea53f22c434
> 
> This patch has been run tested on the zynq zc702 evaluation board.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
