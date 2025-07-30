Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD06DC83F26
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 20:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71A5D614BA;
	Wed, 30 Jul 2025 20:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJjryKs19WXV; Wed, 30 Jul 2025 20:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84359613E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84359613E9;
	Wed, 30 Jul 2025 20:38:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E97E186
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E939940FF3
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAwMp9Ks37VI for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 20:38:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BA454085A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BA454085A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BA454085A
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:37:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D34F744386;
 Wed, 30 Jul 2025 20:37:54 +0000 (UTC)
Date: Wed, 30 Jul 2025 22:37:53 +0200
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <20250730223753.2f400524@windsurf>
In-Reply-To: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
References: <20250710-loongarch-fabi-v2-0-72fcf95c8b65@flygoat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhkeelhfeifeehffdthfehhfdvteeuvdetveduvdekhfffvddtgeeigfekleekteenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtr
 dhorhhgpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753907875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zk+mkPWarqLu/TrIpJKFkL9b1gN75ziGwTEaJT1ngJY=;
 b=aM5yRjI2ckANawKeIfg2roSD5tOMx2HGg9ASD2bPPqvZPYbbF6/VtBVT9Xt0AQku94zz5a
 BdYnuPXBEd16BjfzEGNEC71NoVgdfmfRhSBDsZWJ1bKnIoyLc1ATQdymnmowaXh3S1EzQ5
 pWMVLVpFrzirf2/nGZElPLYFw6Tq5pGUNsujWd4GPVvDGnxPJXZYYlV4RqspQt1qeIPPse
 Je5egGYVpOhPDWewJK6Yk6+Ax6Iv1GQhxJ0UYJTzxd1IigdlCCXlzWOHD1T/8oybtMgHZl
 0vuMs+Q9QVMlja9ME/KMPf/tndb1g2viH2kDqhMf+Bs5/9bHsPVxrSB69WdGvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aM5yRjI2
Subject: Re: [Buildroot] [PATCH v2 0/3] arch/loongarch: Fix a couple of
 toolchain options
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

Hello Jiaxun,

On Thu, 10 Jul 2025 11:41:55 +0100
Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:

> This series fixed a couple of toolchain options. many thanks to
> Julien and Thomas for reports and suggestions!

Thanks for those fixes. However, we still a considerable amount of
failures of GCC on loongarch64 in our autobuilders:

  https://autobuild.buildroot.net/?reason=%gcc%&arch=loongarch64

Normally, you should be receiving an e-mail every day with build
failures occurring on loongarch64, and as you've introduced support for
this architecture, we expect some level of support from your side to
resolve those architecture-specific issues. Could you have a look a
those build failures that are loongarch64 specific and provide some
fixes?

Thanks a lot for your support,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
