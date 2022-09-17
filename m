Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40434C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E056884316;
	Sat, 17 Sep 2022 09:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E056884316
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fiOHM2hKfB1m; Sat, 17 Sep 2022 09:36:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FDBC84306;
	Sat, 17 Sep 2022 09:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FDBC84306
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6107A1BF82D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F05660BC7
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F05660BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id es7AWHSxk_xY for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:35:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCAAC60B9E
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCAAC60B9E
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:35:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 99B34100003;
 Sat, 17 Sep 2022 09:35:55 +0000 (UTC)
Date: Sat, 17 Sep 2022 11:35:53 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220917113553.6a5c4ca1@windsurf>
In-Reply-To: <20220911213159.179075-1-fontaine.fabrice@gmail.com>
References: <20220911213159.179075-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663407356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2sOruZ8bULojSY1RX6SeqWyMyYpmG1LbR38SNCUoi2A=;
 b=WaeDWhp0FIaEUEjD0az0m+sqU/CD6BXDghU0UOZusPzDKDNbWq49fpjbRdBu7chUNrHXNW
 /RUJhXVrfaUX/xU59eWDQPJKbuAXhtqVOQU8TiqCX/zvF5TJPkCrxXZLVU35x73xJLC32G
 YFU6H6/hc0zwQtsIx22d0qCqex85/1PjOdd5t82j22DytW/6KIjhLSI+nayaqylc74Cs2I
 KX1OkHHKFSakS7tdJVbddyskdRemK4boaynPWruRXhAmlIx5ftD7+k/woOseEL8rVKmJLJ
 nea2MmHLBZg+PavRN0DEUQi9DiZeh0GZ+AZ+ezgAMf3hcz1g+Qqs8cZAMr1BXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WaeDWhp0
Subject: Re: [Buildroot] [PATCH 1/1] package/libtasn1: bump to version 4.19.0
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

On Sun, 11 Sep 2022 23:31:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version) and so autoreconf
> 
> https://gitlab.com/gnutls/libtasn1/-/blob/v4.19.0/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...fuzz-Makefile.am-do-not-force-static.patch | 35 -------------------
>  package/libtasn1/libtasn1.hash                |  4 +--
>  package/libtasn1/libtasn1.mk                  |  5 +--
>  3 files changed, 3 insertions(+), 41 deletions(-)
>  delete mode 100644 package/libtasn1/0001-fuzz-Makefile.am-do-not-force-static.patch

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
