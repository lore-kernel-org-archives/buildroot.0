Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B74C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 09:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E819041775;
	Mon,  5 Feb 2024 09:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E819041775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3SFlZhXthGc; Mon,  5 Feb 2024 09:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 464244176D;
	Mon,  5 Feb 2024 09:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 464244176D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CDD31BF40B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52B7F40A06
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 09:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52B7F40A06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xzzUUgKdHPar for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 09:49:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3AF640204
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 09:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3AF640204
Received: by mail.gandi.net (Postfix) with ESMTPSA id C96C06000C;
 Mon,  5 Feb 2024 09:49:24 +0000 (UTC)
Date: Mon, 5 Feb 2024 10:49:24 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205104924.7b831670@windsurf>
In-Reply-To: <20240131212724.2227850-1-fontaine.fabrice@gmail.com>
References: <20240131212724.2227850-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707126565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F2U85XX5mQzik7MEH+KYjFvZ4psb10s/elCi1tNMYm8=;
 b=mRJZm5MjoEN591Hl4OqCfFzJ3S95QXOr1OxjKk8KMHDIuWZRMQgUBA1Hwp5ZXGoqb73RdA
 2FvsvZqdyzsXALqV3Q3kPH0rBYH0clE7bjY4ZleZFSbyaZGP0i2g1MemwRs+sheSA0HJOW
 wcM3MWv+sBKS0VKp3N9e7lmIDSN/rIcAlIgmPBdKMGJkcZLuWKkhb4C71uck71/UkEFgfZ
 wOL3hWx0YB3exAHRcNo+cBiM8q60J+bqTZgh421Mr9IWHxAc9JFqkREkXw2loyrNvZN6Yz
 54PH2pWkDKX/l+y7+bKQtBz+Y76atHQcVWVdg4TaItyZ3/swAnx1Cpt4baQ0hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mRJZm5Mj
Subject: Re: [Buildroot] [PATCH 1/1] packge/linux-pam: bump to version 1.6.0
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

On Wed, 31 Jan 2024 22:27:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patches (already in version)
> 
> https://github.com/linux-pam/linux-pam/releases/tag/v1.6.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-examples-tty_conv-fix-build-on-musl.patch | 40 -------------------
>  ...Fix-build-if-crypt_r-isn-t-available.patch | 37 -----------------
>  package/linux-pam/linux-pam.hash              |  4 +-
>  package/linux-pam/linux-pam.mk                |  2 +-
>  4 files changed, 3 insertions(+), 80 deletions(-)
>  delete mode 100644 package/linux-pam/0001-examples-tty_conv-fix-build-on-musl.patch
>  delete mode 100644 package/linux-pam/0002-Fix-build-if-crypt_r-isn-t-available.patch

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
