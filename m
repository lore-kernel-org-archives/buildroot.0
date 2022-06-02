Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527E2C433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 14:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1CAA418C7;
	Thu,  2 Jun 2022 14:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNEfh7uhNhAJ; Thu,  2 Jun 2022 14:10:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D40D5418B7;
	Thu,  2 Jun 2022 14:10:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C93971BF3D6
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B89246100A
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 14:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id peiovNHb-s-c for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 14:10:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B593E61003
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 14:10:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9151AE0003;
 Thu,  2 Jun 2022 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654179031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fq1+uFbRAgoVHcqU6+AOodle88QPJ6lP+ZcCDGzkoiM=;
 b=XSYUlhOwF65j4EdDfy7bu5/sbduiH7Dt3+0rv74AycLmMHiDG9bs5KYmx12+isSd9dDAiJ
 ZjEz8sNvl3TzDwF1lRyyTNfVpYT4ZMnfcBUjCku7/jwl/RvM6WIESkUlntG+n7VXCre8XK
 XI1pcEkCgXrTlTJioIjE1EFOn2FDIwcemkFkB30eXfc8cI8k8OhJ0WlB9qw3G+HZfqOY/E
 jt7SSs3jO+//BjTTTrvL31+ApzASiDM8hWt4pRFI1CXNbHp+YVzNiqPGIgufFUJgDxD6Ag
 isO649cFoVtnxmxXGsn9+tXjzCxH9H1K/g1nsq0sV9K71U2gNTSHmSQl1FfZhw==
Date: Thu, 2 Jun 2022 16:10:30 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220602161030.7960cd4c@windsurf>
In-Reply-To: <20220529002356.1275791-1-giulio.benetti@benettiengineering.com>
References: <20220529002356.1275791-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libnspr: bump to version 4.34
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

On Sun, 29 May 2022 02:23:56 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Unfortunately local patch is still pending upstream. I've just pinged
> them:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1765100
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnspr/libnspr.hash | 4 ++--
>  package/libnspr/libnspr.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
