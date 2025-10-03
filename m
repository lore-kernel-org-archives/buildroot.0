Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850A7CAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 17:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E76613D0;
	Fri,  3 Oct 2025 17:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zjfyz46Ku7y4; Fri,  3 Oct 2025 17:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B8DB61214
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B8DB61214;
	Fri,  3 Oct 2025 17:34:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBDB691C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B246780AD5
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8UIHeljVBqd for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 17:34:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD1E580AB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1E580AB9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD1E580AB9
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:34:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id ED8B62003C6;
 Fri,  3 Oct 2025 19:34:33 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Oct 2025 19:34:33 +0200
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 19:34:33 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20251003125400.75799-1-titouan.christophe@mind.be>
References: <20251003125400.75799-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <e5028f56290643b58e821d82e9ac1323@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759512875;
 bh=TnJw6q5drkelU+Rg4HLnv192bQOBvCtWuINX50ffFQc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cZbqsUAAfH+k7ADmlw+iL9zcx3rMlq4a41oqbzhohf6lhiWSX+DNeSiiv68RLHGrF
 7g1AIMrq91ZrcbvOTJFEbYbs78LGDNQL6WbTIbcNL0JHbYp01Cz8GFF2X5Lm9cl33n
 doEMUJNygwGOfgUAQclwz+dNPYjy/8YzgRGjbz6RCuETAjvyiw2EIDx0JaI2DcpQRa
 9T9Hm9/oy9qhAXndOqi3V4M37Q9ZDqmAiOyeC5wZs8L5wQV2LLGTWQeYRlkJ80RYjU
 XAT/yUapU9TJ+DR8WhhIHlhiF6ElKP6jKkIDM8jofjzJbwHeoDn4IeqX0/ZUakr6Cx
 VLrNakX8BeviQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cZbqsUAA
Subject: Re: [Buildroot] [PATCH] package/raptor: add patches for
 CVE-2024-57822, CVE-2024-57823
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

On 03/10/2025 14:54, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerabilities:
> - CVE-2024-57822:
>     In Raptor RDF Syntax Library through 2.0.16, there is a heap-based
>     buffer over-read when parsing triples with the nquads parser in
>     raptor_ntriples_parse_term_internal().
>     https://www.cve.org/CVERecord?id=CVE-2024-57822
> 
> - CVE-2024-57823:
>     In Raptor RDF Syntax Library through 2.0.16, there is an integer
>     underflow when normalizing a URI with the turtle parser in
>     raptor_uri_normalize_path().
>     https://www.cve.org/CVERecord?id=CVE-2024-57823
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
