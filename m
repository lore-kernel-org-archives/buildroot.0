Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AEBEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 084B6416D8;
	Wed, 12 Jul 2023 21:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 084B6416D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vctE6-RxWDNr; Wed, 12 Jul 2023 21:39:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D82A416F1;
	Wed, 12 Jul 2023 21:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D82A416F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E5061BF3A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 776F060AEC
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 776F060AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQC4WqZP7-iY for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:39:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AB7F60AE6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AB7F60AE6
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:39:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43EF5240002;
 Wed, 12 Jul 2023 21:39:06 +0000 (UTC)
Date: Wed, 12 Jul 2023 23:39:05 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230712233905.2a4358a8@windsurf>
In-Reply-To: <20230523195411.231639-1-bernd.kuhls@t-online.de>
References: <20230523195411.231639-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689197957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fppTJLYhs1B1TF3xFkN7HBba+34kmL+tCQwGlZum+L4=;
 b=L5nhMzJy4gn3tWAHAV98Gn6vSlgxrRpFPYM71NvlUbkCUbVQYo8Uh7kB0CpDp59Uw62RqB
 Xwld8pEnJ4jp48Ufumrqelf9TY+vu4qDifhhZt29b/fvYkaG9SxaLI3lOQtGbYjmpZRCXE
 ox+SxtkugPB7ui50vcOWEi048a8ePZcKYeol5h8MBrrT/RyDb5eDwituldUsHLX37SgU1g
 XmIkOZLNzaocBtNOqZ38DBGkcupJVcZo/Kqvo+wjX8FzB3XzXlgnzXMRkfhiBe/WyydwX6
 sIbGu3BXZC2w/uUUHjzNHVmLqQs7L2n84fb8Xu/lv7R+h0X140T/i2oH75hw3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L5nhMzJy
Subject: Re: [Buildroot] [PATCH/next 1/1] package/eudev: bump version to
 3.2.12
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 May 2023 21:54:11 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://github.com/eudev-project/eudev/releases/tag/v3.2.12
> 
> Removed patch 0001, a different fix was applied in 2015:
> https://github.com/eudev-project/eudev/commit/c7badd37d3ac5b06b1fb170b7dfc8ed7c00ce64b
> 
> Removed patch 0002 which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Build-tested using this defconfig:

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
