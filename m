Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A089BC352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 17:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29C91402BA;
	Tue,  6 Dec 2022 17:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29C91402BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlFCGoAQwSFv; Tue,  6 Dec 2022 17:22:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28DAC40218;
	Tue,  6 Dec 2022 17:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28DAC40218
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A49771BF297
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 17:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7768881E74
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 17:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7768881E74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XjB7gpLJOWy for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 17:22:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F230281E66
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F230281E66
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 17:22:19 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 675E8E0006;
 Tue,  6 Dec 2022 17:22:16 +0000 (UTC)
Date: Tue, 6 Dec 2022 18:22:14 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221206182214.7061d124@booty>
In-Reply-To: <20221206155226.54290-1-neal.frager@amd.com>
References: <20221206155226.54290-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670347337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sow6L/x0kYvJCbTyofVk842Coi+ngULgxpUoE5LxXNE=;
 b=dDlm8dcf2vJcyx3ypH2PcKWOi1d7Ua3L8ydU4Ve1CbSwLJLvXx39C0kJO7p91b9B7nk+Rt
 Rt6bZNlHMl8cJkNgSLm0wuJEbTUK0FL21189mDfExdMXTUzf5fATDEWKrBtEK/9V0TppIw
 Osev5L6zYV5QL1zPyZm2YQhLrOMzCJfCfwgixTVBuPeq7wb6/RrEe8xErxmwgq+clC6+Lj
 n+iYCtpl/GicIUQCFkbfOiPlytusowr4Hx+n5MTYwJPrwnX0jyXWZvP3TuF4UNgK+n09iO
 UxQWEm4AQyH5QDZdaINZAOYwKcQKBMtV1BRtdVk12u5/Y/aokIUXy5JTUGvRAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dDlm8dcf
Subject: Re: [Buildroot] [PATCH v1 1/1]
 board/zynqmp/kria/kv260/uboot.fragment: move to board/zynqmp/kria
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
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Tue, 6 Dec 2022 08:52:26 -0700
Neal Frager <neal.frager@amd.com> wrote:

> This patch moves the board/zynqmp/kria/kv260/uboot.fragment file
> to the board/zynqmp/kria directory.  The reason is that this file
> is the same for any kria starter kit and is not specific to the kv260.
> By moving the file, it can be logically re-used with the kr260 when
> support for this starter kit is added to buildroot.
> 
> KR260 Starter Kit:
> https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
