Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1630ECAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF85740520;
	Wed, 17 Sep 2025 16:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CQKq0hrkl8e; Wed, 17 Sep 2025 16:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3441540064
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3441540064;
	Wed, 17 Sep 2025 16:51:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18C8E279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A94F8439D
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:51:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFT2xkWD0juK for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:51:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 152A184382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 152A184382
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 152A184382
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:51:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6F6512003C3;
 Wed, 17 Sep 2025 18:50:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:50:58 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:50:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250916004406.2522667-1-james.hilliard1@gmail.com>
References: <20250916004406.2522667-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <3293620aa4664b0f3066db5c997be454@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758127859;
 bh=y6AO4JdtgVXxTcvaPlMZz+r0z1Dc0iRRVNvq+20J1h4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FKZKygQjh8kRE4H3ZY9IBpKTVvzqc7kV+8TXxdQUaKVHgd18K+1tJlG+f4z+BqgiG
 j2WPRmV+JXh83C2ch4mZWwYLKIlOEgk0jDL5/bYm9hNOJSTkKGSI3VHeUovlcErHKp
 UUFKvjiz0JVaqObENcCPnRdig7A75HwDsZTWFO8CjfbRdOr2AtwuYPJdI81eNV8ztj
 uZbfHbeVplj95luV1PsaPvwpEZgZnkg+T4m+9Uoxy2av/+QpjAzbTZJ05P1VYjpQp9
 6xwnXc0elP2+IgswNtYypygTmXLPBnCHYfQ+ltidZRhVIjLufwf2NrWq4Ytdqx5lau
 U7xrhYWcriDrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FKZKygQj
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pypika-tortoise: bump to
 version 0.6.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/09/2025 02:44, James Hilliard wrote:
> Migrate pep517 build backend from poetry to pdm-backend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
