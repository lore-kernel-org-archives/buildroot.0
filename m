Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B7BC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2BE64183C;
	Wed, 21 Sep 2022 20:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2BE64183C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VllGzPpF7EKA; Wed, 21 Sep 2022 20:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E352410C5;
	Wed, 21 Sep 2022 20:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E352410C5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9542A1BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 613CA410C4
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 613CA410C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Iy07mASqZ_j for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:09:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3391E410C3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3391E410C3
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:09:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 927D0FF808;
 Wed, 21 Sep 2022 20:09:39 +0000 (UTC)
Date: Wed, 21 Sep 2022 22:09:38 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220921220938.1b78ddeb@windsurf>
In-Reply-To: <20220917215300.1330070-1-james.hilliard1@gmail.com>
References: <20220917215300.1330070-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663790980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxu+yCv1wPSvFZ9LnN21v5BVPJvR4USDhUDQ4K5T4Io=;
 b=Dd6xjOawhVCwwhEElczOMjujSt90gPTs3gvggKNqLCDvwcdbkt82TzrQRGQZwy+AK7OvBh
 8NuWhUDtBfVb60VermWzhwie8sisHNRDEzLTpa5IHco+NKuwI0BPeMA+joGCfsnLa7AYpG
 Sw7lM4SPN4F9W4nqXALOSwg9IE81CQ2057k+3RRvFIK329KbXUtnPJxN/iRxXLwzZvnlj1
 uHF6ssD5LQllW9ysULmTI62qxkNXjJfvHX1PSUFvAXrwjzQckcMgGpJ/n0AAqieJ3bYjcH
 rGpLJshG1y8LfMvcAJg4QXIyXeR9rdSkbLLkLi6kNjO5RVoG572BA64mMjjSDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dd6xjOaw
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.21.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Sep 2022 15:53:00 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patches which are now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../wayland/0001-build-set-c_std-c99.patch    |  34 ------
>  ...on-t-rely-on-implicit-GNU-extensions.patch | 108 ------------------
>  package/wayland/wayland.hash                  |   6 +-
>  package/wayland/wayland.mk                    |   4 +-
>  4 files changed, 5 insertions(+), 147 deletions(-)
>  delete mode 100644 package/wayland/0001-build-set-c_std-c99.patch
>  delete mode 100644 package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch

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
