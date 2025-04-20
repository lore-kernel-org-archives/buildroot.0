Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF23C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 21:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28FDA40483;
	Sun, 20 Apr 2025 21:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqwJfAKeKWcy; Sun, 20 Apr 2025 21:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57D0E405B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57D0E405B3;
	Sun, 20 Apr 2025 21:27:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DAF61C0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7C7381080
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNSI8H3AkKib for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 21:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E471E81069
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E471E81069
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E471E81069
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 21:27:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCA3443B80;
 Sun, 20 Apr 2025 21:27:54 +0000 (UTC)
Date: Sun, 20 Apr 2025 23:27:53 +0200
To: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20250420232753.65897f54@windsurf>
In-Reply-To: <20250331233726.3730509-5-daniel.crowe@maxmine.com.au>
References: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
 <20250331233726.3730509-5-daniel.crowe@maxmine.com.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeeltddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveevvddtfeejfeekieegieegvdffteeutdetgedtveffffefgfejieffjeeuvdetnecuffhomhgrihhnpehgihhthhhusgdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegurghnihgvlhdrtghrohifvgesmhgrgihmihhnvgdrtghomhdrrghupdhrtghpthhto
 hepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehjrghmvghsrdhhihhllhhirghrugdusehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745184475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6TuG/sipUzTIIDNmh1czKdUD6Y545xZLY7K+9xrTAlQ=;
 b=lYLbJCFgMZ6ZBLX8OlTnZkWy/YsCNzh/8nDuVZo0vGKJ0oOsCwR5mtw3pPI0cSa8Vg1aP5
 aN0p3kusGevejJtUz1V3mQk59CzVt20tt5QoM/XtwpQ3/HZmKEEBgcMU2s6JZKJ3O4wtI7
 j+a9MhWAm9RU90MXe1Uq48YeSrlv8IP96eqm5cHJkIfo42qLKwTjhqpnfGdIwvy4JuffNK
 3CUZeZwogy+bU7knknIJVeHrUVhFINB+xwgrrJ8XwAyraH7afdVaMQ1Jo8p3CHuSATEVEq
 t3TfKHjWiycs10WX7r7vqBdzn/rUCDeBgevM6OuZ9U5v80nd11HORihIR28aJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lYLbJCFg
Subject: Re: [Buildroot] [PATCH 5/5] package/python-pyproj: add version 3.7.1
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

On Tue,  1 Apr 2025 10:07:26 +1030
Daniel Crowe <daniel.crowe@maxmine.com.au> wrote:

> Provides cartographic projections in Python
> https://pyproj4.github.io/pyproj/stable/
> 
> Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>

I was quite surprised that this didn't need any dependency on the
"proj" library, so I tried to build it, and it fails with:

* Getting build dependencies for wheel...
ERROR: Cython.Build.cythonize not found. Cython is required to build pyproj.

ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel

I just built:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_PYPROJ=y

Also, since it's a fairly complex Python package, could you add a test
case in support/testing/? It can be as simple as some trivial examples
from https://pyproj4.github.io/pyproj/stable/examples.html.

See support/testing/tests/package/test_python_ubjson.py for a very
simple example of Python test.

(Also, please add an entry in the DEVELOPERS file. Thanks!)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
