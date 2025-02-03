Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD43BC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 22:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90B136082C;
	Mon,  3 Feb 2025 22:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRoiL54TUY4S; Mon,  3 Feb 2025 22:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC1BD608E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC1BD608E4;
	Mon,  3 Feb 2025 22:07:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EF6912F
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A9CD40296
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDvXHtFAmmor for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 22:07:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82E27401E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E27401E2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82E27401E2
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:07:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56D4744256;
 Mon,  3 Feb 2025 22:07:24 +0000 (UTC)
Date: Mon, 3 Feb 2025 23:07:23 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250203230723.7a8f48e8@windsurf>
In-Reply-To: <20241218230457.993007-1-ju.o@free.fr>
References: <20241218230457.993007-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffekiefhieeihfefffelieeutefhudelvefhueehteeggfdvueffgfeggedtkeeknecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepudelgedrjeekrddvuddurddvvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudelgedrjeekrddvuddurddvvddtpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738620444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22jVYVQkf5mwTCP1sx0XFlJUAmThVUraPcgPvAddNoY=;
 b=lDBmFcAo7ZBSn1iBnorQK39KhIrnkQAoqC/ITvGeanfOIcD83RbFPz9GIrcl6Ln9uvBNRj
 4qft4smcTZZEJmToTOoC8+5PbEkBCD49V84ZvDQ2ckS+fAU90KzSkcBCadCWwFPkZ0zV1N
 92p4ZR9Gg90Y4FddIv+kuakb475+o1veKi4zYiuHhT6pyEaEiIDkR7adyZ5CYIgiidgQpd
 BghsvN/TWUKiqPFHXKRWixFM9Bh+jbV6cv6v+IU+bADYa5s+HHqdyPvK9oMp0dgu58zq6A
 ppAHHnX5seXGjbm284SXrpaSbNe2pqJvJulNES+P/fMD4bO29vK4q7KLSfEgyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lDBmFcAo
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new patch runtime test
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

On Thu, 19 Dec 2024 00:04:57 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8681269389
> ---
>  DEVELOPERS                                    |  2 +
>  support/testing/tests/package/test_patch.py   | 44 +++++++++++++++++++
>  .../test_patch/rootfs-overlay/root/file.diff  |  8 ++++
>  .../test_patch/rootfs-overlay/root/file.txt   |  3 ++
>  4 files changed, 57 insertions(+)
>  create mode 100644 support/testing/tests/package/test_patch.py
>  create mode 100644 support/testing/tests/package/test_patch/rootfs-overlay/root/file.diff
>  create mode 100644 support/testing/tests/package/test_patch/rootfs-overlay/root/file.txt

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
