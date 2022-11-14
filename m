Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E21EC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 21:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A3398133A;
	Mon, 14 Nov 2022 21:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A3398133A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hE2vmpu1Q19F; Mon, 14 Nov 2022 21:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53FC08125D;
	Mon, 14 Nov 2022 21:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53FC08125D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4461BF296
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 21:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70B5240336
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 21:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70B5240336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aorFgtdcknPO for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 21:14:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF3984032A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF3984032A
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 21:14:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DEA3C1BF218;
 Mon, 14 Nov 2022 21:14:36 +0000 (UTC)
Date: Mon, 14 Nov 2022 22:14:35 +0100
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20221114221435.2d17a891@windsurf>
In-Reply-To: <20221114135126.20201-1-neal.frager@amd.com>
References: <20221114135126.20201-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668460477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OUBMQ4/m9tb240Upqj5XcJVzUnHLHH/NbAxt9f4DROk=;
 b=gfDPOx1fEniyDY2IL11hvk8HH7ImMqQR+qXSSz9DsThedwcErxVShgmXY3z+40S3gtZ3Gr
 Mh516ZgYy3eiDq1jqv87OjtmpByXolHrgBUf04q1HyM72gCz7KVXijQYUInvkvexsh9Z9s
 x3YFOoLH/VwsD9gqZFUr1Xvdis1rmCwYqxHa6Ab8q6z4W3rrkwHg+WCFhPmgisAxW2UmkE
 b/ogqVtscu89ZRZrWUEwQKW+eCKXLr7cfOI/iuSKeYpRMZNvBVqtCo5ml2jL8VyDThbvz0
 h8vXUnWxfjqsSsDryDM7hHDK5puQlN+KPkMc1KenEvZ3ADLVWBrOgO9KQTMMSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gfDPOx1f
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp/kria/kv260/kv260.sh:
 fix u-boot.itb without CONFIG_MULTI_DTB_FIT option
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
Cc: Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 14 Nov 2022 06:51:26 -0700
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> This patch fixes the kv260.sh to generate a working u-boot.itb
> now that the CONFIG_MULTI_DTB_FIT u-boot option is no longer used.
> 
>     Fixes:
> 
>       https://gitlab.com/buildroot.org/buildroot/-/jobs/3310463281
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/kria/kv260/kv260.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
