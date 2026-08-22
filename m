Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB42BC5DF8C
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 13:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A84F80EBF;
	Sat, 22 Aug 2026 13:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzwleIhyBJQp; Sat, 22 Aug 2026 13:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787406171;
	bh=Dw1F1h7P/34oo9P3Xl/q2epoiXvrS9MdoYxtoFORibw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qhsg9kTot+sXDV1UiWo9kzjuiflIYPEn8zpeakIlu9lVomS8FhUEBKwtLAfLLEvwx
	 nMLFXG4QFFz1STyXO+N+hZdWYpkVnhvXQlg6M19HjMUZ6B82TJ+HqwgD4GftFWF1Bx
	 tTyN+4rsALibnZOqfvneBkU9yIFZ9X+k3zBE6W5VhUdG+tMTyreHoZClWINjkPUFPe
	 NdJ4kqySjUEVLEjy0XCahOjGjYDyOnoFD3HxF9lVTV1Pkg/n2PoPjRvxtGwOrsY9MI
	 NK+4Pcrnmgdyvwnspe0+QWX0TUq9SE+BXXQPcyzXzwUw5EHeihVLS3n37Cengz1jg4
	 oiP4JwCUf1WMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC48E80EB7;
	Sat, 22 Aug 2026 13:42:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 867C429B
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 13:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D4C6407B8
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 13:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MW9x-94_CeLb for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 13:42:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C09E407B4
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 13:42:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 785A019F5BE;
 Sat, 22 Aug 2026 15:42:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Aug 2026 15:42:44 +0200
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 15:42:44 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260820000251.441942-1-petr.vorel@gmail.com>
References: <20260820000251.441942-1-petr.vorel@gmail.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <9d3ab08b70a7b10e9dfba7af9019da2d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/1] package/nfs-utils: bump version to
 2.9.2
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

On 20/08/2026 02:02, Petr Vorel wrote:
> Remove patches upstreamed in this release.
> 
> Release announce:
> https://lore.kernel.org/linux-nfs/dc0f6f41-84be-4a70-92db-89890bded3ab@redhat.com/
> 
> Backport 3 patches from upstream fixing this release regressions:
> 
> * 67ed1bdb ("exportfs: link failure with --disable-nfsdctl")
> * cec8eeb6 ("getport: fix missing stddef.h inclusion")
> * cf80edae ("statd: fix memory leak in sm_mon_1_svc() when existing 
> host re-monitors")
> 
> And 4th patch which fixes error on old toolchains, e.g.
> br-arm-full-static or bootlin-aarch64-glibc-old.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to next, thanks. For info, I fixed check-package errors. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/a0c0208e1bc7ee83eb5a058b6c20b5e2ec6e3c1e

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
