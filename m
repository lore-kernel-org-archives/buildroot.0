Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D51CF6488
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 22:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 387C1611F4;
	Wed, 19 Nov 2025 22:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZctfQLAhGxhv; Wed, 19 Nov 2025 22:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49917611FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49917611FB;
	Wed, 19 Nov 2025 22:39:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5768B158
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E03140BB4
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vL8qh1Rm_ROp for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 22:39:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18062403E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18062403E0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18062403E0
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:39:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D41E219F576;
 Wed, 19 Nov 2025 23:39:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 19 Nov 2025 23:39:47 +0100
MIME-Version: 1.0
Date: Wed, 19 Nov 2025 23:39:47 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20251119201857.414683-1-bernd@kuhls.net>
References: <20251119201857.414683-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <f2813947daa598cb040edd40828df0f2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763591993;
 bh=EwVe2/08rVWjrmanVBAW3owt5GmgsZl49IZip+zZU/o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XUPoyieQNzXLiELVO/tldM1nxojTsyJQWLKzrx0X7tgVvglIAwCT/nAvgSr1fJ6Pd
 9JhFMSIIkxWtUdCMOyilqR6RF8njKlekbyq+k6gPT510q655rK772PnMnYNfVOj7LD
 3T/BbE7k8ZkoFX+Nat0Vbxoj+bgp6rBr7SxUXT2dSY2Ggu/W5RiBUPr0wrDmlIiVMa
 Fksli/KDrNWX8wxV1Tk8kkCxpYgp4GRtsye9skHs4c10ADiqMPWAfAAVKw9Pp4rbMT
 HAZI2xLh7I8dpSi9pHIZ55ytQJ1xGWNHln/L+rG8JxY1ZN3tWvDCkGAjrxc06ImD1R
 suk8NjmGjgzOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XUPoyieQ
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump to version
 21.1.6
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

On 19/11/2025 21:18, Bernd Kuhls wrote:
> Release notes:
> https://discourse.llvm.org/t/llvm-21-1-6-released/88895
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
