Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFE5C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E30EB419F7;
	Thu,  6 Oct 2022 19:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E30EB419F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzIW7mbItlUr; Thu,  6 Oct 2022 19:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C605941928;
	Thu,  6 Oct 2022 19:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C605941928
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2D91BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65881610BE
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65881610BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mwhQkgdfjhaN for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:36:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A792610A0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A792610A0
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:36:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D107040003;
 Thu,  6 Oct 2022 19:36:56 +0000 (UTC)
Date: Thu, 6 Oct 2022 21:36:56 +0200
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20221006213656.105db88e@windsurf>
In-Reply-To: <20221003144455.3173974-1-angelo@amarulasolutions.com>
References: <20221003144455.3173974-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665085017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19rbQgJvqwtpP8tPFcUUdDon3FoB9z/ER+e7okqTu0U=;
 b=W7qU+HMBdwPuoARRJqPefOnUc04QqQ3DXzUN/w69wE7Yjqyt34cxB+h4A5mBZRQgH60Spb
 NtCsKUTERZQpq+2AfhgAa3ixvS8MqVb0vSsXaTflhwEVaVS6s+lBJUuWY62CsctdlJGkEI
 GTBrFGQI1s9H9p2hVPlR58L7EMjq9PqQ/NCEqPo6GDGGqG/Y3fgpfIYWWFq3FGufbO2yNW
 IQzGuBkEgaxltEyGaNlTJ2oaD5ny99wociD/S7QHm4Rl3d+3ga2ndkQPr2wHlZqc6a1/hA
 s6LEF8kRQ9kTIG+yCZbrdsq5DGzCWMuNvLY3H8OTOdb+pVqjgnCRe8QFNKUADA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W7qU+HMB
Subject: Re: [Buildroot] [PATCH] package/fail2ban: bump to version 1.0.1
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

On Mon,  3 Oct 2022 16:44:55 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Removing also upstreamed patches.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  ...-vulnerability-unset-escape-variable.patch | 158 ------------------
>  ...with-error-in-fail2ban-setup-command.patch |  67 --------
>  package/fail2ban/fail2ban.hash                |   2 +-
>  package/fail2ban/fail2ban.mk                  |   2 +-
>  4 files changed, 2 insertions(+), 227 deletions(-)
>  delete mode 100644 package/fail2ban/0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
>  delete mode 100644 package/fail2ban/0002-fix-gh-3098-build-fails-with-error-in-fail2ban-setup-command.patch

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
