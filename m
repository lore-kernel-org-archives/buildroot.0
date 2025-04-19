Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4A9C369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCCA26084C;
	Sat, 19 Apr 2025 21:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXvT8oE1W9yV; Sat, 19 Apr 2025 21:53:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1649D60861
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1649D60861;
	Sat, 19 Apr 2025 21:53:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E990622F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB27A813D5
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psxVFk8V-ejd for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:53:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE190813CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE190813CC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE190813CC
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:53:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7C3B4326B;
 Sat, 19 Apr 2025 21:53:23 +0000 (UTC)
Date: Sat, 19 Apr 2025 23:53:22 +0200
To: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20250419235322.373a205b@windsurf>
In-Reply-To: <20250331233726.3730509-2-daniel.crowe@maxmine.com.au>
References: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
 <20250331233726.3730509-2-daniel.crowe@maxmine.com.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeiudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffegheffjeekgeduhffhveevffetueejiefftdffvdejffffiedukeevveevuddvnecuffhomhgrihhnpehrvggrughthhgvughotghsrdhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepuggrnhhivghlrdgtrhhofigvsehmrgigmhhinhgvrdgtohhmrdgruhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhil
 hgurhhoohhtrdhorhhgpdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745099603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icutK2e3APYF9Xlr1bIXYvE+VxivTXwkSJ9uEMp7rEI=;
 b=F4bVMXP9pMrfjKF8kqMFNc/09x/i9tyZ+2pRSJft7xWwfCjkBghqnuhV/xa0u0Ngy586z4
 EppfJGJnXjh9w613pjr7QOOHlvG+30Fe+fltmhVlrDRrSv//kngbP50+nYP83JmDAwKf1S
 WbbvL33+WY7KOpu92fCG1L401UcEo914TTMPVaqQ9RVmXtd90m0nMJeijQOEkn9KKMWFlW
 c1bWmKFesVbOuv5KemofYbHCfJ9SBpxG07PI9u2vE7jXvHqZEGohvbTszt06wbl+d+pSpB
 vG5IsHDpAY+54d/Y/fReKKmGkytVfj0Ah+JON0CTS2ruN2QXrxjSZn10z17EWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F4bVMXP9
Subject: Re: [Buildroot] [PATCH 2/5] package/flask-caching: add version 2.3.1
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

Hello Daniel,

On Tue,  1 Apr 2025 10:07:23 +1030
Daniel Crowe <daniel.crowe@maxmine.com.au> wrote:

> Provides caching for python Flask applications
> https://flask-caching.readthedocs.io/en/latest/
> 
> Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
> ---
>  package/Config.in                                  |  1 +
>  package/python-flask-caching/Config.in             |  8 ++++++++
>  .../python-flask-caching/python-flask-caching.hash |  6 ++++++
>  .../python-flask-caching/python-flask-caching.mk   | 14 ++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/python-flask-caching/Config.in
>  create mode 100644 package/python-flask-caching/python-flask-caching.hash
>  create mode 100644 package/python-flask-caching/python-flask-caching.mk

Same comments as the previous patch: the commit title wasn't entirely
correct, and the entry in the DEVELOPERS file was missing. Aside from
that, looked good, so: applied to master, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
