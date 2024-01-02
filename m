Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8482AC47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 20:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38F0840ADD;
	Tue,  2 Jan 2024 20:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38F0840ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qtuYb2bQiGU1; Tue,  2 Jan 2024 20:24:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3075540AB8;
	Tue,  2 Jan 2024 20:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3075540AB8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CF7F1BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4651580EBC
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 20:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4651580EBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 90F0wMALjfbf for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 20:23:41 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E3B280E45
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 20:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E3B280E45
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F2A9C0003;
 Tue,  2 Jan 2024 20:23:39 +0000 (UTC)
Date: Tue, 2 Jan 2024 21:23:38 +0100
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20240102212338.2e91809d@windsurf>
In-Reply-To: <20240102132843.587559-1-abrodkin@synopsys.com>
References: <20240102132843.587559-1-abrodkin@synopsys.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704227019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhGIEUSH9e+wvgctFN6lua3ukVVTx5eJrVWtHqP0/Gg=;
 b=C+E2BKpZRQ3hq5hJo7KuY1rT7ZnQ88vcrPv7kPgkhvuWvInBDhGiYhFgaLa4ydBIb2wmHB
 J4RPmChoJCccqi/8tGly6LlgZVARMJ8Znb2+URhik9kciGt8kcvXS2przdDgF/JnOYvodf
 iy48tX4z5IrONN4keaanHQxlR0lhgS9j9Ir+N2LBtvO7150dFw+eW2U/Qlno9JRrwbpEgW
 /GnoMlPl8Ol/rNBYnf3SPKfxGXVzaDqK3g7xCJHBSLYiyyr96ZhGe91JtTeJ5fRCzszLoD
 8KZsdJP3MMDmG+X7PMfty1xlnh+6qTRJkToqQqVkYlpULNQxgAY8vKsAbHodJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C+E2BKpZ
Subject: Re: [Buildroot] [PATCH] package/gcc: Enable ARC HS rel 3.10 in
 vanilla GCC 13+
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 05:28:43 -0800
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

> For quite some time a special tuning for ARC HS release 3.10
> was only implemented in ARC fork of GCC, thus there was a dependency
> introduced back in the day, see [1].
> 
> But finally that tuning got merged upstream (see [2]) and
> so could be used with vanilla GCC starting from version 13.1.
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=770c9e5ce3de4ef1743948898a37e9a2ad76ca8f
> [2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=7501eec65c60701f72621d04eeb5342bad2fe4fb
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@gmail.com>
> ---
>  package/gcc/Config.in.host | 2 --
>  1 file changed, 2 deletions(-)

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
