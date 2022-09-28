Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFFFC04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 21:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15C2340CF8;
	Wed, 28 Sep 2022 21:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15C2340CF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dijA0oCHYv2w; Wed, 28 Sep 2022 21:35:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F26840CD7;
	Wed, 28 Sep 2022 21:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F26840CD7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC3CB1BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87AFF819D2
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87AFF819D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AsX64zrRRBvD for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 21:35:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4346F80A81
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4346F80A81
 for <buildroot@busybox.net>; Wed, 28 Sep 2022 21:35:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA63A20005;
 Wed, 28 Sep 2022 21:35:07 +0000 (UTC)
Date: Wed, 28 Sep 2022 23:35:06 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220928233506.0939e6aa@windsurf>
In-Reply-To: <20220928193149.12466-1-guillaume.bressaix@gmail.com>
References: <20220928193149.12466-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664400908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kd2PSuTDIRpOAyEG3tjWMwbebsxIjZI9vtau9MkE/lI=;
 b=GoY3jhS184+pRr9NL2oY+LagjTCqN2HLG6djfpFO1JDmWl3y2XR9KEDvFyU+ErCS9US0/g
 mmN3ovgoDkV+ZZ/Id9Qw3PgU4UqAvwCuwUrh581lmVF3O87qBh5tAfZkaeAWV76Qp1n7ac
 0HTHzPvGDPCCJ+0zc4juWCklfewPeu93YAtJ/oUYdp5K2BoR37B0MpW95NwOmFDjqAFGxO
 Hfkz3KMKytJtFPALySMt8sQKjvoEbwE8cKLVGIK0xgRhSknJy3+7LxLF3O97KMwYo6zi6F
 6qc38I73kO6h3nyEDokoJyB7zifhQyGJSVnQXLLm46o+zbZQ4Fs2zsfBPq6dLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GoY3jhS1
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pythran: bump to version
 0.12.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Sep 2022 21:31:49 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/python-pythran/python-pythran.hash | 4 ++--
>  package/python-pythran/python-pythran.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
