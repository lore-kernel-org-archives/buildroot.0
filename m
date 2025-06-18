Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337C5C71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 20:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0302660B56;
	Wed, 18 Jun 2025 20:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XCOAlHWkIYe; Wed, 18 Jun 2025 20:21:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 488DE60B5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 488DE60B5B;
	Wed, 18 Jun 2025 20:21:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7FD6E2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9DC360B5B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MZQ-PgmZIcJ for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 20:21:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1614660B56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1614660B56
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1614660B56
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:21:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 183455FF95;
 Wed, 18 Jun 2025 22:21:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Jun 2025 22:21:07 +0200
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 22:21:07 +0200
From: Julien Olivain <ju.o@free.fr>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Cc: buildroot@buildroot.org, Gwenhael Goavec-Merou
 <gwenhael.goavec-merou@trabucayre.com>
In-Reply-To: <20250618054116.1366828-1-gwenj@trabucayre.com>
References: <20250618054116.1366828-1-gwenj@trabucayre.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <fd8478ca4cdf13bfdfd7b5d46143014d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750278070;
 bh=U2FZeUs7pmVdACqn3Swp8Fwbd6FJjssyMGZR0XB+K58=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YrqGCKNfAt9Pj4EV/rztfOLK+vnLeHBVbWZnshrHn/jE+1N/9GMYbr9q1wcvurvjS
 +aOR1sTEMIRHBHkOXoLx1UgbwgPzDfQ61DfQkL/kDyHjVVGm2pDRmpnG/vwiA8amGh
 aOwi3fWpwWSh70P3BaX2ZvLjPubv6xAI+UmAPwo6XMgq00fJB623nGl7CQGPW9mka1
 jYkT2i+uvbT1IlRn+8QxyqeLNxVaoxwr0UuBL4nouial7X0ziBaXg/XNVf1eRLD4dm
 ieSuftcFlb2iFTiTyXObltaJwgcLmS33ogOnYqX8OXxW13X92dLv/zoAgdrTew3Hl8
 rbdRQI37jSGMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YrqGCKNf
Subject: Re: [Buildroot] [PATCH 1/2] package/gnuradio: bump version to
 3.10.12.0
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

On 18/06/2025 07:41, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou 
> <gwenhael.goavec-merou@trabucayre.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
