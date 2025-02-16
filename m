Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B10CC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 17:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C415481F02;
	Sun, 16 Feb 2025 17:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aY_AQ_TEuScI; Sun, 16 Feb 2025 17:41:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CECE81EFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CECE81EFA;
	Sun, 16 Feb 2025 17:41:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C521EDE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5A8E81EF7
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZWTbEMP2YU6 for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 17:41:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9AEF81EF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9AEF81EF9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9AEF81EF9
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:41:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2DB0813F8AE;
 Sun, 16 Feb 2025 18:41:13 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 18:41:13 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 18:41:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216153441.2706067-7-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
 <20250216153441.2706067-7-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a95f234b2eb12de8c8817f43184849dc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739727674;
 bh=L6Qh4k9pgsTmzeo9D15XXKvO1BKGU6sxVxlUkVvOI9w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tHUsAD+IpLgZvDpWJIVKiZWULEiEsU/sLMLFseM7KckabgpauXYBh7HeNHUbj6nv4
 rliyUdIRDoxjBEXtNTCwWYmEL9rtezzCjxT6LjhIMlokjRFNR/tstgseFDXR8vtF8L
 rpbTHDCSf8SrXaj0K71RDXO5G5IvX26svqp96HKHbJVw6l4frGoNXbF6Him0sq/ksY
 54nHcLDyQdMgrc/Mwd67zkvpQSyS6SFrkWmz/EvZSKZgh4Z0PQzZc36P9eCdewzlJ4
 UFAZll5il4KueYM4fIEK8G7d41FnS6v1tZ8A2/aBnySajsFzeBlwAqV2bDrqCMiRtv
 CfNeAWR4DC+Jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tHUsAD+I
Subject: Re: [Buildroot] [PATCH] package/xapian: bump to version 1.4.27
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/02/2025 16:34, Gilles Talis wrote:
> Change log for version 1.4.27:
> https://trac.xapian.org/wiki/ReleaseOverview/1.4.27
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
