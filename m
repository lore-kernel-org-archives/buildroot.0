Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF967C636D4
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9003C61188;
	Fri, 10 Feb 2023 22:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9003C61188
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vj3Y5-VY9QaN; Fri, 10 Feb 2023 22:39:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC0AD606FF;
	Fri, 10 Feb 2023 22:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC0AD606FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 927911BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C52D40AF7
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C52D40AF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVk7UoVWOciX for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:39:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B417401B2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B417401B2
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:38:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 55B8B1BF203;
 Fri, 10 Feb 2023 22:38:58 +0000 (UTC)
Date: Fri, 10 Feb 2023 23:38:57 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20230210233857.1d8ba4a5@windsurf>
In-Reply-To: <20230210184704.3381562-1-troglobit@gmail.com>
References: <20230210184704.3381562-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676068738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IvlkqoMz/H0Rs1N5ErHJg9kr5g9ubQN/iLoH8p4rMR0=;
 b=dkRZJYVryxccsumBcwYiHMrtMxqqfp4YjSj7B/u/CRnIAWfo8/ZNULu8Jx6plV99TezMmT
 b0nC4VpYN5l5Z9bczP4w0axwkSyf6ClH3E8WZSKUveUj4QnFygWdQDpGFywiqI8aekG44X
 FICmYCwEnRN29ybPQD2c8oZcKgP5rS/EgRIvA5Zemg3B+HtNOBN8lYLPyr3Rgd5AaIgw40
 yOt+rT+cOH7jqq/dleceUVo3FVeoV53jgIdW2PMGlwrYU7WL0cKPbkBjGrk4tIHw0Jp37w
 1yhrlqZy/bJJOirkeryMot4zwItouPNJldd7lSj5npHTOgBryEO0cgCQnaEFUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dkRZJYVr
Subject: Re: [Buildroot] [PATCH 1/1] package/ssdp-responder;
 drop systemd unit installation, not needed
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

On Fri, 10 Feb 2023 19:47:04 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> When systemd is enabled the ssdp-responder build system already installs
> the unit file, with the correct name, so we can safely drop this.
> 
> This fixes the recurring autobuilder problems that cropped up the last
> week+ or so after fixing the spelling error in 6e0ba6b.
> 
>  - http://autobuild.buildroot.net/results/f6912d6f79155c5d12811beeb6cb43860e37e7e7
>  - http://autobuild.buildroot.net/results/7ee4ed26de7e45b52a9f6f36b839e578d2319247
>  - http://autobuild.buildroot.net/results/33d9c10ea58a7cd3b3e2ed75d586007a92ccdaf0
>  - http://autobuild.buildroot.net/results/f1238081fc94e3004aebb8e849fdd567a92a2d39
>  - http://autobuild.buildroot.net/results/f7f2cf790f51e6224dca258c52bd31d21d621074
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/ssdp-responder/ssdp-responder.mk | 5 -----
>  1 file changed, 5 deletions(-)

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
