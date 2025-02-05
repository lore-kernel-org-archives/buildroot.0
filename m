Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260C6C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 06:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E582060F4B;
	Wed,  5 Feb 2025 06:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8y3q3h72Zgx; Wed,  5 Feb 2025 06:57:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0212861006
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0212861006;
	Wed,  5 Feb 2025 06:57:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3CE9CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 06:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7BA461002
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 06:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqXK8YQb7v6M for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 06:57:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89E1560F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89E1560F4B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89E1560F4B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 06:57:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86D4044378;
 Wed,  5 Feb 2025 06:57:06 +0000 (UTC)
Date: Wed, 5 Feb 2025 07:57:05 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <20250205075705.207a3932@windsurf>
In-Reply-To: <20250205020143.72649-2-vjardin@free.fr>
References: <20250205020143.72649-1-vjardin@free.fr>
 <20250205020143.72649-2-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepudelgedrjeekrddvuddurddvvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudelgedrjeekrddvuddurddvvddtpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepvhhjrghrughinhesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738738626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jLMFFUSmM+FeHe4HugAZJlJCglS9I7vpUfLiSsOflM=;
 b=KyAEIMzkaZeR+ikG/56knP9+3o/4h96u4HlSJ5mbT1seMX1KBshlSTDiA2ES/m6IHvCslB
 hB9P1QqfPtYtkVIoZt2/gooc8/j3Y7dVqds8xlcQOGlDJjCmV/PN4mcyG2AfojmN1cxHxa
 nsIUe7K+QyDmKAk8ELETL5leujTZUyAgJNijWIEH+kAm28DO7WaVEihQw+09y2lUMSzK/w
 sj6BUcqCUmZZJLPYumVE3uyrVy2DsI83pycsEdaEhB2OKu3AWVOatDupttKT4lH8s/HTMW
 T92aYvPep3Fk2LAWx+RJspjI97eJwD20TVTehi8ES4MdW5s+zruJO9/3j/WWlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KyAEIMzk
Subject: Re: [Buildroot] [PATCH v1 1/1] package/binutils: bump to 2.44
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  5 Feb 2025 03:01:43 +0100
Vincent Jardin <vjardin@free.fr> wrote:

> From the commit a42041575e5, it seem that the intend was 2.44
> There is no hash for the version 2.43, but 2.43.1
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  package/binutils/binutils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied after fixing the change to update to 2.43.1, and improving the
commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
