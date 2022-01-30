Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BF4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 22:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CAAE831FB;
	Sun, 30 Jan 2022 22:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 34PPK4BC8EK1; Sun, 30 Jan 2022 22:45:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8877782F4A;
	Sun, 30 Jan 2022 22:44:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29DF91BF4DA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1892B82F4A
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g2-pEwbwYS7Y for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 22:44:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A858582951
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 22:44:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 644F840002;
 Sun, 30 Jan 2022 22:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643582686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8vX0uallHCEE0t4L9bb+m1ujDxumiwE0+hLtVecx+ms=;
 b=AlJdp3BfJAfS/LRPQGxMhg6Nprku3SC1+JsjmiY0POB6/3IsfBHvc/UwCcSBsNnLqp2r0c
 6Pmuzyt5Q3VNszSmT0RP1vBF6CQrO1WARpEHHH/+GqiOjHV1Gr0bpVwkUDr5AM0FtjBmFo
 DKJUszV0cq71Qy7TgokukN4mqQqR2q2DiYUYyXelKWmGr7xzHyOMuLYxQQ+fNj1RMprkFS
 dYS0q2TBcY51q/YYv8dkMPRe/QBw5GAjXmyPworCwWRWkxK3l9HvCgJnXDepr0lrV0Kl2a
 OtMsRz4zDEAmZNSwoCWrLLIhdG7uoD/G5j0xeJWWOjdb10SscEW0t19DAxDw6w==
Date: Sun, 30 Jan 2022 23:44:45 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220130234445.7ec336b4@windsurf>
In-Reply-To: <20220130222317.2830755-1-james.hilliard1@gmail.com>
References: <20220130222317.2830755-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/connman: bump to version 1.41
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
Cc: Martin Bark <martin@barkynet.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jan 2022 15:23:17 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/connman/connman.hash | 2 +-
>  package/connman/connman.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
