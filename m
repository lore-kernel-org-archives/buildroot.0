Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C04C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE1E283E17;
	Sun, 30 Jan 2022 14:31:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LL6o5K27_s_A; Sun, 30 Jan 2022 14:31:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3141B83DFC;
	Sun, 30 Jan 2022 14:31:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F27B81BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF984408B0
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4z6lnCrOngc for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:31:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE6C440868
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:31:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6ED70240003;
 Sun, 30 Jan 2022 14:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643553057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TipMLrs15Q94lAw9LF8N20qUeUZ1hmwP/AsmVwX8us=;
 b=IxnLDL2v+8MuNUZKIYardhlGjVwpgUrBl6wxZjJP5VukCBEHbQF68H0+/UzDcS+uaGtVNW
 iyJ8qUvqWOBwgzQwFY63ivyk+d+opqWqYEcbhCc7N4q4uPSpO4uOa24O9ARZWk4h6tTKxI
 aT21Z43zpwUk0Ze+BlFheLyfFzfEHxmSbE329p8iqZxYSvcfXb5Ojd1HB7GgJgbZgwlWgO
 AKi6BIQ935QQoH/JKUgZiYPbSwEgpZTWmFNayWMa5I9+38wnzI5/DqTK5+bB+z8pu+jfaf
 1UvRpHfqwNeczYEwV7kvqORgPRfMbauXFH2G4rIySU0zip0WyyDvbyXOHgPCKg==
Date: Sun, 30 Jan 2022 15:30:56 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220130153056.312fb1b2@windsurf>
In-Reply-To: <20220129202751.3851776-1-james.hilliard1@gmail.com>
References: <20220129202751.3851776-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: add
 missing openssl build dependency
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

On Sat, 29 Jan 2022 13:27:51 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> build/temp.linux-x86_64-3.10/_openssl.c:575:10: fatal error: openssl/opensslv.h: No such file or directory
>   575 | #include <openssl/opensslv.h>
>       |          ^~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cryptography/python-cryptography.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to master with an extended commit log, especially pointing at
when the regression/issue was introduced.

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
