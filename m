Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFDDC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 200F884AF3;
	Fri, 22 Jul 2022 21:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 200F884AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I9g1VVwjOuHV; Fri, 22 Jul 2022 21:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E6598490B;
	Fri, 22 Jul 2022 21:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E6598490B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECDD81BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B94AA40297
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B94AA40297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTm_vl9u_v33 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:00:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56ECD40135
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56ECD40135
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:00:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6BEFA240006;
 Fri, 22 Jul 2022 21:00:34 +0000 (UTC)
Date: Fri, 22 Jul 2022 23:00:33 +0200
To: Ben Hutchings <ben.hutchings@mind.be>
Message-ID: <20220722230033.673ee11e@windsurf>
In-Reply-To: <Yqim4TOtcyKtFHJj@cephalopod>
References: <Yqim4TOtcyKtFHJj@cephalopod>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658523634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZMFWE5ywhKZo1rr6lS/zfOrXhi+K3FioKZYsf8vqVY=;
 b=TYTloGsCxUr7+Yv3A3Q/Ual6huEa/uya1iRCbooIcLJL9k/hjQGNySOwI4/uAcaQmiTHQs
 bDs7VewuZCOcpH+bR6Ws38Ji5ERBnzTyBMlp9obrSNFhHNVLBfxIvBdhHc/hrBy2bQkD2P
 2xJOV7NgjK4wqES5VO+IXEQtJegRqTJAOZAaRMC6N/9Uto54P4NofY74TO1/xQ69AuLRCU
 nD1sbv2wQGVHsVpP0VikaRHq1RwZf9XX8MTVcVFULN2/BcP054fU1mKB4dNu7bAPmG2c3j
 7fx7k9p9bvfGuzF6pBB1Uh931ylzMj0SZhuUNGCes41PQfbC1H732jdXV0ArBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TYTloGsC
Subject: Re: [Buildroot] [PATCH] package/zlib-ng: Add upstream patch to fix
 build with uclibc
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

On Tue, 14 Jun 2022 17:18:57 +0200
Ben Hutchings <ben.hutchings@mind.be> wrote:

> Fix the following build failure with uclibc on arm architectures (and
> similar on powerpc):
> 
> /home/buildroot/autobuild/instance-2/output-1/build/zlib-ng-2.0.6/arch/arm/armfeature.c:4:12: fatal error: sys/auxv.h: No such file or directory
>     4 | #  include <sys/auxv.h>
>       |            ^~~~~~~~~~~~
> compilation terminated.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> ---
>  ...-sys-auxv.h-exists-at-configure-time.patch | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 package/zlib-ng/0003-zlib-ng-check-that-sys-auxv.h-exists-at-configure-time.patch

Applied to master after adding a reference to an autobuilder failure
that this is fixing.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
