Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AD8EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 18:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B29E8606FF;
	Tue, 22 Aug 2023 18:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B29E8606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tTOd3vOsF6cW; Tue, 22 Aug 2023 18:06:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BCA0611C9;
	Tue, 22 Aug 2023 18:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BCA0611C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 879F11BF2BD
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D0C1611C9
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D0C1611C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eTCGspkERqbV for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 18:06:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 202CB606FF
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 18:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 202CB606FF
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0340240003;
 Tue, 22 Aug 2023 18:05:56 +0000 (UTC)
Date: Tue, 22 Aug 2023 20:05:55 +0200
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20230822200555.1f725af7@windsurf>
In-Reply-To: <20230822121407.414eb140@windsurf>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230822121407.414eb140@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692727558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMmTiKmzzOcpgqAoUNhjtUz4Z64WqSscVHVXAfa+YEk=;
 b=XjZWZz9GxpaIp7+jFExV1MGUNjQNTtLblQ4GClJqDZVgkQM05tPsczJkFDD2IPf297SmgG
 AVqyKR3UTe7BctvBJox0iRPYXFa1X+fxHqSoGm7f2VJD6eoma8MSMs+3Pm4nEiV+ZVOHal
 YDgBzlrx4jFjoenGTxQXcVFlqvXmF0/rmYIYJgl+bzRrw4+c0T8yyi3akFPgpFrUMcsY0T
 xabS2z/WNvMKgnNZkYymfEVyYezw643X8c2Dr1+MVwm3zUsawg0UFBqYzgqCD98t1tk31w
 U1EgfmpNHoKbo4jlf593vdF2gdlT0oDN2sZgaBkZvpXWzevQUHPYqE450IG2rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XjZWZz9G
Subject: Re: [Buildroot] [PATCH v9 00/11] add support for TI's AM64x and
 AM62x boards
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Tue, 22 Aug 2023 12:14:07 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> So, I have just merged the first 5 patches of this series... but
> actually in its v8 iteration because the v8 is the one that was still
> pending in patchwork, and I realize only now that there was a v9. How
> well, too late, I already pushed to our next branch, so any additional
> change will have to be done on top of what's in the next branch.
> 
> I'll therefore reply to the v8 patches that I have merged and explain
> the numerous changes I did.

Now that I have merged the first chunk of your v8. Could you rebase the
remaining commits of your v9 on top of the latest next branch, take
into account the comments received, and submit an updated v10, so that
we can move forward with AM62/AM64 support?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
