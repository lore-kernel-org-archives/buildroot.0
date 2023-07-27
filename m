Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B733FC001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ED7C417F8;
	Thu, 27 Jul 2023 10:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ED7C417F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JP6um189aXuS; Thu, 27 Jul 2023 10:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A811E403CA;
	Thu, 27 Jul 2023 10:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A811E403CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60DF41BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A5B060E74
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A5B060E74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNMr0pSR64qL for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:31:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 240CE60BF9
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 240CE60BF9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53BCCFF803;
 Thu, 27 Jul 2023 10:30:59 +0000 (UTC)
Date: Thu, 27 Jul 2023 12:30:58 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230727123058.778a3a92@windsurf>
In-Reply-To: <20230726191158.24460-2-dalang@gmx.at>
References: <20230726191158.24460-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690453859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CR1ChwHa4M5fFk/GmQ6w7wbgzmj+aRE+0R+QoRUm0p4=;
 b=VQ4VUGoHH8AKGzetb1vD8DNKZr8B4icWGbCFDZkYttbZKyEdpO1oZQYFvP0TRPyqYCII+d
 mCJnVVDz+42n3/gtX9yRYXtnm52Mcvq8DuEIe5/RGophoJOzuh0PbLOvhiglSfkjeZKkDY
 s9bAqgdveICsXyQti5OBg/NzPPQZVRx80X2oGL8/V61eWub0rd5qh3J+af/+xcFBtB41Dq
 62q6vGRUW+oyWTvoDdfJjtC3VOXAzyKi6qsqgHd3w5D+c/7j8B64x5X2jTzynJfafwQx9F
 zsV6Wyf/QiNQ2CPc4NRKczmUqivYAW8LxPuSMdVbRzazzfMbttDx4mkHQs7bMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VQ4VUGoH
Subject: Re: [Buildroot] [PATCH] package/llvm-project/llvm-libunwind:
 depends on host-llvm-cmake
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

On Wed, 26 Jul 2023 21:11:58 +0200
Daniel Lang <dalang@gmx.at> wrote:

> Fixes:
> - http://autobuild.buildroot.net/results/e3efaa66f1719db48780f7436f66b56c1f76fd82
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/llvm-project/llvm-libunwind/llvm-libunwind.mk | 1 +
>  1 file changed, 1 insertion(+)

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
