Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9703CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 19:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F4FE40A02;
	Wed,  3 Jun 2026 19:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esWbLJCMeCVo; Wed,  3 Jun 2026 19:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B68440804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780515680;
	bh=ehSDfRfIG4rXgJUAHh+d0Bc7vKcIXGbUc1UeVcUtWZQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pS/JVN3P01B1bMUGh1klmCxlkLHiBxjXEENPDscTJAwRuMq5KTWk3z8U8PcnJ1ntG
	 LOfEfmvdfVvusH3jMVkxDjc83ik6qcDp1BVqpY7+GDO9jsr2JCKM1wxZGVxjjCwYeK
	 ZRjM86gon0Jcp6pfDeb59sEY529ZVyt+LDLlCgvxRh+bTRmo5F2pybD4DPGW+eBuQy
	 iI7Eh+MbD/ttCw2g0LIiH2NU6Lx1ESCo7qYPAfBQAkd5rdlC7ToCY9r5oPEmwwh3q3
	 4zBHDRvdmtj6t8HjiZ3orMpmNd9ByivYtedotrkueU6x9jddVkG/WxnUPla+sjVd14
	 Z9UAWXX9pA0Wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B68440804;
	Wed,  3 Jun 2026 19:41:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFAF5DE
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 19:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4D3740804
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 19:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CeYNSiKN1jtP for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 19:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1460440515
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1460440515
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1460440515
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 19:41:17 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1316460530; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 19:41:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUrSc-0000000EHVs-3skw;
 Wed, 03 Jun 2026 21:41:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260603180728.1392826-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 3 Jun 2026 20:07:28 +0200")
References: <20260603180728.1392826-1-giulio.benetti@benettiengineering.com>
Date: Wed, 03 Jun 2026 21:41:06 +0200
Message-ID: <87se73l8dp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=nWU47T29Tjucf8ZCaUyYqIQaT3eQelPws0U8RZNDwFYPRBrUAbwcaQGx7KaBHIvX51T/CduwfuAAyErQ1RtYflFez5kY9/4osFwNXBnFrTlPue+Hr3SzJNu4JeJI3yb66XqFJOJdPzke77KooDIMr0IExvRWF300Dd+KqmpTZ33wCy3zbDwGDhhNV3BDXMNecU6JDfl46G10kxlwxl5nEP1IZyPMuERGe1Q57xbqM2s3ZPUJgPtk2APuouyGEIRhW6kjAl8GtBLTyustauhDilYcK1ckcJvUdDyBqVtUwNbwpKlVvZBPDyuurhIG6Euw8eqCXEuv2TYwQ1j/OVOGRg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=lHxLQ1xxfqLe7cQNNFJSH3RQe/DwroCWFkbSaeqMvww=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=nWU47T29
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: don't treat warnings as
 errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > This driver fails to build because warnings are treated as errors but
 > this is too strict, so let's disable this behavior by setting:
 > KCFLAGS="-Wno-error"

 > Fixes:
 > https://autobuild.buildroot.org/results/df3763e74de4071331a41140fb5528523af9e374/

Committed after adding some details about how this was (re-)introduced
by the recent revert of commit 6b56e0b4f0 ("linux: disable -Werror") in
commit a966f5cde5, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
