Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DFDC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 07:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFB80417E1;
	Thu, 28 Jul 2022 07:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFB80417E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2bZee8xDGLK; Thu, 28 Jul 2022 07:54:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE388415C5;
	Thu, 28 Jul 2022 07:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE388415C5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AD041BF423
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13B65417DC
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 07:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13B65417DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1cRoFapRiwJ5 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 07:54:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E90CC41520
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E90CC41520
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 07:54:33 +0000 (UTC)
Received: from [147.173.65.159] (pulsar.grenoble.cnrs.fr [147.173.65.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 8706FC28D3;
 Thu, 28 Jul 2022 09:54:30 +0200 (CEST)
Message-ID: <37264d53-47f9-b2dc-955d-12e5960b4477@grenoble.cnrs.fr>
Date: Thu, 28 Jul 2022 09:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 buildroot@buildroot.org
References: <20220727221217.1072588-1-arnout@mind.be>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <20220727221217.1072588-1-arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1658994870;
 bh=Xm7JQAQZ4U62L2Fqwv/CsBsY+OcTJW+jmXbmCJFglwY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rOLgcEapIPDrgb/EXyyh3f9TvhqqyueAdP44KOUkEUYjLxvhAGr552u/6DJ8nBsuL
 qtZDXQnpv9PHMVbz0w2MxkH05/AoidO+szPeBYzGvGIlAEOETgfwv3IE8k44DzxY9Q
 8HyLp2WxuL42tz4NxAiGLSD3b54UNgakULSqpJgtG8Dq9p6npap6htv3Tk/JaP7sDI
 iukmwWHZhPi7yVsNIpMIOFURRrVvDq54P4p3JDEC5G/TgRLWfDf8ebYmd2lxCdX6oc
 G4QACW9gxaz7WNjYNRogKewjp2GwmWO2lripkC1F6VbymSbZfqIrCu7XuN+oRbgFyV
 FTNLn/SsD3noA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=rOLgcEap
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual: introduce "Integration
 topics" chapter
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout, hello all,

On 2022-07-28, Arnout Vandecappelle (Essensium/Mind) wrote:
> We want to add more information in the manual about how a system created
> with buildroot works overall. We currently already have a chapter about
> SELinux, but we want to add more information like that, e.g. details
> about how systemd in Buildroot works.
> 
> Create a new chapter "Integration topics" with an introductory blurb,
> and move the SELinux topic under it (as a section rather than a
> chapter).
> 
> "Integration topics" is not the best title, but we couldn't find
> anything better.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  ...x-support.txt => integration-selinux-support.txt} |  6 +++---
>  docs/manual/integration.txt                          | 12 ++++++++++++
>  docs/manual/manual.txt                               |  2 ++
>  3 files changed, 17 insertions(+), 3 deletions(-)
>  rename docs/manual/{selinux-support.txt => integration-selinux-support.txt} (96%)
>  create mode 100644 docs/manual/integration.txt

[skip...]

> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> index b5cc044805..8ba0c76d32 100644
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -38,6 +38,8 @@ include::common-usage.txt[]
>  
>  include::customize.txt[]
>  
> +include::integration.txt[]
> +
>  include::selinux-support.txt[]

I believe the above line (selinux-support.txt) should be removed from
manual.txt.

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
