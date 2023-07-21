Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF553EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 20:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3849E41855;
	Fri, 21 Jul 2023 20:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3849E41855
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-EvUf7KXrKL; Fri, 21 Jul 2023 20:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 719594017B;
	Fri, 21 Jul 2023 20:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 719594017B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21D651BF299
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E797483B70
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 20:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E797483B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ZKcDOGzzbXb for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 20:50:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 883DB83AF9
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 20:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 883DB83AF9
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA2C0C0003;
 Fri, 21 Jul 2023 20:50:33 +0000 (UTC)
Date: Fri, 21 Jul 2023 22:50:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230721225032.51d9c5db@windsurf>
In-Reply-To: <20230721201154.847161-1-bernd@kuhls.net>
References: <20230721201154.847161-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689972634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVjFxudve/FBRwjxMsdgVrPrcOIY+DTPci7J3/lG7SE=;
 b=RlDCiuW+jNMQN35QaLIA/zW1Yd1ljJA93u+wd0XFpcbzHI8pyF6tM+e3AejOLFrj52WVGm
 zF1Z9ExMcTgtoI83TmUpynNf+KMoyT/pTD0x/F86BLv3RriXsFVXoS6YVjJX0UE8GiWpfV
 AJb7svBqtwqn/sxJZ15+wWiVokgnQ6YL9bWGIcIKQ+nwbjHfD8QB3eOj9QepgGFxnagqi+
 P+xPV+kvJpz1Mn1QeGY1mH94Dg0VZ75kOb0qya4jpd9sJu38ohb4iXyW1GAoDiO4zPRwRz
 L5g7mOR10SYtD91rJ6Hi7mQK2Vn3WH8y7fdguWoAyW1r/vc3dCofUNM0VU7IcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RlDCiuW+
Subject: Re: [Buildroot] [PATCH 1/2] package/mariadb: needs fmt
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

On Fri, 21 Jul 2023 22:11:53 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Upstream added fmt as dependency with commit
> https://github.com/MariaDB/server/commit/e214e60201216b2e6330f86a84fec8ae14aa2887
> 
> Fixes:
> http://autobuild.buildroot.net/results/ce1/ce140a3923bc2f85b176fafcc38c6f68b177d33a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Which Buildroot commit introduced this regression? It is important to
know so that we can backport to the appropriate stable branches.

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
