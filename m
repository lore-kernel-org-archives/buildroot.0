Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF59EC32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 08:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E98A83F78;
	Sat, 24 Sep 2022 08:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E98A83F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ArMfc2zWUwB; Sat, 24 Sep 2022 08:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7669A83F40;
	Sat, 24 Sep 2022 08:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7669A83F40
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC1E71BF861
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B75F260A4F
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B75F260A4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDqIjTn4EzGT for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 08:37:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FD656079D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FD656079D
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 08:37:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0AFECC0003;
 Sat, 24 Sep 2022 08:37:25 +0000 (UTC)
Date: Sat, 24 Sep 2022 10:37:25 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20220924103725.0778da2d@windsurf>
In-Reply-To: <c4193508bfb3de595c8cb3652d6f3dd69acd7fb9.1662007555.git.baruch@tkos.co.il>
References: <a8ea0d5fc6b7f447cbfab2426e1fe3687ee7e0d1.1662007555.git.baruch@tkos.co.il>
 <c4193508bfb3de595c8cb3652d6f3dd69acd7fb9.1662007555.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664008646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QutHcGg3YmyBW3Up4EgNMe9OW4ljP/afd9dfkSy44Vc=;
 b=LevYg1VHZSG8x9e4WR8Z7PVMcVLP82OSlMjXALpp5gEWR9TamJnKflNxRfjICvRQcxphVg
 xoVw1ZSPYMLezYX22qagNzYWgEqHeeUo8K/+knUdRaAFeKdhnHqNQ5Qr9z/cWRET9m6zjT
 hX0zhdpltLISGsM45h4SNBvkhr3U/s06pz79S5KrgEUc5lCcumgcoMP4F5ewPn5FYdoBCF
 WnvtQckvODxj0DHb17Rla6ZTTblBN6FytRz/pTmD3iSzWQ4id4p3cLIueBPzm6AjNXgRN1
 50s+DVVlgEGnf8qlb2rUMpj878alXP+60Q9N6YZEeG2f6+vFOu/BKbvNoHvngQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LevYg1VH
Subject: Re: [Buildroot] [PATCH 2/2] board/solidrun/macchiatobin: update BSP
 components version
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
Cc: buildroot@busybox.net, Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Sep 2022 07:45:55 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Update the listed versions to match current status since commit
> b4d9b515088d ("configs/solidrun_macchiatobin: bump BSP components").
> 
> All components are now from upstream so no need to state that for each
> one.
> 
> Cc: Sergey Matyukevich <geomatsi@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  board/solidrun/macchiatobin/readme.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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
