Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64252C05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 11:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E37EC81F5F;
	Thu,  2 Feb 2023 11:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E37EC81F5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lbTGNcQVxWj; Thu,  2 Feb 2023 11:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B67681F5C;
	Thu,  2 Feb 2023 11:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B67681F5C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD5B31BF484
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 11:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3DD441A6C
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 11:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3DD441A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0BGHJwLm3yq for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 11:29:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6956241A3E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6956241A3E
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 11:29:48 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D5C9A2000D;
 Thu,  2 Feb 2023 11:29:44 +0000 (UTC)
Date: Thu, 2 Feb 2023 12:29:43 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230202122943.3c2851d7@booty>
In-Reply-To: <20230201223241.3867678-6-giulio.benetti@benettiengineering.com>
References: <20230201223241.3867678-1-giulio.benetti@benettiengineering.com>
 <20230201223241.3867678-6-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675337385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V23iCBmyPemAC+HpcPhkJNvPgLJSdA9GidTedAnVQb4=;
 b=HFcbPQEIJLD11webPNWBImfrFwvCB6pcxotROzoCDzMtwlkFd757YVuMVUMGeAldzaLe6X
 pTdd3hEfIZMwFhBD+bgHW9z6AQ2sg3eHbq9KipwzpU57OM3BzHJgk/yeQ+HHrgtziyaWwu
 QfD4nEO/+INJI6jqdtJgJ1BVyT7sV/ghYi5D4hFZsJkB890saw6Uf8i3yrls27DHqGWCec
 +vdXvKCvFonFLzCxSPbjBWqy4XWRPutJlBp78louRxzYa8WqfvK8So3KiJXo8EnYMmmmwf
 Ik2ij1E9muc+8UI7QJxf9zaOjEyUGquIrWv0R6/cZOMNWFHrYpdSHv0q7gIQPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HFcbPQEI
Subject: Re: [Buildroot] [PATCH 5/7]
 configs/olimex_a20_olinuxino_micro_defconfig: bump Linux to 6.1.9 and
 U-Boot to 2023.01
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Wed,  1 Feb 2023 23:32:39 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks, this was a good opportunity to remove the dust from my Mini
and power it on once again!

For this patch:
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

For the whole series:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
