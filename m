Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9749EFB5164
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 21:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 442FF810D1;
	Mon,  6 Apr 2026 21:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37xeucA2ilKu; Mon,  6 Apr 2026 21:32:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55A1E810C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775511132;
	bh=+VMw/tpGUuDLppcYlbAK/gKj0zvbwxea3cdX8ZyDwEw=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=R13dROaLl8B4DX2uxeRHY0WH3OqLgx2Es5e8jBZktKYu/GKYt8Oju+qmRlRfWHbaL
	 Xm3xYL3KiErc/MxcAjuWa/YMb4aGNTWazpcmK8EsMjRTXdYyCX6c4zlMAaDzoBpBM8
	 Bk+9ljVBmRPLBFap+4i1rpwW6aquwPYZqDtN0SyRRm8IkloGQfBdA8ARNmuFfbiCUb
	 Wd2YRFiMsVG03RIowdfonZbjxWgC4YuRaUbuJtU0OSoi7g0ujTCAt5kSRukziF6Rxs
	 mi/hjT9jQbMKQKpIKLPkXHw7+zoiGRBrcj2XeNUu1sXLEl0U/lBLlZQK8uXLm/JEax
	 lruCixXTZVWLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55A1E810C8;
	Mon,  6 Apr 2026 21:32:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C19D32EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 21:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B30026078B
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 21:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eaxVpldyHBxW for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 21:32:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 505E2606DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 505E2606DB
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 505E2606DB
 for <buildroot@uclibc.org>; Mon,  6 Apr 2026 21:32:08 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1w9rYE-0009Rw-6j
 for buildroot@uclibc.org; Mon, 06 Apr 2026 23:32:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 06 Apr 2026 23:31:46 +0200
Message-ID: <pan$10161$12bad720$8ad60c39$d03e2a9a@ID-313208.user.individual.net>
References: <20260406184858.1335459-2-fbstachura__44392.4929526233$1775501609$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH] package/libphidget: bump to version
 1.24.20260127
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

Hi Franciszek,

Am Mon,  6 Apr 2026 20:48:59 +0200 schrieb Franciszek Stachura:

> This is also a backward-incompatible upgrade from version 21 to 22 [1].

correct, building phidgetwebservice breaks with this bump:

configure: error: Missing libphidget21; make sure the Phidget21 library is 
installed.

> As an alternative, I would propose removing this package from Buildroot.
> Version 21 was deprecated some time ago and the package has been causing
> the same errors in autobuild, almost daily, for more than a year already
> (see 2024-07-06).

I also tried sometime ago to fix the packages but stopped due to 
complexity and lack of interest.

@Jonathan: You are listed as maintainer for both packages.
What is your opinion about it?

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
