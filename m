Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55613C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20DF06071E;
	Sat, 19 Apr 2025 14:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fztiq_8fllHX; Sat, 19 Apr 2025 14:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 546E76076F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 546E76076F;
	Sat, 19 Apr 2025 14:38:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AECA222F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 957D440151
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwDXwxQ5pE-N for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:38:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 907E2400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 907E2400EA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 907E2400EA
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:38:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 060CA439ED;
 Sat, 19 Apr 2025 14:38:08 +0000 (UTC)
Date: Sat, 19 Apr 2025 16:38:07 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
Message-ID: <20250419163807.3bc05ff9@windsurf>
In-Reply-To: <20250416202408.3278761-1-giulio.benetti@benettiengineering.com>
References: <20250416202408.3278761-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeehvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvddvieefheelteehveduhffhteevjeelgffhieethedtkedvueduhfetvdevheffnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghuihhlughrohhothdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdpr
 hgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745073489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m19IElAN6QtChHxJxxlkDUJCm5A1+uK1Pn+N6PWSeNY=;
 b=Q82IjpOOSSnIRKxUyQWSsUxDQNRy1xdwoHVZuqxHnops7ahdVs/j6DXsY3p6/DHMSeaoVA
 Ioxwn2k8JseRqnw6Kf8z/Hp9pjGHa1kBj5oqEWpp/3O8CDCOU2+tDMveutWqPgdL6PQa1y
 HJq5gmycZNMizXS7ZmR5PjMZsUMUbA9XUweYBkIwAanKjcf4QGwuxsLT9v+1HOZ3YSkYmK
 pYx+jCDWvmH34FC2lFuNOlR5p5FKBlrxYH10zhUxaMNTwEhOAfSXrrNxxxoS1qIoWyg/J+
 9vAogCbUkM0wOox2gebWxrO1qvORyWeXA1mKM3N2KqtBTbxpcofyO5vVu0bOXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q82IjpOO
Subject: Re: [Buildroot] [PATCH] package/libfuse3: requires THREAD_NPTL
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

On Wed, 16 Apr 2025 22:24:08 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> With commit:
> https://github.com/libfuse/libfuse/commit/43ec53d6a16363184a95e59627c3f54d5568d8d1
> pthread_setname_np() has been used and it's part of NPTL, so let's add
> a dependency on BR2_TOOLCHAIN_HAS_THREADS_NPTL.
> 
> Fixes:
> https://autobuild.buildroot.org/results/71299a3db2660084ba362ff7c1b875bd0f71324a
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks for the patch. However, it looks like you forgot to propagate to
reverse dependencies of libfuse3.

Another option is to add some meson.build check for
pthread_setname_np() and only use it when available. Indeed, using this
function is really to give a nice thread name, it isn't strictly
necessary.

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
