Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88215C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 08:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0487840462;
	Mon, 25 Apr 2022 08:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gthjss_KxYAt; Mon, 25 Apr 2022 08:39:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 703D840323;
	Mon, 25 Apr 2022 08:39:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35D251BF3D7
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2364C40323
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JX4r7EkqjiBu for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 08:39:08 +0000 (UTC)
X-Greylist: delayed 00:34:23 by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA7AE40022
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 08:39:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 3D2691814B9; Mon, 25 Apr 2022 10:39:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1650875946; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=AxB93TiRE1ulk/sAvcr9nWD84RR6H3YJHWuq/tpEPlQ=;
 b=lxZWl2YcdNpX1sFFGMwdwxwnhDFQl/Ds1fYDtegxnc6wxgLcKCxP1kDfRsLUpVqrc1A/Fm
 GzyrSH265RI9FbvkuZFw6pFZKATJ2WwLJhgH/aWhR6QUOxWdslsoJFxCJf8Hz1cXQxiJC1
 a4tyvK35Wng/3H9Xbms/grT8MUVP7Eo=
In-Reply-To: <87k0bd1sq4.fsf@tarshish>
Date: Mon, 25 Apr 2022 10:39:01 +0200
To: "Baruch Siach" <baruch@tkos.co.il>
MIME-Version: 1.0
Message-ID: <a5ac7-62665e00-1-6be95600@233424485>
User-Agent: SOGoMail 5.5.1
X-Last-TLS-Session-Version: None
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/1=5D_package/=7Bpython-=7Dproto?=
 =?utf-8?q?buf=3A_bump_to_version_3=2E20=2E1?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Monday, April 25, 2022 10:16 CEST, Baruch Siach <baruch@tkos.co.il> wrote:
Hi,

> Hi Michael,
> 
> On Mon, Apr 25 2022, Baruch Siach via buildroot wrote:
> >
> > The version update in python-protobuf.mk is missing.
> 
> I misread the commit in protobuf.mk. Sorry for the noise.

The package for python-protobuf is a bit uncommon. So the usual patch checking patterns fail ;) 

> 
> Something went wrong with the Cc list. I hope it's fixed now.

My fault. I messed up the CC List while reviewing the patch in git send-email. But I think the patch came through anyways.

Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
