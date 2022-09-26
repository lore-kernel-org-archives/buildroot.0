Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0001C07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A221825B9;
	Mon, 26 Sep 2022 12:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A221825B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ElGeLTtXHSk; Mon, 26 Sep 2022 12:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B449B824F4;
	Mon, 26 Sep 2022 12:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B449B824F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E1BB1BF3B0
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F026E60F71
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F026E60F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1eHGwauimma for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:07:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2EE160F6F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2EE160F6F
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:07:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C864DE0008;
 Mon, 26 Sep 2022 12:07:19 +0000 (UTC)
Date: Mon, 26 Sep 2022 14:07:18 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220926140718.660a06fa@windsurf>
In-Reply-To: <20220925070826.11210-1-bernd.kuhls@t-online.de>
References: <20220925070826.11210-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664194040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gnnIZnLnE2H1mO+s0J00i1mhwydsQAgpJ4Ef2ZDPYoU=;
 b=VyRkgKo1Z+27LLAJ8GwwYH/+7bL7EfSRyBncGnR5873zvDuelGFNW5T/5S+3zvkITXwzuZ
 lNq+iItj/ms7nUWVoxVopGAOBLNpwuKDodtGvxDXgssXUIoJqAdgMpt8yGofG6uNolbqGP
 b/DAqT+drUUUroAnG7rivLVbDQRe9x5jUPm9nv+ITStKY5HWNW/GCpxMkfpWkLdNjhMyMN
 /TessbkMwuWC8CDudIv7CeyqrSn7mC2YFGZj5QFsKHC9x6BpWjQ05jgNDw484ndqITqsFk
 Ym9kGRHRIRdxNpzNIrIFt0tNb3oUjmn35cWssqQ3OL33xbn3S3qoh6p4/I1KKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VyRkgKo1
Subject: Re: [Buildroot] [PATCH 1/7] package/kodi-pvr-iptvsimple: bump
 version to 19.2.2-Matrix
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Sep 2022 09:08:20 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

All 7 patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
