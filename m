Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24712ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCA73812BE;
	Sun, 30 Oct 2022 21:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCA73812BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRBccvGf05VT; Sun, 30 Oct 2022 21:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3D00812AC;
	Sun, 30 Oct 2022 21:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3D00812AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE6FD1BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8801401DA
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8801401DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9HmAmgta94O for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:25:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD98C4012F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD98C4012F
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:25:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B75A6240004;
 Sun, 30 Oct 2022 21:25:08 +0000 (UTC)
Date: Sun, 30 Oct 2022 22:25:07 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221030222507.413e4c80@windsurf>
In-Reply-To: <20221012160025.45566-1-giulio.benetti@benettiengineering.com>
References: <20221012160025.45566-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667165109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XMuhhzNB2ZwDCIBwv5Ft1jZHGn4rY3kZMbCl4xK4UZ4=;
 b=fZezInKSwNgMo4zJHUmsqesdQmHeze5bgndfyWOUE3X2E7F1RY0cUpKgEmSZB9aVsWliKK
 /yIdtvjBJOkl9WUTEA9AUde0tyP4R8UJoiVIGKdijz8RrJ8D7niv1Zed80QpGLKBPv1GQM
 XKZjPiN3fGsJtp6rSRkc5TxqT6HILXqsRPniOMRVt86XMMrWbTt0iSJqDQcT1EKWBnr+HX
 UfQXuBtQ7a38gN4SlEiR6uEyxH7JQn6Ls1HpounIGPzces715eOzzkunqU1A5Afs38eEjz
 Z+gSCLbqtkf8o9MY6AhT4ztQ7OlibETlT6fMMyws9m4d4W7oHtCyKyCwXZJL0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fZezInKS
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: bump
 version to fix building with Linux 6.0.0
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

On Wed, 12 Oct 2022 18:00:25 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash | 2 +-
>  package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk   | 2 +-
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
