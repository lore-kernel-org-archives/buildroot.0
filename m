Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A39C64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0A3640BA3;
	Sat, 25 Feb 2023 09:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0A3640BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDVlrY1dyNcm; Sat, 25 Feb 2023 09:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D326040BA2;
	Sat, 25 Feb 2023 09:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D326040BA2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48E841BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A6BC40017
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A6BC40017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YUh3yXW4czmL for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:40:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52BBE40641
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52BBE40641
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:40:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4641B40002;
 Sat, 25 Feb 2023 09:40:21 +0000 (UTC)
Date: Sat, 25 Feb 2023 10:40:20 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230225104020.1495fb25@windsurf>
In-Reply-To: <20230224163116.46934-1-fontaine.fabrice@gmail.com>
References: <20230224163116.46934-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677318021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TZKor5U2d7odXH0MsKu1QJ+usTkj4oYPYiwtAVlStM=;
 b=GBp33CKQCgPSdL2bad63rqcxcjyC0CHR8kRG4m67IN+6GvuUY3KugtUPzOAQSFN4ntyaU2
 csM3bV2OAHu7Jcp0mO8aHORYknOJtOTokU7G8pj1BbEAT7a5dgjpNGgjcGyztyZXJW/LRp
 dJaIS8hPNJ7VI/JgG144ne1PsCjYroL26r1MofMQ0TvGdOZq+IvME0Jxq4HtZuVs4o7NSj
 zPpid2l4QY1eSNvy2TYywwFxjwes9tSHBQw8pGzBtmuHUxVP8uQ6X/9MV/AtCu/jTsKKgf
 ExJg1DZ/Fk+u8gxW7LlJiGVLc+JuLh56ZwXMtFGXjDsxB7zxZHHucSBDubUN7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GBp33CKQ
Subject: Re: [Buildroot] [PATCH 1/1] package/hawktracer: bump to
 3c22b3908912e2ec727fd2ddc5dbfe7464e6b4a5
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 24 Feb 2023 17:31:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following build failure with gcc >= 12:
> 
> /tmp/instance-8/output-1/build/hawktracer-2ec19d71923344148928ef45fce549eda67030a4/hawktracer.cpp: In function 'HT_Thread* ht_thread_create(ht_thread_callback_t, void*)':
> /tmp/instance-8/output-1/build/hawktracer-2ec19d71923344148928ef45fce549eda67030a4/hawktracer.cpp:1006:28: error: no matching function for call to 'operator new(sizetype, std::thread*)'
>  1006 |     new(&th->th) HT_Thread();
>       |                            ^
> 
> https://github.com/amzn/hawktracer/compare/e53b07bc812c4cfe8f6253ddb48ac43de8fa74a8...2ec19d71923344148928ef45fce549eda67030a4
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d18a1b2ee6cdcb289567ae90b2d836844427b5f6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/hawktracer/hawktracer.hash | 2 +-
>  package/hawktracer/hawktracer.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
