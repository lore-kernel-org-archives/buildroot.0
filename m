Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252CEC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF3CE419AD;
	Wed,  5 Feb 2025 11:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OdFjMGW4Wwt; Wed,  5 Feb 2025 11:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFA9D41A19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFA9D41A19;
	Wed,  5 Feb 2025 11:50:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97811CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 870C360747
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHRug-Bo5OTT for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:50:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7AF8960680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AF8960680
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AF8960680
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 552E4432BE;
 Wed,  5 Feb 2025 11:50:07 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:50:06 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
Message-ID: <20250205125006.7622ba97@windsurf>
In-Reply-To: <20250205101246.8430-1-peter@korsgaard.com>
References: <20250205101246.8430-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhheekleegleejieekvdeffeekjeegiefghefgffevtefgkeeigfelkeevvdekffenucffohhmrghinhepghhordguvghvpdhgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgurdgsvgdprhgtphhtthhopegthhhrihhsthhirghns
 egrphgvrhhtuhhrvgdruhhs
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738756207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmD+yjQXObkMsx8R6b549oAk9P9eYp4RWmaUMKwPuhU=;
 b=kiqorZiKg8WmNFWtcVdqutTQLv9l5MwdGX43cQ5hWXX2oNyDAaGgGF1MXPXiBf1GDvT+9J
 L8ljt0celDtzX6ApGZf1thva8tUUBp5pSh5gSxKih3awmpeTWw/SoqT6XKyhcKk5F3W2/0
 /6hVcyZyElndJLADJoHy2oxvcRpuYGRqNal9sunyBMcctHYPGrJVW3MsAQ3qInvshxwN0r
 GeXgc0W2QuLgbUryw3ll1lePvOaRt6u1Qx9wl697ROR2myk42xIjw0x1NHjkC7Hg1/+4tl
 HCXkbzw6bw8ZiZz0JMnuy5cMaJoNqr6UekMTxVggkL2zXEWMGp6H4eDMTdRGug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kiqorZiK
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.23.6
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

On Wed,  5 Feb 2025 11:12:45 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> go1.23.6 (released 2025-02-04) includes security fixes to the
> crypto/elliptic package, as well as bug fixes to the compiler and the go
> command.
> 
> https://go.dev/doc/devel/release#go1.23.6
> https://github.com/golang/go/issues?q=milestone%3AGo1.23.6+label%3ACherryPickApproved
> 
> While we are at it, drop the unused source tarball hash from the go-bin
> package.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/go/go-bin/go-bin.hash | 13 ++++++-------
>  package/go/go-src/go-src.hash |  2 +-
>  package/go/go.mk              |  2 +-
>  3 files changed, 8 insertions(+), 9 deletions(-)

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
