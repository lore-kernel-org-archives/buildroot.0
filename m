Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E799E78491
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 21:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92A4C40069;
	Sun,  1 Oct 2023 21:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92A4C40069
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5kqK2rlGnnFN; Sun,  1 Oct 2023 21:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F669418C1;
	Sun,  1 Oct 2023 21:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F669418C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1755D1BF404
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 21:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4E5C40364
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 21:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4E5C40364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0w-Ch2zyEt0s for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 21:11:28 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1118401A1
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 21:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1118401A1
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4C04FF806;
 Sun,  1 Oct 2023 21:11:24 +0000 (UTC)
Date: Sun, 1 Oct 2023 23:11:23 +0200
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20231001231123.58838dcb@windsurf>
In-Reply-To: <20230913212000.987236-2-ben.wolsieffer@hefring.com>
References: <20230913212000.987236-2-ben.wolsieffer@hefring.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696194685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=quhzNDlbaFN7M2SmxlD2d1f+41ip3iV51GJz6xol/Fo=;
 b=V9Q6rlK5d5/dzq+vJtILO4RUmgHIo4uImGB6rl5kUtmfAO/pWvK4Xt/Zk2O7Ov4g4Y83M3
 STBI/xhFsI4x7FskwtyEFPysrTI82FXIx0hGK9Jq3THllVInybcwB4w2Us1MfjvZZLe8PK
 fqtP8actTu0qnbi838/IjIf12/+Y5p8RkF+obvyzfLVhvblr/F67LveVc2G39QZDKSaYcA
 3Ht6QDX7r+An5HE9U3QuTtkmZocYsQQRZRi0yaJMc8bvUjQvD3iU4O63SBH+EwL1ddZ5Sb
 x5IgZsLXCeSzv7OAwos47StB3DGFSXChgxx/+m8vRn4wtXHaJRYlCEwXgcEEoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V9Q6rlK5
Subject: Re: [Buildroot] [PATCH] package/gptfdisk: fix bug with util-linux
 (libuuid) 2.38
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 13 Sep 2023 17:20:01 -0400
Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:

> Fix the following error message by backporting an upstream patch [0]:
> 
>   Warning! Unable to generate a proper UUID! Creating an improper one as a last
>   resort! Windows 7 may crash if you save this partition table!
> 
> Additionally, now that gptfdisk uses libuuid again, the build fails
> because passing LIBS to make overrides the default value in the
> Makefile. To fix this, this patch adds -luuid to GPTFDISK_LDLIBS.
> 
> [0] https://sourceforge.net/p/gptfdisk/code/ci/6a8416cbd12d55f882bb751993b94f72d338d96f
> 
> Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
> ---
>  ...to-deal-with-minor-change-in-libuuid.patch | 40 +++++++++++++++++++
>  package/gptfdisk/gptfdisk.mk                  |  2 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 package/gptfdisk/0004-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch

Sorry for the delay, I have applied this patch after improving the
commit log:
https://gitlab.com/buildroot.org/buildroot/-/commit/58fbfe870640cf20678d4f6a40999ea5223c6fca

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
