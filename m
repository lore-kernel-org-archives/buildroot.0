Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C59CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E2E61672;
	Fri, 29 May 2026 18:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctFBgXgt0PLX; Fri, 29 May 2026 18:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 582DD6134E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780080492;
	bh=cstS3sShn2efZh/siyhM+tXkFNQdxxP1jTr/H6KeLlM=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YHYIOOFbEKd2NUURNy5XaC1ZRqSUo3a9ZjAlLfjGSE9dJ7fV8YeUL74wvm3EhuFD6
	 ai3FTg3MwoBJxVqmmV1quRyo4VyoDW7yIJTw89hZh5dvou8pyehIeIhMONzswzmGbU
	 gE5FqkG3NN2S2pGQhRZpCZI7sLKIWZG2Nmc79NgeK1gRfm9DuLcuedIRljrRQz/IpP
	 POI4aLMUGo116ApHbnDD3obBmElKdlgQ9YQasBsMr93JBwaC8U2YsQJ9Cmy20UhYwI
	 SDPEW5boXsYOifv9I1Zvp+zvBGU/JbLrVk3a16Pcq43G2dOdB/M8Z8Z7iEFPWVMqff
	 WsgWZXtRSxgrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 582DD6134E;
	Fri, 29 May 2026 18:48:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACEA7288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D24F404A2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkIjjPiY-pEr for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:48:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2EA940449
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2EA940449
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2EA940449
 for <buildroot@uclibc.org>; Fri, 29 May 2026 18:48:08 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wT2Fa-0006fs-Cg
 for buildroot@uclibc.org; Fri, 29 May 2026 20:48:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 29 May 2026 20:47:43 +0200
Message-ID: <pan$329ad$675a0f33$beb8094b$c7eec0f1@ID-313208.user.individual.net>
References: <20260501183421.2459291-1-bernd@kuhls.net>
 <ahnci7WYFV3NQ8rS__9339.37163078866$1780079876$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/5] package/stellarium: fix qt5serialport
 dependency
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

Hi Thomas,

Am Fri, 29 May 2026 20:37:29 +0200 schrieb Thomas Petazzoni via buildroot:

> So Qt is used when gps support is enabled *OR* when the telescope
> control plugin is enabled, and this plugin is apparently enabled by
> default.

we disable the telescope plugin by default:

https://gitlab.com/buildroot.org/buildroot/-/blob/
727c2981cb59ebf6a3ee4e3ef03829cc8ae48536/package/stellarium/
stellarium.mk#L25

>> A backport to the LTS branches should be considered, the wrong order of
>> dependencies in buildroot exists for years and is not caused by recent
>> upstream changes.
> 
> I don't understand the "wrong order of dependencies". Is this fixing a
> bug?

Currently qt5serialport is added as dependency even if BR2_PACKAGE_GPSD
is disabled, in this case Stellarium ignores qt5serialport.

I re-ordered, or you can say merged, these dependencies in a way that 
qt5serialport is only used when both packages, qt5serialport and gpsd, are 
enabled at the same time.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
