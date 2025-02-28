Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76926C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 23:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 494B384A93;
	Fri, 28 Feb 2025 23:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Knf65-N7-85; Fri, 28 Feb 2025 23:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A21484AA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A21484AA9;
	Fri, 28 Feb 2025 23:07:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A81401CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C6A442F75
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fb1237aPCgZ4 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 23:07:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0EB842F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0EB842F74
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0EB842F74
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:07:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id F1AF62003BE;
 Sat,  1 Mar 2025 00:07:00 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Mar 2025 00:07:00 +0100
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 00:07:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250217114018.1876535-1-james.hilliard1@gmail.com>
References: <20250217114018.1876535-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <2929eb40d8c74ee40e1b06a94464eedb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740784022;
 bh=dGuE2X9t2HBfqVzUG0VsAWcqt9TI62mtfzwh+nrLb3o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gtS7WhpU+IjweJ8YLhJe3FhuDHC4xAPa3mwt2H/iIGKUJgkYGpzuAggOr9ya8xcky
 2agU9Enhuc53SST8C8DPMFFesmFT1/rVXCiOblQJGeCFQtiuXhs7I86U6LflxhEz5G
 W/5I5ylBRFp3NeuRjoULkjvD0biMYSoDW3G6I5byLcSUfMpty4SahovXX82C3OmUyf
 LT2zvo/rLHpVwNijjDNfVT12+31V7THAzTZici7gv0H9JQ5sM2EEaJa2Lqww4kihnz
 GyfIbudz2o5T2a+fQl1/gVzJKNkhtVZ/0+klibCJlVAqvUSbvAIZ/OH9NHByKfS9X7
 Ey3SfBOg5jiAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gtS7WhpU
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.8.2
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

On 17/02/2025 12:40, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
