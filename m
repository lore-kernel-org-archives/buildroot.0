Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC12CCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 380FF404F7;
	Fri, 17 Oct 2025 16:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hW1HqcO4wQ9F; Fri, 17 Oct 2025 16:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C3754038C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C3754038C;
	Fri, 17 Oct 2025 16:37:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E58FD8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 802C8403A0
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQJkOl9MRfAj for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:37:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07540400E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07540400E9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07540400E9
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:37:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 38B1119F73C;
 Fri, 17 Oct 2025 18:37:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Oct 2025 18:37:30 +0200
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 18:37:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251016205222.16679-1-bernd@kuhls.net>
References: <20251016205222.16679-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <b539887391197543b7925383c8219407@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760719055;
 bh=yNH8OeY+UsVjnXdQrPZ7PNCft6x9IzyqtS9rQSij1/c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I1AfMq8j3qa/R9I+n89F1NkLhslm4pkM19TMfXCkDdPZP0o9fFQg3O5otl7p0S4bo
 hYulkaOQyQc/KllfhuAMh40bmdtd9duflUlb3jHvo0XyeeVZscFLxqSil7mBdmv/jf
 V9+oKe4IMAcsvHGIyEaOuut0h11qK3sDkLnTL73Fq5k0SP74eQIbPXwUpccq0ccupD
 mEwidIB7wJrU8tpr/2LiajbdG1HEW2gr8YjYwHFdjxXTr+PuFz3pkxt7Jtsz96ulnH
 Z1yCUHKCb2xmkJ2fVzJYp7vfyVbneKShWnbzaVKlazrIvpidNjgKsy1K5f0rMv8PTi
 rUR/bZ4WPcTRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I1AfMq8j
Subject: Re: [Buildroot] [PATCH 1/2] package/python-patch-ng: new package
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

On 16/10/2025 22:52, Bernd Kuhls wrote:
> Needed by python-lmdb 1.7.3+.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
