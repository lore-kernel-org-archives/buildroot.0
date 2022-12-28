Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8570BC4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A844402EF;
	Wed, 28 Dec 2022 19:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A844402EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PVkaM2GmU9CM; Wed, 28 Dec 2022 19:53:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387CA4027B;
	Wed, 28 Dec 2022 19:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 387CA4027B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D57421BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1007404AE
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1007404AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQ5oXwXGLW4b for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:53:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6606440002
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6606440002
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:53:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7C792E0006;
 Wed, 28 Dec 2022 19:53:47 +0000 (UTC)
Date: Wed, 28 Dec 2022 20:53:46 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221228205346.51d5ad72@windsurf>
In-Reply-To: <20221228180053.3412707-1-giulio.benetti@benettiengineering.com>
References: <20221228180053.3412707-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672257227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwF1Mg4DrMEFjr+Rm+KVkHzn1xvIzxginX9MsGSTvmM=;
 b=E00FIrUOf3Let05QfqDLVqO39bJr6UQfbxlrcg5S90wvHDxXl9B5+1OjhqdSD/kuR2Me1+
 WclJCtGOvuRbzYOFnpE/lNAICO5y1vfMfmRPN5+9EekmBB88CK9UfjT3JsILSvbNSYJe0Y
 zBY6I3ksBioGnzsL9wzJ7IXXTxQiS3l1Q5OEOT5Y0QnH9no98q3EkI7VeCPhn2OIXwbuRt
 dFqLYGUG09uhpt85Hk8p+tuoM2YomT4decAc1LHUf5V8BMjhJE2BThTyRtOpwx94tW3GKC
 QJClyFwyepdm+FYIAj2od4ipuUjaupIGneASpUGZLNAKqL9He7ItgXrzu1TE6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E00FIrUO
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: fix build failure due to
 function and data types name conflict with Linux
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 28 Dec 2022 19:00:53 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patch to rename local sha256 data types and functions that
> conflict with Linux ones.
> 
> Fixes:
> http://autobuild.buildroot.net/results/7a85a1e6df55bbb4dc6741821c849ad7ee5059af
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...e-due-to-redefition-of-local-sha256-.patch | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 package/rtl8192eu/0001-Fix-build-failure-due-to-redefition-of-local-sha256-.patch

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
