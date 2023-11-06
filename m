Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B19FC4167B
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FE2E612A6;
	Mon,  6 Nov 2023 19:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FE2E612A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id teAriiEQY-tA; Mon,  6 Nov 2023 19:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CD116125C;
	Mon,  6 Nov 2023 19:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD116125C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92CD71BF29F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A93F41AE0
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A93F41AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ykSrbl1MVLuM for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:40:46 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63DC341DE1
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63DC341DE1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A0E8C0008;
 Mon,  6 Nov 2023 19:40:44 +0000 (UTC)
Date: Mon, 6 Nov 2023 20:40:43 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106204043.58dbe7ea@windsurf>
In-Reply-To: <20231105214627.90376-1-fontaine.fabrice@gmail.com>
References: <20231105214627.90376-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699299644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+3jryKdENeBP+H/Tci7b+e+BDrS+xYig0t5pIWYXVQ=;
 b=LQTE1c3Sadkb/HUejWXZDUe8ouKePzkY+j3/9bisXQf/I6SCs9pmh3P2P5/8HtCjxNYVPn
 dTUZVUN9U4/MOMLUftmSnpOnXOd/8mFz6OcHhycC2+ggxpOJ5ZdbxsBzU/lf73JTrKQkIo
 E7GeJ2Q91SmXVOj48gBI8Dy9lza94HFABhMVAwYaUZ5gJYQHwS/7fAK+8vu86QyhwBNBws
 TWqsjDYjnIeKwQbK/c1SJW0ePk179OvJGr3VgojWYrBsWph/UqU/yeFtmc8P63V9DZdW9G
 cJ8YFEBfeoWtCnrGunLiKiVOL9fih3T/Z48RgzIz8b5R5Dx99NpyW1nK7Zi4Jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LQTE1c3S
Subject: Re: [Buildroot] [PATCH 1/1] package/libsolv: bump to version 0.7.25
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 22:46:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://github.com/openSUSE/libsolv/blob/0.7.25/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  .../libsolv/0001-Fix-build-without-C.patch    | 49 -------------------
>  package/libsolv/libsolv.hash                  |  2 +-
>  package/libsolv/libsolv.mk                    |  2 +-
>  4 files changed, 2 insertions(+), 52 deletions(-)
>  delete mode 100644 package/libsolv/0001-Fix-build-without-C.patch

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
