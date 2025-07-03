Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EC2C83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 17:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46DFF6159C;
	Thu,  3 Jul 2025 17:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3U8o0H5LHWID; Thu,  3 Jul 2025 17:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7150161599
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7150161599;
	Thu,  3 Jul 2025 17:56:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06C15193
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80E1483BDD
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mLHAnGNGlLB for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 17:56:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1950783BDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1950783BDB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1950783BDB
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:56:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C8A9B19F54D;
 Thu,  3 Jul 2025 19:55:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Jul 2025 19:55:55 +0200
MIME-Version: 1.0
Date: Thu, 03 Jul 2025 19:55:55 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Gilles Talis <gilles.talis@gmail.com>,
 thomas.perale@mind.be
In-Reply-To: <20250703103316.1727024-1-titouan.christophe@mind.be>
References: <20250703103316.1727024-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <b39b416623f43e7ee011c56c8f0a419b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751565359;
 bh=ncYkyyv24FcExRjC6WbbPT9ad34kT5SmgKE0D4aVuPA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L1AnM5G2KytGtxtXCeZHrcsjDqrzSlUssOOVNU4wDt7woVOH77+L2PrAhKbfxzcSG
 ORdc/FDHga+rF8mpfWRYn+3WlbTmQCSqv4Js7T5pgREG4+MRLrRq81wJr3nai/UAYF
 4odYWp2bkHq6wOA2penQJNQZ2oLdVKzbIKdOQZt4tlvfDLtyQg9OHHbv+juzPr0qHm
 kEgwHv4OiVBeY/7ha+tRWZttXptwLZ/6jY54+vZUliBGDIYfCf6fJsJMSiYTFHlB1G
 p4hHnhHcNqOh7AyF3k+ADacAlC0GcwFJtNdCq1jSUQBVQfNiTWKaDI6Thru2Zi2tF9
 bae9L1cdSWqqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L1AnM5G2
Subject: Re: [Buildroot] [PATCH] package/libolm: remove package
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

On 03/07/2025 12:33, Titouan Christophe via buildroot wrote:
> Upstream has explicitely stated that libolm is now deprecated.
> Since no other package depend on libolm, we can easily remove it from
> Buildroot. If any user is interested in this feature, we can add its
> successor: vodozemac.
> 
> More information here:
> https://gitlab.matrix.org/matrix-org/olm#important-libolm-is-now-deprecated
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.

For info, I added a note in the commit log about the CVE being reported
on this deprecated package. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/edf08553ddf1345341743b02d767978c941bda0e

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
