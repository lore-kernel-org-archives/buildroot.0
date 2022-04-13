Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4343DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 21:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8C9482768;
	Wed, 13 Apr 2022 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RwtPR-VLAu3t; Wed, 13 Apr 2022 21:10:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1999D8271D;
	Wed, 13 Apr 2022 21:10:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 251971BF3B9
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21EF68149E
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LANnDJROI8hW for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 21:10:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CCA880B80
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 21:09:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D730100004;
 Wed, 13 Apr 2022 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649884198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G4Tv+OeK/2deDqpb6jsAo03wSiRUAidnl98GL59ahi0=;
 b=pKPXRF9UC2R/j2vJZMvzRKUnrT55i+5+CFVaKSi0hgLrgdXAGsEjh57I0wNvCeZeh+XmCL
 AQrnNwNZkDAiaEpgC5LFruUmAXnCbadSX/gZLlP+nEvaM99jjHVm2U7+GRDZgTM9SMYB36
 kXX+tKeQSX4xEoKX8ORjPK+BhSWJrZk+zwH8wFgJm/1fY3NdawTvjCp/X6SilnU332M/Z0
 KSzzp9Y2OAiD1yMKhbWEKFe7rZRz6kBAtDks31s60y/MGR3smbVQa2yUcWXgzikGE1zqPI
 OKLKalihi7NCD2kOte1xfctlPRpOL46O1CqQ93lRbBfsZztXS6Hrl5L2bc3QtA==
Date: Wed, 13 Apr 2022 23:09:57 +0200
To: Johannes Agricola <johannes.agricola@work-microwave.com>
Message-ID: <20220413230951.17b918cc@windsurf>
In-Reply-To: <7e6c990c-2670-f945-79cb-b2597e3b961a@work-microwave.com>
References: <20220413072445.1600631-1-johannes.agricola@work-microwave.com>
 <7e6c990c-2670-f945-79cb-b2597e3b961a@work-microwave.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libwebsockets: Require C++ toolchain
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

On Wed, 13 Apr 2022 22:28:42 +0200
Johannes Agricola <johannes.agricola@work-microwave.com> wrote:

> Please ignore this one. :)

Thanks for your patch. I've marked it as Rejected, as you suggested.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
