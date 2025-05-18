Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EDDC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 21:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1094760E8B;
	Sun, 18 May 2025 21:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIwIuQr56bKY; Sun, 18 May 2025 21:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4634E60E8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4634E60E8E;
	Sun, 18 May 2025 21:06:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D75351BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCDD641131
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLxctdrutfDf for <buildroot@buildroot.org>;
 Sun, 18 May 2025 21:06:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B4934111D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B4934111D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B4934111D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:06:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B59A6442B0;
 Sun, 18 May 2025 21:06:25 +0000 (UTC)
Date: Sun, 18 May 2025 23:06:25 +0200
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20250518230625.69ea0973@windsurf>
In-Reply-To: <20250518041115.115022-1-kadambini.nema@gmail.com>
References: <20250518041115.115022-1-kadambini.nema@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudelheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheettdetffevfeevffekveefteelhedvkeeuveehudejtdevvdetteeuteffvedvnecuffhomhgrihhnpehvrghlghhrihhnugdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepkhgruggrmhgsihhnihdrnhgvmhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhot
 hdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747602385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wavhFVwnV7Snkz10CVy8b80khVHiC7+b/g0VZYqvQ30=;
 b=a0rWw695/Ohi9xR7flY0+QwkaohmijD2M343p27QErh+IH96+9A9kOL8HWPKD4dQZJP2dl
 SB4deQL4q5+Dh3I19y1+QpRvpK6QBed7XmTeYgWJXdg7mCFkwlNEViU1My4/IvLJOqk7Qa
 jW1TYHGh5FfgUBmiQ26ZJQfYRPNrSxrZRz7laV0RNC5uR4fj4zTjLokhCSxy7ry9kmJ+du
 mIsd0f5Kg+QYSs8CG4UxZJOeeTNQttFIXz8LG5T60jBya7badcwnBH23cBHTjn2g7nOqpB
 UwYBsslxScFQwcnExUlXGzuDVDEcedmB7F1fWGmbBdnl6PxV5o3TGwayxlbv3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a0rWw695
Subject: Re: [Buildroot] [PATCH 1/1] package/valgrind: bump to version 3.25.0
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

On Sat, 17 May 2025 21:11:15 -0700
Kadambini Nema <kadambini.nema@gmail.com> wrote:

> Release notes:
> https://valgrind.org/docs/manual/dist.news.html
> 
> Rebased patches for the new version.
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>  package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch         | 2 +-
>  ...Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch | 2 +-
>  package/valgrind/valgrind.hash                                | 4 ++--
>  package/valgrind/valgrind.mk                                  | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)

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
