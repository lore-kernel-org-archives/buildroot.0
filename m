Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC81CC001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D67E415C3;
	Sat, 12 Aug 2023 19:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D67E415C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QekFezjzLGVo; Sat, 12 Aug 2023 19:41:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46875415CD;
	Sat, 12 Aug 2023 19:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46875415CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09A741BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8A5640477
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8A5640477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFbvHzszMEQL for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:41:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B78E840003
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B78E840003
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FD0A1BF205;
 Sat, 12 Aug 2023 19:41:17 +0000 (UTC)
Date: Sat, 12 Aug 2023 21:41:16 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230812214116.23dd6253@windsurf>
In-Reply-To: <ZNeD0iRhXWHTZHLX@waldemar-brodkorb.de>
References: <ZNeD0iRhXWHTZHLX@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691869278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=acfasFHIoh5ce2fMrUKCUhRSiIGDo8PjU0QyaM/oGec=;
 b=SPJTUi13BrnkbwKVkf23WzLw+pQLlHcY6CmngDaC/gH7+qzL2zg/Vl6z1DjyBVCQHCatKp
 J3BLr7EePnVkN6PADSWtItJWmhuUE0cGjfOHI+ZjBFm/HpZsH3sBNHnm8p/T6c66t2hNGZ
 vNkeH7LaTHTOMgVwxjG2iYjej7g82rb+JI64fb3qdhQiUAQWkE+HlXs0KmSPsTwkd9N1uq
 JjiAjDw4GzCyugA2Yj2Gp/PkVgbEab97L9LdY9SJ4xjuE72g9dUo7IOMQ+G2PYqWbdRXms
 WNqhrbPYDsWkZLIKSQBM1rt6nlTAsMbITbycFl30w2RdQdg3doYlzIXB2TP11A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SPJTUi13
Subject: Re: [Buildroot] [PATCH v2 2/2] package/xfsprogs: bump version to
 6.4.0
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

On Sat, 12 Aug 2023 15:06:26 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Patch 0003-libxfs-stop-overriding-MAP_SYNC-in-publicly-exported.patch is upstreamed.
> 
> See here for changes to the previous version:
> https://fossies.org/linux/xfsprogs/doc/CHANGES
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - no change
> ---
>  ...riding-MAP_SYNC-in-publicly-exported.patch | 187 ------------------
>  package/xfsprogs/xfsprogs.hash                |   2 +-
>  package/xfsprogs/xfsprogs.mk                  |   2 +-
>  3 files changed, 2 insertions(+), 189 deletions(-)
>  delete mode 100644 package/xfsprogs/0003-libxfs-stop-overriding-MAP_SYNC-in-publicly-exported.patch

Applied to next after updating the .checkpackageignore file to properly
account for the patch 0003 being removed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
