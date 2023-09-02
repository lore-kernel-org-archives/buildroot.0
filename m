Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C73C71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 16:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FD0D40585;
	Sat,  2 Sep 2023 16:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FD0D40585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvzTt9DbOj8e; Sat,  2 Sep 2023 16:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9584540577;
	Sat,  2 Sep 2023 16:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9584540577
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 825FF1BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 16:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B97240577
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 16:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B97240577
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3T-UbpW2p1TP for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 16:01:52 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F31BF40568
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 16:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F31BF40568
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0296FE0002;
 Sat,  2 Sep 2023 16:01:48 +0000 (UTC)
Date: Sat, 2 Sep 2023 18:01:47 +0200
To: unixmania@gmail.com
Message-ID: <20230902180147.527f6e40@windsurf>
In-Reply-To: <20230712220119.1531498-1-unixmania@gmail.com>
References: <20230712220119.1531498-1-unixmania@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693670509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfgdKwGmeM0Ukl1U4P14o5ukz7d8sjk4vVZTj2+D/eE=;
 b=erfMuRW9Ip768QBIu++RCvpLBR2TT3tvMwoMLtxaR5CLkSvjQ83F6ZiW6shYnFw5HpCXz2
 lPOqF/wPDPvOjZdLgRSz252tJ015fLmzyxV4GCBTQGrsjrm/yqx1DWnqjmedCjGDujnR8/
 f+4EuQaT7F4yejhc9ZsX0lyRHsV+RlpDaglwqS7a0O/XpZF0sE+jIleuzJMBgVyR3snl2y
 gvEOSPfsAsHrKPCv2Kn+PVLl62vDIHJVeoJbHx61qc/3ArVaZQZLnJqslzewvpxJEds7gh
 pb3eqZn5J5L+EdSbUUX/oWl2KlX/Eylq9PmmZ2EQB15wWzipAoTpZZzdGkkxWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=erfMuRW9
Subject: Re: [Buildroot] [PATCH] package/qemu: add option to enable tracing
 (default no)
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Carlos,

On Wed, 12 Jul 2023 19:01:19 -0300
unixmania@gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Tracing is a development feature for debugging, profiling, and observing
> QEMU execution. It does not make sense to enable it by default, so add a
> config to enable the "log" tracing backend (the default one). Options to
> select other backends may be added in the future.
> 
> Also pull a patch already reviewed upstream to install the trace events
> file only if necessary:
> 
>     https://patchwork.kernel.org/project/qemu-devel/patch/20230408010410.281263-1-casantos@redhat.com/
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  ...-trace-events-file-only-if-necessary.patch | 29 +++++++++++++++++++
>  package/qemu/Config.in                        |  9 ++++++
>  package/qemu/qemu.mk                          |  6 ++++
>  3 files changed, 44 insertions(+)
>  create mode 100644 package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch

Applied to next after adding an "Upstream:" tag inside the patch, which
we now require (you get a "make check-package" warning if you don't
have this tag).

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
