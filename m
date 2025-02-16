Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6A1C021A4
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 10:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AD5183F5E;
	Sun, 16 Feb 2025 10:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaHxz0AKMiHe; Sun, 16 Feb 2025 10:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA4484029
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA4484029;
	Sun, 16 Feb 2025 10:48:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 357CBDE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 10:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F14E403F1
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 10:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVbK3e3CO7mm for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 10:48:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EC5F40F84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EC5F40F84
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EC5F40F84
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 10:48:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 17DAC13F899;
 Sun, 16 Feb 2025 11:48:52 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 11:48:52 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 11:48:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250214223318.2670223-1-giulio.benetti@benettiengineering.com>
References: <20250214223318.2670223-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3c8df55e761a0faf0c7c5a5da279bcb4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739702934;
 bh=2kFJGNEON+ozc5aGOCyas9eDO87C8+RCKWiofZ+tQ/Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cM2nb16AlCrogqB4ji1ww0t7hgDcgqzJ/6H3eDjy+rRG3Rope24KgdADaq9MgVe5e
 vWuMqPXwEst1yQvhrzZoClFfYhgUD5PH72osguQRcZtNx0x2NAcHLx3OYJTCJPfoHG
 fImb7J3kUxpdidbeDP7IoFUht3onniWsY2V7yq+GjEf456yYNsGofa1JgYuz8JVEJj
 OnaDLuDxvjAygOPd9tNYwLwBuZCAaRrGiobVBQ5LGcqTnJmNAjnBvQsitoej63mTGg
 fFzPosZ5pCmzCdYJFnRnsgENwL7EIppTYus0seqO7GIJpIHtbzQaYhnjQZI6H21/rm
 U4EkD2BKjmZuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cM2nb16A
Subject: Re: [Buildroot] [PATCH] package/libblockdev: bump to version 3.3.0
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

On 14/02/2025 23:33, Giulio Benetti wrote:
> For change log, see:
> https://github.com/storaged-project/libblockdev/blob/3.3.0/NEWS.rst
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
