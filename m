Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3784BC433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE74D60BF1;
	Mon,  7 Nov 2022 22:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE74D60BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKdj-MGg_zZD; Mon,  7 Nov 2022 22:19:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3234560BE7;
	Mon,  7 Nov 2022 22:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3234560BE7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 838CF1BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A72F81991
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A72F81991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgucHQ-PJJOH for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:17:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1889781403
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1889781403
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:17:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 091B620002;
 Mon,  7 Nov 2022 22:17:28 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:17:28 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221107231728.3d3102b5@windsurf>
In-Reply-To: <20221106153415.4112489-1-james.hilliard1@gmail.com>
References: <20221106153415.4112489-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j4vu5r4V7sxzaqGLAiQ8miyD30/mhcYMSkxAwXRxDuw=;
 b=G59Mnj26JhHZwEH7zgoY/F0kf2QNBDeByFVLr417OOBD9zRglZYvid83yx96stV0HlmTUR
 QIZDDM+I+ySYKosA/Pc27pEY1bbDYkCrH8f4ZS9G95Il6bzANEFidr0iNN0IzHAnlM/fOI
 2nQZ0SXYjakf8GqHWQCVaFTSag1rgsxQvpq865RdpHPw/eimRZBAduUNF6sv6LqHTJ8Bc7
 JKtAXwFOQNfSVQvNVBB08RcrVCdzaudVmFKS5AM4tBY64/bJUvJd7KE7DJGw9dcymxiUNx
 5zCS7fNl9AAd0C1s+oRc+rC0ZZULIX1AJbjF6nARqk+YF8+xlUaiK4iqG+Q9FQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G59Mnj26
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flit-core: bump to
 version 3.8.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Nov 2022 08:34:14 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...sion-parser-for-multiple-assignments.patch | 80 -------------------
>  .../python-flit-core/python-flit-core.hash    |  4 +-
>  package/python-flit-core/python-flit-core.mk  |  4 +-
>  3 files changed, 4 insertions(+), 84 deletions(-)
>  delete mode 100644 package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
