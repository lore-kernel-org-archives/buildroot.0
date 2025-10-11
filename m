Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B49CCCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F8B540D32;
	Sat, 11 Oct 2025 21:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3KPP-evdT_l; Sat, 11 Oct 2025 21:05:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2931440D2A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2931440D2A;
	Sat, 11 Oct 2025 21:05:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE4DFBC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFDFC40D2A
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6RmUn9JMCly for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:05:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF22040D28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF22040D28
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF22040D28
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:04:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id AD44F5FFA3;
 Sat, 11 Oct 2025 23:04:56 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Oct 2025 23:04:56 +0200
MIME-Version: 1.0
Date: Sat, 11 Oct 2025 23:04:56 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251011093954.537713-1-nemaakhilesh@gmail.com>
References: <20251011093954.537713-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <529fa9a91c68f90e8d3405b697f8ece1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760216697;
 bh=QedJ0LM1gd/MaeUvucSscI9w90ta45RJeMVlbumWJyg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VZatq4NnkOe238qWfPenKkPf+tD16AzjPJ0bHeFV29MiIup6Cmra4dY50s2f3UEzu
 RB4Htm7qt2S2wxgnoV1xd3yJVGXDaqhdG1cGWkAYglSCxnIZz2uUew/7Tw3mdFNsG0
 Ry/gvcjBS4xipucKKqOQhW07FHccv+7jzB0veGEZWNzObXUeQ8gfEn979k589+vm8w
 oXrpXj0eEN2oHbteZRceBbTDwyqUEk+S/tJF6lA1qKS+iW13Rh6u9wDNKKuXlw/OFu
 AIS23+qxH3CC5oGvZQYSS0zSZMNVFI4mcksn7z4BtOmUTTBjk93Kn2a4FmaX5Y5YsI
 7QBnzZ3Y0qfiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VZatq4Nn
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.400
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

On 11/10/2025 11:39, Akhilesh Nema wrote:
> Release notes:
> https://github.com/vcrhonek/hwdata/releases/tag/v0.400
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
