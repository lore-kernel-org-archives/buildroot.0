Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF319C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71F3740C4F;
	Thu,  9 Jun 2022 20:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFbvkhi61Z_7; Thu,  9 Jun 2022 20:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 899CA405E3;
	Thu,  9 Jun 2022 20:34:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F40A1BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D6F1405E3
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glMuvbRgDn1F for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:34:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2226C40327
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:34:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5A080FF802;
 Thu,  9 Jun 2022 20:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654806885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L1QRkgb/9ZHT8k4n3JZSjVFV8homIkMRftizp7oz4D8=;
 b=MMA1aXfk68C5hDIJZ94bMaZPIwjzLASyGrIkXRqzATzbmHUao91w1VDx/3M3dF/I0AXf3K
 dojL67uXFEjtr1lULVTUMYUmSdgoT/auypbT2iMhzGwScIZCBPUWkGw72yRft+4+WtnD2n
 qaqD6Y4NsxQijXFH1m+njFU2lexLPHBd+mhYDQA7FsvCJbvsc5dsqfCyxEp8SV0a1OaGDl
 qwUJergHvUPd+O3nZkUcGY/lFlmkvGPCSsfbDXiZDdvSKDuV1ewjuBwDmsEe1hTGC38EMF
 5EHnPq855b10JagNCwtbHGfQmLEHS3gbzrY+e6XmqWXFF3g6xncmU8gwkHA78g==
Date: Thu, 9 Jun 2022 22:34:44 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20220609223444.4885a9bf@windsurf>
In-Reply-To: <YqGyLxqxwd94KHVS@waldemar-brodkorb.de>
References: <YqGyLxqxwd94KHVS@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/openswan: allow uClibc build
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

On Thu, 9 Jun 2022 10:41:19 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> uClibc-ng 1.0.41 added ns_t_tkey
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/openswan/Config.in | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Thanks a lot for this patch! As usual, we will need to hold off a
little bit on this one, until Bootlin external toolchains get rebuilt
with uClibc-ng 1.0.41, otherwise we will get tons of build failures in
our autobuilders.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
