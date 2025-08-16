Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D24CA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72AE26154B;
	Sat, 16 Aug 2025 20:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKEJcTcMF5c9; Sat, 16 Aug 2025 20:52:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1859361540
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1859361540;
	Sat, 16 Aug 2025 20:52:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76834196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6854961540
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWf6j2lNkVf0 for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:52:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F66B6153E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F66B6153E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F66B6153E
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:52:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CCA8442BA;
 Sat, 16 Aug 2025 20:52:02 +0000 (UTC)
Date: Sat, 16 Aug 2025 22:52:01 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale via buildroot <buildroot@buildroot.org>, James Hilliard
 <james.hilliard1@gmail.com>
Message-ID: <20250816225201.10b98623@windsurf>
In-Reply-To: <20250816202153.3376159-1-thomas.perale@mind.be>
References: <20250816195207.5f8136a3@windsurf>
 <20250816202153.3376159-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhkeekgeevgfekhfeggfelffdvgfdtteduuedthfehfffgkeeileefhedvkeelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgurdgsvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgp
 dhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755377523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3uvzrr0MbB/FvlnLdoCh/Enw7b5F6PROViZ+AsJhhFE=;
 b=EaJAQJfa2NhPV/XwRBGsuaJo5iVDn59Oe0gnUUTSPOkpqeA/m4R+lcK+okBwZ93Dg+dtNU
 e7stRAH/mzIFF9uKF8VzCJvVXjrT/A3VlkJd4IrAPLmejLxXK2fi3F/NzsOxG8+YB4Jpoe
 6XpKHibqnAq7wGOwRbz/8sydQV94LYOcrKcpmueIjIk8+TPVFsmqPIUhSna++/u5EVw/zS
 WBPJTm8Q3OT1/9h1BKCUNXvh36IkDZtGQJlEsncptCmeERDIqk/TuAeLyuocuJcH7OPZhZ
 eyQypxr816mTAvTJLZcrSdohgLv31XI2EKodM5YjCs/kxGb2G5fzJbYhOqDvdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EaJAQJfa
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

On Sat, 16 Aug 2025 22:21:53 +0200
Thomas Perale <thomas.perale@mind.be> wrote:

> Good to know, my reasoning was that other package in that same case seemed to
> select `BR2_PACKAGE_HOST_PYTHON_CYTHON`:
> 
> - python-kmod/Config.in
> - python-dbus-fast/Config.in
> - python-rgbmatrix/Config.in
> 
> So, if you prefer to not include the 'select' I will send a v2 and remove my
> series that did the same for python-propcache
> (https://lore.kernel.org/r/<20250813201639.2443921-1-thomas.perale@mind.be>).

Indeed to me right now the consensus has been to _not_ add those
selects for host packages. The Config.in.host option is only to allow a
user to explicitly enable a host package through "make menuconfig".

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
