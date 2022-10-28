Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC63DC38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 06:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A5C78175B;
	Fri, 28 Oct 2022 06:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A5C78175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mr8hqMwOfRQ; Fri, 28 Oct 2022 06:45:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9303B81499;
	Fri, 28 Oct 2022 06:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9303B81499
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 614521BF9AC
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A8AB401B2
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 06:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A8AB401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ys-A7JCnT6Nq for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 06:45:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14B4440186
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14B4440186
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 06:45:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 875DEE0003;
 Fri, 28 Oct 2022 06:45:26 +0000 (UTC)
Date: Fri, 28 Oct 2022 08:45:25 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221028084525.2cb0b2a0@windsurf>
In-Reply-To: <0021c4e4fdf0d97591acc6e0bde64c34b46997ad.1666867037.git.baruch@tkos.co.il>
References: <0021c4e4fdf0d97591acc6e0bde64c34b46997ad.1666867037.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666939527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m8djX2CCwA2FCmXbemRk4QJgMcxALvw/kfHFWcCTh0s=;
 b=hnRp2tkPuzI539WDI4uQqkOHfTWm21RCCTkOeEElTBMDPL2/4jFb5csVnrPIHEEN4DxsOo
 OycrZcCfJqt2AhO6TWNV9gL+xORSy1uSy+oA8YVYDe55rzxCO0w6S8Vw6y1fKvG+alp7FU
 Huy6GWhoI5tqKBNpqcOPbCV2eD6pAFNlVUq42Ljnn7oXJWxo7BODmmwHJKj//bdgHEJ3BO
 mcpnEwqfuXUaOy1Mojp03QBFDbuS9HSrVDuLIwY/S+6/XAlYBIHdVKQ9vFjwvXwVdJP+yN
 QMVLebDivLZP29h5f3t2egFEueJK1vIftgHGSPhyPqu7Ceq044ZY2dyhwSu6Yg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hnRp2tkP
Subject: Re: [Buildroot] [PATCH] libcurl: security bump to version 7.86.0
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
Cc: buildroot@busybox.net, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Oct 2022 13:37:17 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Version 7.85.0 fixes CVE-2022-35252: When curl retrieves and parses
> cookies from an HTTP(S) server, it accepts cookies using control codes
> (byte values below 32). When cookies that contain such control codes are
> later sent back to an HTTP(S) server, it might make the server return a
> 400 response. Effectively allowing a "sister site" to deny service to
> siblings.
> 
> Drop upstream patches and autoreconf.
> 
> Cc: Matt Weber <matthew.weber@collins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...de-sched-h-if-available-to-fix-build.patch | 30 --------
>  ...for-the-stdatomic.h-header-in-config.patch | 70 -------------------
>  package/libcurl/libcurl.hash                  |  2 +-
>  package/libcurl/libcurl.mk                    |  4 +-
>  4 files changed, 2 insertions(+), 104 deletions(-)
>  delete mode 100644 package/libcurl/0001-easy_lock-h-include-sched-h-if-available-to-fix-build.patch
>  delete mode 100644 package/libcurl/0002-configure-check-for-the-stdatomic.h-header-in-config.patch

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
