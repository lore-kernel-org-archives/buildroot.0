Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AADEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96D2C421A2;
	Fri, 28 Jul 2023 20:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96D2C421A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nP_5o6MYE2b7; Fri, 28 Jul 2023 20:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2AA742172;
	Fri, 28 Jul 2023 20:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2AA742172
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B11421BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 973288451B
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 973288451B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KU9GL-YuNp8Y for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:11:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77E2484519
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77E2484519
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A0D71C0004;
 Fri, 28 Jul 2023 20:11:00 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:10:59 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230728221059.37f9e820@windsurf>
In-Reply-To: <20230724193753.8490-1-ju.o@free.fr>
References: <20230724193753.8490-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690575061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EqgYs9MqYfO0g72H2Ad3+ffSwG4suORz4H4KxZQPGYs=;
 b=A0JpZlmyVahwVNhRoJYmwzvgZgKXO3WvJ3khzxYX+bc78Tfc8zYDdJwJOgooUsR8+F57v6
 tHCDf7IfuTW3N6+KXO2tQ56gAOu0UF++1ywqgnybKNjEzv4+1Q6Z+waz0JLjs3qcSXz/D9
 0ugD+4BJ47aN9xr99FmIZSz2qAYT+rim94iO/b4TT8/Xv3/dU28oXa+1cVcWQFl4aR+TjQ
 Tp1jLL9pSKDaR6oQMTrMd1WFws+hT3+nl00Ge84aI4fMayhFswSOC0tIpLdMrYVa6qHr7l
 SAb05tEZ/V2u8pCKStNYY3zw8ItbKYxpesFI4n/M4aulr8vR9slc+HQHZfOZkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A0JpZlmy
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gnupg: bump to version
 0.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Jul 2023 21:37:53 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/vsajip/python-gnupg/releases/tag/0.5.1
> 
> This commit also adds a comment about the archive being checked with the
> PGP signature published by the package author.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on master branch at commit f359791 with commands:

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
