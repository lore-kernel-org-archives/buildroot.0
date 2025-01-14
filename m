Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC01CC02183
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 20:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CF7D80D03;
	Tue, 14 Jan 2025 20:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5hEReQRHu88; Tue, 14 Jan 2025 20:58:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D73C80C3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D73C80C3D;
	Tue, 14 Jan 2025 20:58:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83F6C94B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62C82400D1
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oi7AYi1ZZlmo for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 20:58:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E27D40A6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E27D40A6E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E27D40A6E
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:58:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5F155B0055E;
 Tue, 14 Jan 2025 21:57:57 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50612])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 21:57:57 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 21:57:57 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?=
 <raphael.melotte@mind.be>
In-Reply-To: <20250113185911.3036402-1-james.hilliard1@gmail.com>
References: <20250113185911.3036402-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a005a20996d240016e7fc62617f87abf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736888279;
 bh=kNOLi1a3m0t7du8KDsIJo/h0y9geyvS0ROxtHdREA2o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ToEKifKAbjlWuvHYMfmxTAIe2T6ypl555YmU+g4yCRMU3udaEn0mh98vYueLAxFo7
 ZwTdmCLRn6hbH3NAOpeQfElHE02pzRPktVZ5oz2i4VSQp1qY7JP/d/ftTmS3xNm586
 YTBIWA7GCAJ/QygT7u3tBrvGZSbnZaNbIJ4hAzi/9o2nN2MgvKbTPp54qgdUZ8FW/6
 LsSTMwpVgpfy+toQveqcYqOVV2IeStnUtCS1XMmU1nm7iVWnY6+mAY7litHSnVd/34
 wqDQbUC1FTCKMbACfDZjPo+HjutjAddDGWo0C9w2YH2AozYiLcOojT9gM9jC4KdpT7
 CauDjs+QV0Ifg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ToEKifKA
Subject: Re: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.35.97
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

On 13/01/2025 19:59, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
