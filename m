Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838D6C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25B5D82C3B;
	Wed,  1 Jun 2022 21:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXegTbJSJRTN; Wed,  1 Jun 2022 21:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4774D81CD0;
	Wed,  1 Jun 2022 21:08:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58BBA1BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4895481CD0
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uapVnaHD6YWT for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:08:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D5B681CAD
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:08:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 328531BF207;
 Wed,  1 Jun 2022 21:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654117706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=excmirBw6nX8RcyAxqlDmlC/VvxKWxNg9HRkAQIsS8k=;
 b=Kr/HZFeOi5H9x6U8MqrNpzSGmF9rr+IKOqeF4u+5UOQjugZXM6uTdKFiAiagoL+PlFBZ61
 9pUtven+/RJ7YE3GVCZ7qC9sLm7eEwSJiYnPm034RESgvy6938NF0DmLNmIdffEy3G7uaV
 d9cG5r6fUbpMMhNFX+tOIAxpa3Xa8OpY6U/chFymNzxU4qUQUByT3OZyBMW8BqAihvsvFQ
 xubl9hKc7l8f0Kl/QQdhOUzZLPoQCN38o1JTEZ3IuHR7adGsf9RmQlH/ACGMQERLAfOvwN
 Jdk/FY3B/ONDAyMP4mBHUHqynwxC5Ebz3cGk8mOqsY7YY81pP6he12oWbR8QZA==
Date: Wed, 1 Jun 2022 23:08:25 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220601230825.194b1ee4@windsurf>
In-Reply-To: <20220531204034.1756510-1-giulio.benetti@benettiengineering.com>
References: <20220531204034.1756510-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [for-next PATCH] package/harfbuzz: bump to version
 4.3.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 May 2022 22:40:34 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/harfbuzz/harfbuzz.hash | 2 +-
>  package/harfbuzz/harfbuzz.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
