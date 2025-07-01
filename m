Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4409C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 15:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B742816F9;
	Tue,  1 Jul 2025 15:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKQcNgIwVT-L; Tue,  1 Jul 2025 15:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A26198169A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A26198169A;
	Tue,  1 Jul 2025 15:34:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 034F8179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0087661203
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhRFp9-nSfa6 for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 15:34:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E5D061200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E5D061200
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E5D061200
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 15:34:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 095EA4443B;
 Tue,  1 Jul 2025 15:34:04 +0000 (UTC)
Date: Tue, 1 Jul 2025 17:34:04 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20250701173404.3bc34552@windsurf>
In-Reply-To: <87ecv1park.fsf@dell.be.48ers.dk>
References: <20250623215546.1850256-1-thomas.petazzoni@bootlin.com>
 <87ecv1park.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1751384045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bTp7JiwN/T/7gLod1PY+zm3vqH0u//Egm9najuba9y0=;
 b=AnRWYMLUarWUGtxUXQ3imY3CJ7nuqCXFrasyqKxAxbS2xhzGURO0d4A8OSOvjLyyaVc6MG
 v2LVTR0bwlatgAz6CpbzOngZOl6xAR6kNc6A/kDx/Hyy0D4PC4HmWgg+Qo5WC5rSsnKrMc
 Bfib0dXXrMWdvvOluAqVAyZerJ6RSqpK3AYqj/GvnphuBZI+tVqLPSUi5n7u8x7sXCtMsf
 I1EEmboxByTl5lT/ZKO6C6kWEgAQ7M6vPVYmyAAJkF9nX2WKCrc1p4pbzh/sGbmyzL8A1G
 UT+GNpb75o99HqGY58gvNiAvRTCJAISS2DQpopSIwBv9d2tec2u8az1Z0XK3aw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AnRWYMLU
Subject: Re: [Buildroot] [PATCH] package/squashfs: bump to version 4.7
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

On Mon, 30 Jun 2025 16:25:03 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > 1. Mksquashfs now reads files in parallel from the input directories
>  > 2. Rewritten and improved help system (Mksquashfs/Unsquashfs)
>  > 3. New options for building reproducible filesystems (Mksquash/Sqfstar)  
> 
> I didn't look at the code, but is this something we could/should be
> using for BR2_REPRODUCIBLE builds?

So I did have a (admittedly very) quick look, and with
BR2_REPRODUCIBLE=y and our current logic in Buildroot, we already had
files date/time that were clearly "in the past" compared to the build,
I believe somehow set to SOURCE_DATE_EPOCH. So it didn't feel like
using those new options was really needed. But as you can see from the
patch send time, it was 11:55 PM, I wanted to finish my Buildroot
evening, and since I couldn't find an obvious reason to use those new
options, I decided to send just the version bump as-is.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
