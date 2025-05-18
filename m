Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CDDC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 13:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9572E40544;
	Sun, 18 May 2025 13:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_BzkdqqvJD4; Sun, 18 May 2025 13:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C71CA4051C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71CA4051C;
	Sun, 18 May 2025 13:37:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DF8AE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A74940142
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1y1USlKQzQiX for <buildroot@buildroot.org>;
 Sun, 18 May 2025 13:37:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 27EE5404DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27EE5404DA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27EE5404DA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:37:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2B7743B22;
 Sun, 18 May 2025 13:37:28 +0000 (UTC)
Date: Sun, 18 May 2025 15:37:28 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <20250518153728.1ac9a439@windsurf>
In-Reply-To: <20250518132419.4171795-1-peter@korsgaard.com>
References: <20250518132419.4171795-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjedvjedvgfffveetieffudegieevleeigfffteefhefhtefhueelfeekjefgfedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemugefudgvmedvfeehmegthegvvdemvggukeefpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747575448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/+ro+EMfPwFb+PZ9a9wUMMZgCZyfi7hhL5EWQ8SxHI=;
 b=IZvd/m5MBbYj/7KZNEAJjbySKwZmVzB6Ss66YxvkWl6Jzp2xm4282/zFOmYAbv3X2DZ30P
 xJn7S71MuIzHRMcFfL2nLIK1Oz34G56yqpmFyuCG4VBigkB/M/Yuednvw9KM//UA8065wx
 RbBQ0Soqi/H7ZjDhTfBv6+OoBOTb8wbNxXas9dQaoNJQsZ3u6zX4TloK5Rnjtkbc8ptGP/
 Sny1JnzYG5YNxJz6fB4wGj+VKg1nZLfo7BLUCPw9E0AuMxKasBO4n4AjH9eXbnlLMipynd
 MGHMPPnJo4doVrNVFHYOGCGdzPBFfApb7BKb0o8ugJy0EoBgxwYVF6VAYF7RzA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IZvd/m5M
Subject: Re: [Buildroot] [PATCH] package/net-tools: add upstream security
 fix for CVE-2025-46836
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

On Sun, 18 May 2025 15:24:18 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issue:
> 
> CVE-2025-46836: Stack-based Buffer Overflow in net-tools (get_name)
> 
> https://github.com/ecki/net-tools/security/advisories/GHSA-pfwf-h6m3-63wf
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...nterface.c-Stack-based-Buffer-Overfl.patch | 93 +++++++++++++++++++
>  package/net-tools/net-tools.mk                |  3 +
>  2 files changed, 96 insertions(+)
>  create mode 100644 package/net-tools/0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch

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
