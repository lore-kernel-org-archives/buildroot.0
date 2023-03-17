Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D522EC6FD1D
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 10:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7097F40136;
	Fri, 17 Mar 2023 10:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7097F40136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfKmAa7uWfdb; Fri, 17 Mar 2023 10:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFA5C42408;
	Fri, 17 Mar 2023 10:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFA5C42408
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C5301BF2B0
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 10:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4584D6175B
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 10:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4584D6175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bG0fiFVcb-O8 for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 10:24:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9424560F82
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9424560F82
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 10:24:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6764BE000F;
 Fri, 17 Mar 2023 10:24:32 +0000 (UTC)
Date: Fri, 17 Mar 2023 11:24:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230317112431.4a3fea9e@windsurf>
In-Reply-To: <20230317101031.2357806-1-james.hilliard1@gmail.com>
References: <20230317101031.2357806-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679048672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQOhZ3+VsRMT1AQfpaEhelHQweX+gS0HApYtTWKyMqg=;
 b=Nd8QYsWwBqzMH8tKd7yEnbyWC6EBuO1kGYPR8Nio5eB8X0ntxj337ZIpQpuFX+MBXyQouz
 Wnd4XVCjtZoQ54NCnWAiYPfbuTVZAttK61uy5q/cURXhFzN3ODYkfovcUFaVYqduyCrsJi
 SVkZwKNAoaB8Mvmo76P8LWmW3NVm/MHRWPlGNVf6JHyTaQPWeQ7VL+sqgoyuU7s6xbvlG5
 OKIDCV35J7aoLu/yAi5RUICDKdsZKQbbpyEx6HC5pVIdW5/M2rjjEJz1iqUUG6S5vLtJLj
 WD1yu5jkDP8Xw74/bNAbjf1xEXswcMfwLziqoUbkdEpvKb/5/uCdmuI8fC84jQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nd8QYsWw
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump to version 1.68.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Fri, 17 Mar 2023 04:10:31 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Link to Rust 1.68.0 announcement: https://blog.rust-lang.org/2023/03/09/Rust-1.68.0.html
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks for the bump. Do you have some hints about
https://bugs.busybox.net/show_bug.cgi?id=15401 ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
