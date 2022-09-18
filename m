Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D9DC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C341841AA;
	Sun, 18 Sep 2022 10:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C341841AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rqf8fkEMamn8; Sun, 18 Sep 2022 10:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 627868418D;
	Sun, 18 Sep 2022 10:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 627868418D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 882EC1BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63AD88418D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63AD88418D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcBvh0T9I0ij for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:21:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41DF184175
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41DF184175
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:21:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 285AAE0003;
 Sun, 18 Sep 2022 10:21:55 +0000 (UTC)
Date: Sun, 18 Sep 2022 12:21:53 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220918122153.42dd96c2@windsurf>
In-Reply-To: <20220822100433.3998253-1-james.hilliard1@gmail.com>
References: <20220822100433.3998253-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663496515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41MNdGcrtdyOMaKgT8xbzLBKpASfbBORmTUvxKAqPEE=;
 b=Lfwy1w68yqYF0CvD5zBxyFuRjxv8ui+0Uvao6QsUth1epc/oPtMk64R4om2DsCTLfaAj2l
 z6rynfg+WyA3DtQM9U9Z4E+2BtfhUgz/nnK8GlLIer9L43fWEVBvPgttCLU8v+d+Tz96Ik
 Ir8OMoTlvwYsmzcr01kkhh45U8WHfB5Qbs69ABdcfaRbW4R60e59vsVCa3coLx1TIdCBYx
 OXoLV3UJ5Ja8ZbFhwHqagZzJxjtdbDCZtZPCsTj8Q+BAv1gKPZUr/TncXg0zwA0XyAEjhx
 qGdGPKel7pAZlU7dAjemQh/qUvggQVs8x/se+VzkKFVdAMvRstB4IYYxfNsP1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lfwy1w68
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pyinstaller.py: revert
 mode back to 755
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Mon, 22 Aug 2022 04:04:33 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This was accidentially changed to 644 in:
> d752f73b0c0e4ba50738cd1e7f4472f61fce9089
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  support/scripts/pyinstaller.py | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 support/scripts/pyinstaller.py

Based on Yann's feedback, and (apparently) the lack of autobuilder
failure, I have marked this patch as Rejected. As usual, we can
certainly revisit if there is some evidence that it is indeed needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
