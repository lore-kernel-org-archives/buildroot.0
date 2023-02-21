Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68166C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F218482978;
	Tue, 21 Feb 2023 08:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F218482978
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I41gDtCSOWWL; Tue, 21 Feb 2023 08:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E24C82974;
	Tue, 21 Feb 2023 08:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E24C82974
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77F5A1BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 516FA42D34
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 516FA42D34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id adP5H8WNTQH9 for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:50:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27FDE42D31
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27FDE42D31
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:50:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50C5640013;
 Tue, 21 Feb 2023 08:50:19 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:50:18 +0100
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20230221095018.35fe1c66@windsurf>
In-Reply-To: <20230213151039.4073397-1-buildroot@heine.tech>
References: <20230213151039.4073397-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676969419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fDq/ycOftiiIngjqIv4rujMo1xXP14WuxOW66VwkpxA=;
 b=iK/F/AJ1pnX4GO0FggfsuI1QN8IQbZBgO81qtER4w6eIOXUBjbxVIqf0m8VEWVDjAbXXEh
 D0kNr0HKutk1A0Ndgze8I0YCnEReZYZY4+G0dvLSJjxHFfQyfWZTY8liDlXQzAbSCSXBkG
 PUjqtiF3SdAf3GuwjJ8FALbh4BvyAan+vDQOUDk3ytZszqD5T4ekvVe4lCqsQA0TnuU6At
 wPgxFqz/pD7uasYxi0h+r9B5+n/5x3Q7tdiYribsIIe+OuOUfS52OAiyuFpl61nt4VCt+A
 +tQNCcEbIQGPPtoDA9l2V4eMD12Eydep04N6aJ0a0LNDOG9BAVLr3FXO0k2joA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iK/F/AJ1
Subject: Re: [Buildroot] [PATCH] package/networkd-dispatcher: bump to
 version 2.2.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 Feb 2023 16:10:39 +0100
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/networkd-dispatcher/networkd-dispatcher.hash | 2 +-
>  package/networkd-dispatcher/networkd-dispatcher.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
