Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67B4CCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7663C40D28;
	Sat, 11 Oct 2025 21:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YUTzX44R_TX; Sat, 11 Oct 2025 21:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9F5140D24
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9F5140D24;
	Sat, 11 Oct 2025 21:00:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49FE4BC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 301BF40820
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3annmHgEQP50 for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:00:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F99F407C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F99F407C4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F99F407C4
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:00:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5A8C219F5A7;
 Sat, 11 Oct 2025 23:00:10 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Oct 2025 23:00:10 +0200
MIME-Version: 1.0
Date: Sat, 11 Oct 2025 23:00:10 +0200
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251011092638.488934-1-nemaakhilesh@gmail.com>
References: <20251011092638.488934-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <17a7de89f78972222aefd6926e86cb46@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760216411;
 bh=+1QYHRPSclhfQiyGl1xEmZCn4hrkzV4iwLbUUVFNVg0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U+UvIKlYL0APcqHykMVDtrir2UzMyuDMtOdtPEb0D2zspT65T8YTyiflJstav1lxf
 YOI9zVYQ1i5lMM3CiBuoh1AAjAXlAevnpZ94aI398rcthF3edSdYArbyBRkQyk3csO
 no2rRM1Yys4WxZEOSEH1evFzsxQtZANVZlIYjiQipfMY2ZdPbvnVvW66ory7WV3zOU
 BpTR1DnUbr9ywacIkvkxqZ5Yt/dps1eB3Cb8J1BGnE0aGqg6rhw1TPi8eSkKi3XwXR
 aiPkcaZ1wdY5NWVwnMuaTxdD/GcF7nVf+liFH9rWKCbhnsUlgDFMDbj6lod7h4ecNy
 +s+XDubWhdsDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U+UvIKlY
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: bump to version 10.2p1
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

On 11/10/2025 11:26, Akhilesh Nema wrote:
> Release notes:
> https://www.openssh.com/txt/release-10.2
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
