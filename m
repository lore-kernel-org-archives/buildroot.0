Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626C5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 20:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F7CD403C4;
	Sun, 13 Feb 2022 20:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uTDDKtfGiBe4; Sun, 13 Feb 2022 20:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EBC24026A;
	Sun, 13 Feb 2022 20:43:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B3771BF83E
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 20:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49D7440177
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 20:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ONrdUNz1L56p for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 20:43:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2590040168
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 20:43:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C61A7240006;
 Sun, 13 Feb 2022 20:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644784997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgFs5kOysGi+1seavj7Cei9mLIDF4dNRvNyfPc87+kA=;
 b=LILVelUrp43KtvNAhVJCvQOLU7F5MGjulG2aAK/DKDrmSb+0iPOqJ8Xc1kLUurBGmy/ZGb
 RPTWhD70SvBp/HGXmOBAjlqMcWlXu0HLpZzJVfsPbh9tY/+ijU3he3YTvDabLaI82my/Uu
 vy5/QY3UR+LXdnDN0V9ssGGZRyC3nQv53pWYfyX3NQfiJ2uMM7ENWGCBm+CMusuWBkm75s
 NmEm8Mw4W7USmk9p29e/3rzFtg+hExq8ngWvts8Qkz7ZL/NR+2Ln1RxT5J46Y9Y0Y70rh7
 VxcYROxJBZ9C85W9FUyuGY6/8yD100I3RCNJ3zloPUKRAgOocrKgeRlOAMZOlg==
Date: Sun, 13 Feb 2022 21:43:15 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20220213214315.015c63b5@windsurf>
In-Reply-To: <YggsOR0uNxdhINWR@waldemar-brodkorb.de>
References: <YggsOR0uNxdhINWR@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/binutils: remove 2.35.2
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

Hello Waldemar,

On Sat, 12 Feb 2022 22:52:57 +0100
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

This patch forgets to remove package/binutils/2.35.2/

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
