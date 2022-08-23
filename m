Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A71C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1471B81397;
	Tue, 23 Aug 2022 20:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1471B81397
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCaBvtf3xAZC; Tue, 23 Aug 2022 20:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A82381390;
	Tue, 23 Aug 2022 20:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A82381390
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39D9A1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1481181397
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1481181397
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NDy4KUHtPviw for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:20:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A52F81390
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A52F81390
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:20:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BC7FC240007;
 Tue, 23 Aug 2022 20:20:34 +0000 (UTC)
Date: Tue, 23 Aug 2022 22:20:32 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220823222032.437c3c45@windsurf>
In-Reply-To: <cover.1661071280.git.yann.morin.1998@free.fr>
References: <cover.1661071280.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661286035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7g/l+FE/DALINLO/gcUQNMDTzEbiOIjjiwvGwnnSpc=;
 b=BsIQ35Mf6M0QE3UEPepBVYs7AUY2Ht0opgVI/pgIc2dEgs/0fJoNYBPYEpR+USKwM/X/Te
 y+ElvZV57kycM9aX8gTTdTjJdUzNnioXnZymGYMKF6PSL1UvXXTgFLKrQDFTBjlynLN7Wn
 /A6PT5YVudtkfqMR/M/GwaigunhvROnP6nxCQP/MbY+ues1ygwDS5qi3BsQivD2vjBQXnI
 Cn1Ms3GsSANIIbsgaetclyjKwf1QOG2whmjSOypCogJY+Yn+eWKMEAhiHae053TNCdcYPj
 JzVLEFFMEDlEq1YrWbcvA8zcjz1+CEdYjiFNJ29NjfTRgsY6nFMnS/ctfPHdJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BsIQ35Mf
Subject: Re: [Buildroot] [PATCH 0/2] utils/genrandconfig: fix host-glibc
 version check (branch yem/gerandconfig-fixups)
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
Cc: Peter Korsgaard <jacmet@uclibc.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Aug 2022 10:41:25 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

>       utils/genrandconfig: fix checking host glibc version
>       utils/genrandconfig: dump traceback for unhandled exceptions

Both applied to master, thanks!

Peter: these commits should go in 2022.02.x and 2022.05.x. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
