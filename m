Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B797C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 18:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DB09414A2;
	Mon, 30 May 2022 18:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JIGBl1RTC7G9; Mon, 30 May 2022 18:54:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB94A410D2;
	Mon, 30 May 2022 18:54:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 961001BF38A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 18:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84B6084068
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 18:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vm9LVZ_bWV58 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 18:54:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 525CA83F78
 for <buildroot@busybox.net>; Mon, 30 May 2022 18:54:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DE215C0008;
 Mon, 30 May 2022 18:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653936855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XqS+JfBDZXlwk1pUMJ5TW/jIfLLFk54a8WvOnD0ygJ0=;
 b=Lfv159v0ouUPUGm5YtSYjyzgUCe7NsmWWVzjpkARDQ6wN86B9rL9w6nmpsBQwkxYnmBLkZ
 DG4S5P5vTuHkYEK2Yk7FRU4wLOxuPBHj77NTiKq3Kk3swvaHALTQEbnywEVcDRbUKStCuQ
 kvaZbS6CSLbGAqS8VKrjVxOdAg6836Y2VYmBRMt3redqkytwhUj774GSGYkrOweOsTzl8J
 nyg03qLBIOtsnQ1viopTQ2KixpXjQrCSZMxpZqjkDcI0bKfS6S3wvwMIUZWdmnNUkItUpr
 lJQjYJbBo6B+yvOrTl9A1I4hfTL9zmJmu414aCngOD0iCKkxgQ41FguLgzXdWA==
Date: Mon, 30 May 2022 20:54:13 +0200
To: Michael Vetter <jubalh@iodoru.org>
Message-ID: <20220530205413.1866c624@windsurf>
In-Reply-To: <20220530132707.1672-1-jubalh@iodoru.org>
References: <20220530132707.1672-1-jubalh@iodoru.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] Update libstrophe to 0.12.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Mon, 30 May 2022 15:27:07 +0200
Michael Vetter <jubalh@iodoru.org> wrote:

> Update libstrophe to 0.12.0
> And fix the build with: libstrophe/0001-fix-ssize_t.patch
> Discussion upstream at: https://github.com/strophe/libstrophe/pull/207
> 
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>
> ---
>  package/libstrophe/0001-fix-ssize_t.patch | 46 +++++++++++++++++++++++
>  package/libstrophe/libstrophe.hash        |  2 +-
>  package/libstrophe/libstrophe.mk          |  2 +-
>  3 files changed, 48 insertions(+), 2 deletions(-)
>  create mode 100644 package/libstrophe/0001-fix-ssize_t.patch

Thanks for your patch, which I have applied to the next branch.
However, a few things had to be fixed.

 - The commit title should have been "package/libstrophe: bump to
   version 0.12.0"

 - The patch in package/libstrophe/ should have had your Signed-off-by
   line

 - The patch in package/libstrophe/ should have contained the upstream
   status (instead of having it in the commit log)

I fixed those details when applying. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
