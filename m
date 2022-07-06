Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34ECC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 22:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD5161011;
	Wed,  6 Jul 2022 22:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BD5161011
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBncODD5oQqJ; Wed,  6 Jul 2022 22:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F36560B38;
	Wed,  6 Jul 2022 22:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F36560B38
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7C9D1BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 22:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FBF560B38
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 22:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FBF560B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQsfcTjIUM1F for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 22:01:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A1EA605A5
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A1EA605A5
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 22:01:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F0F2BC0002;
 Wed,  6 Jul 2022 22:01:04 +0000 (UTC)
Date: Thu, 7 Jul 2022 00:01:04 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220707000104.72a06aec@windsurf>
In-Reply-To: <20220624000216.85808-1-giulio.benetti@benettiengineering.com>
References: <20220624000216.85808-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657144865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wgInECgCj2vsId5lRxuttH2EFiwQKdVsKJXzuen98c=;
 b=Xz1UDV8nZGgAqXqZQG4JwbTWPZCmFG2mhArpHTHjvpkojc11RsYmodEV+t6jVNULlPYDlZ
 cr633NXsSzaXVWqa4heTMdL8vq5absDeEmYxiNy7/WQ0PLMNdqXa8rXn7U2JPHHWJlWR+l
 urdvl0LjHnkrM1p1oUrSi0pZz3qZ3mJBfme2NeyG49eX+N0o2tDcU6LzOjF6J8IPmJsoEY
 aVfqeQEdCaYwwBGXNVRKmdQ54DhNMSfnnzeKHUBGBtG8A1vrayAZILSplr2woZl8l9vNnY
 5NuqJjM+TWAxCfYCk67CzZb4QHzWSJo3b4t/8leF2pj9QD0N5bEmHQ45zTstyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xz1UDV8n
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.80
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 24 Jun 2022 02:02:16 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Let's drop local patch that has been upstreamed:
> https://hg.mozilla.org/projects/nss/rev/190801f7f1fb25490098487abacb1fd2ca5ef1e8
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...36-Fix-build-failure-on-Aarch64-host.patch | 37 -------------------
>  package/libnss/libnss.hash                    |  4 +-
>  package/libnss/libnss.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 40 deletions(-)
>  delete mode 100644 package/libnss/0001-Bug-1771036-Fix-build-failure-on-Aarch64-host.patch

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
