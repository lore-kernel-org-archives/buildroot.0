Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE84CCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 19:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25A9980E6A;
	Mon, 10 Nov 2025 19:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6N5ucCiZjpfg; Mon, 10 Nov 2025 19:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5436780E4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5436780E4E;
	Mon, 10 Nov 2025 19:10:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 624D525D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6078D80E47
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b926d4zhCqEt for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 19:10:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64E6480E1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E6480E1D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64E6480E1D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:10:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 84C166013B;
 Mon, 10 Nov 2025 20:10:51 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Nov 2025 20:10:51 +0100
MIME-Version: 1.0
Date: Mon, 10 Nov 2025 20:10:51 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251110100954.477496-1-nemaakhilesh@gmail.com>
References: <20251110100954.477496-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6ccaf9e5bafc4ddfa50db721d6d50bda@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762801852;
 bh=8mmweeIIOQ3TipyWhk2VqXlDBlYwx3EIUvpGb6zo0Xg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d1FTvSgTzMlY5BITEd2YYMWIcNY8Z8w6L25CMG0sH22LVNKvE4jzBw+/D5vj0ZT46
 0o1CdexeiBvNAz3vCJSIoRgQd/o7Vt0Ut/wWXVfobJ3N9WPCJLAqyW+giZbXxAPWCp
 61UvA8SNfLNM2KWlc2gWnfczV8e3Hs020cU6vSyXE4RpjjSWF06yDuLPNfHJXQXY07
 XGbo2I71DvJCuI1swdL6yfUKNA5RGwVuzHfdIxHldYtwUNiLt0th7rz36qXKcvwaMA
 RW+UZXmaAYa0yHHxtrpIYt9gfeVMtxzljiBlDQbOq6VjTbPUz9bar8EPZ3r+65koZs
 3dZFmtYJ6+y7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d1FTvSgT
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.401
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

On 10/11/2025 11:09, Akhilesh Nema wrote:
> Release notes:
> https://github.com/vcrhonek/hwdata/releases/tag/v0.401
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
