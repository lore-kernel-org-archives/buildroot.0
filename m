Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C078C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 21:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB7EA40B8B;
	Tue, 26 Apr 2022 21:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sfjQJtMOj4z5; Tue, 26 Apr 2022 21:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4BF940B86;
	Tue, 26 Apr 2022 21:54:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C14051BF3A6
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFDF160A71
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5z2tdYY5S6lj for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 21:54:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D7E4606F9
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 21:54:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7836DC0002;
 Tue, 26 Apr 2022 21:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651010057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1sg55RRXGoDUXF9HiTCXTawLk2v3iXpATyUw0baXBeQ=;
 b=OOZx8HH/H4njvahOPzkEoK5guNLMIIIpAajV+As2ec6ljXOxTh6kZXGqlmp4t9e5mLpG36
 /pRPKQ9z3d3mp5gsQNKDSk4+b25mzx+dmPKFhSbo/QfHLtgT8t3ujtwLMTiZBKUw34L4e7
 W4ruZL4L1KCSdMBxpYM7CHjlpaPzn1vBCyAT3KtV+468zCmzVXpJ6AAdMrtshAr3TeW+DW
 7vMVx6iRJhFZZjYvsTpdi2cDrvkhLPb2zzQDZB9792/rP3Zhmyz3J4fPQjfnVwvNPolnZD
 ZVlhp5amcbw8vbUJd62gv67EBCdNeFGMHHhmNnmZJNmiY0otFSFZanRwMljQEA==
Date: Tue, 26 Apr 2022 23:54:16 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220426235416.3906ebfb@windsurf>
In-Reply-To: <20220426210128.127336-1-angelo@amarulasolutions.com>
References: <20220426210128.127336-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/htpdate: bump to version 1.3.4
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

On Tue, 26 Apr 2022 23:01:28 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Removing also the upstreamed patch.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  ...BS-to-be-configured-from-environment.patch | 37 -------------------
>  package/htpdate/htpdate.hash                  |  2 +-
>  package/htpdate/htpdate.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 39 deletions(-)
>  delete mode 100644 package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch

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
