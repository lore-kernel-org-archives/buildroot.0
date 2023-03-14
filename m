Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46248C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 07:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCAF5813E0;
	Tue, 14 Mar 2023 07:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCAF5813E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPcvJ_DmWQIB; Tue, 14 Mar 2023 07:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A6B6813D1;
	Tue, 14 Mar 2023 07:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A6B6813D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16C871BF2CC
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0C0E403FB
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 07:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0C0E403FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wx8aYl9r6j7k for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 07:55:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DADFC4011F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DADFC4011F
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 07:55:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CDD53FF803;
 Tue, 14 Mar 2023 07:55:40 +0000 (UTC)
Date: Tue, 14 Mar 2023 08:55:39 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20230314085539.0f281cbc@windsurf>
In-Reply-To: <VI1P190MB0493A37AA63B6E45036E0F0B9FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493A37AA63B6E45036E0F0B9FBE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678780541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLuLL/vCOHa7J+3rjYdTbFPggAlCG4saHBoYHiNkPxY=;
 b=NlRNl5M6HU4rYhBIJ8OXWCicxieLCoSEROzbYcOQ5+8cJFmlUehNiIpzJ8AJum8clUJrOZ
 IOII0eR3/Wc/tpYX6DjtXuWAdkjnU498G4Zs2wgH7XbRyM5AvMm3qWElmOKMHdBo5MEvGu
 3ixp3mlFoMi5Og+lmJzjxVVRvzZSagWzAJ0zenYh6HJX/sEcP7mhGCMKGnTqxtw7FgctOe
 iIvyavOcSrsw1FM99Zj1jf22jFnolTtshV9o7p/phQVhGMJ0jE452WHd+uAc+12zFKrOFU
 ZncSr66QVdrI1vBPx8IbeRzGkFQul9dnTnHxilA7RV9qYXdMEozZb9yQ3DVaaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NlRNl5M6
Subject: Re: [Buildroot] [PATCH 1/2] package/lzop: fix COPYING hash
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
Cc: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 14 Mar 2023 07:48:28 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> The version bump in ce95217 forgot to update the hash of the license
> file.
> Changes include a new address for Free Software Foundation, Inc.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/c8a/c8ab973077067b2aa57e4f3ab51bd41ca1543d6f/
> ---
>  package/lzop/lzop.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks a lot for fixing this (and sorry for missing this issue when
applying the original patch).

However, I can't apply your patches because your Signed-off-by line is
missing in both patches of this series.

Could you resend with your SoB line added?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
