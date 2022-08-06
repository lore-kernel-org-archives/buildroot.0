Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22997C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 21:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAEAE60F84;
	Sat,  6 Aug 2022 21:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAEAE60F84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6TrmSyaQHyo; Sat,  6 Aug 2022 21:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3EC9608D8;
	Sat,  6 Aug 2022 21:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3EC9608D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 908661BF3FF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EDB2401DF
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 21:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EDB2401DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 135kp2JFwp7s for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 21:26:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2272740117
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2272740117
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 21:26:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B4CB2240002;
 Sat,  6 Aug 2022 21:25:58 +0000 (UTC)
Date: Sat, 6 Aug 2022 23:25:57 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220806232557.547ee1c8@windsurf>
In-Reply-To: <20220804054736.3221427-1-christian@paral.in>
References: <20220804054736.3221427-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659821159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVMwri5bxVMuJYgbWBM9husXxMO3LqjZnd2t0I3XwCc=;
 b=pNxTI3PxWSRbAH4ZFdiptqZ/0M5KaqizzPX/g2qpNR9DbxT/beckaMQ1vyImmZI2Ujif9e
 sC4glQgDtWaeoxBssvwwS0xOWxtfptV93AN/bDuyV/HMP/COnhHQC4uG3azU3BHsQNAatM
 pfiZaScnTq2jqkCvl/gUxTIQlL8T83e5vo0hKPeBOW+/KWdM+5D3SjSlOAWfIGSNSrRHWq
 uJXTxZHs1jMgCxsXuiPWstYgi6ycAlLm3QSrGCoFKLx9GSrZ0MR6Cjyr9ZS9ERmkfX31kL
 XpWBjHSZlwIYiRh+E9gFvWfmymOZJSwfZcCNZB3ZwjHtsXPKoTIE5CJB27V1eg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pNxTI3Px
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump to
 1.6.6
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Aug 2022 22:47:36 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> v1.6.2 -> v1.6.6:
> 
> The third patch release for containerd 1.6 includes various fixes and updates.
> 
> https://github.com/containerd/containerd/releases/tag/v1.6.3
> 
> The fourth patch release for containerd 1.6 includes two fixes for CNI and SELinux.
> 
> https://github.com/containerd/containerd/releases/tag/v1.6.4
> 
> The fifth patch release for containerd 1.6 includes a few fixes.
> 
> https://github.com/containerd/containerd/releases/tag/v1.6.5
> 
> The sixth patch release for containerd 1.6 includes a fix for
> CVE-2022-31030.
> 
> https://github.com/containerd/containerd/releases/tag/v1.6.6
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/containerd/containerd.hash | 2 +-
>  package/containerd/containerd.mk   | 2 +-
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
