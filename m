Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC853C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 10:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 612E1415E6;
	Wed, 24 Aug 2022 10:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 612E1415E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k11wjORwO33o; Wed, 24 Aug 2022 10:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32CB540873;
	Wed, 24 Aug 2022 10:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32CB540873
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 808B91BF592
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 687EF81276
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 687EF81276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZA7BILA_-We for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 10:14:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F298880FF8
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F298880FF8
 for <buildroot@busybox.net>; Wed, 24 Aug 2022 10:14:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0913C240007;
 Wed, 24 Aug 2022 10:14:20 +0000 (UTC)
Date: Wed, 24 Aug 2022 12:14:19 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220824121419.792145e8@windsurf>
In-Reply-To: <20220824064548.1693605-1-francois.perrad@gadz.org>
References: <20220824064548.1693605-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661336061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSCvgNzU/eAr/e2RurLK1oCATIcyL4bVHwFsmnAJ1o0=;
 b=bLwIVJ33oF9HnOfOAXNU/wEEJk7Dag8Ednop/x6I0lHr7sWIYL2L5lq/JpqWTMUfyaxPWU
 4xJDMJeDtVtczPp8eBFGsKTfMAXiTaWhKWRNl1NBbOqzFBCzomKvZiwILh7DdwgCMtrB8A
 BINtPiT/kvdl6Pq9Mvd+sLHfnRYpsHZpFkfrlxnQFlJKbtdJI7xGrrEpvLmuKYTFgCW9mK
 XbLUvgvSaFNbmt9twS1xki9TdP3bpjoTXOHMVXoLwfaMWUgjtujJNa4pC2HYV1jVp9itK+
 Cj0RiGS5s1+txTlKKZ34KcX2ULspo34PF/NNqzcmawaBNe/xyhsFgz49cfkzUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bLwIVJ33
Subject: Re: [Buildroot] [PATCH] package/qoriq-rcw: bump to version
 LSDK-21.08
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 24 Aug 2022 08:45:48 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/qoriq-rcw/qoriq-rcw.hash | 2 +-
>  package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
