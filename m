Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C2DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B83BF812F1;
	Sun,  6 Feb 2022 10:24:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NonQyaCO9344; Sun,  6 Feb 2022 10:24:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1594D81295;
	Sun,  6 Feb 2022 10:24:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 261BE1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 151F881295
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7D2nxHfxFR5o for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:24:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03E5C81286
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:24:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C8DB9240002;
 Sun,  6 Feb 2022 10:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644143054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o0ucGsKhzg4GPNyGEbWZ1yEr1qjOkVGLCMlu+M4lc7M=;
 b=ghnmVMfntaW2e5KjrdOfJhH84OmCzt/6uEeYVxnuigORrdglJth09eBXuoa07LN65FHD7p
 37ZByd0slLRDUhS2Jry7qMtiifNdpW2/ZGGfsfq7rQs5K1rp/qYHBZiT8mPY3xyLMMyhrm
 4my/sazJfNY3F7OHPnd3VimBWQXQsArUJV+cY+sH+45ZdVNFLARQcBTiX6+lGeaPFoG3k8
 /GgJx+sNDTuOw5dN2AaMrq54sHnSptejP2QyaByC1dVjyEcrN1qRuaX92aACDRf4bfYwV9
 miKJH7kHl3WglpMrm2U7gPNU4xTTCQ9ISlGm5nBsDYaZmGGn20BBa6K7lajRUg==
Date: Sun, 6 Feb 2022 11:24:13 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220206112413.628ee1b1@windsurf>
In-Reply-To: <20220203231432.748145-1-fontaine.fabrice@gmail.com>
References: <20220203231432.748145-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/netcat-openbsd: bump to version
 1.218
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

On Fri,  4 Feb 2022 00:14:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use official tarball so NETCAT_OPENBSD_VERSION will match what is
>   returned by https://release-monitoring.org
> - Use netcat.c as the license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/netcat-openbsd/netcat-openbsd.hash | 9 ++++++---
>  package/netcat-openbsd/netcat-openbsd.mk   | 9 +++++----
>  2 files changed, 11 insertions(+), 7 deletions(-)

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
