Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B793CCFA13
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 19:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01BBC405EE;
	Mon, 10 Nov 2025 19:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbfsQsqMChae; Mon, 10 Nov 2025 19:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31E1240580
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31E1240580;
	Mon, 10 Nov 2025 19:10:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88BFAFA
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FBA880DDF
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oeFb2RGZEsJs for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 19:10:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 663B580DD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 663B580DD6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 663B580DD6
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:10:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DCC7619F59C;
 Mon, 10 Nov 2025 20:10:37 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Nov 2025 20:10:37 +0100
MIME-Version: 1.0
Date: Mon, 10 Nov 2025 20:10:37 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Guillaume William Brs
 <guillaume.bressaix@gmail.com>
In-Reply-To: <20251110100500.461973-1-nemaakhilesh@gmail.com>
References: <20251110100500.461973-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <940aa59cd0127cd6f54fa8d7fbaa2e92@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762801840;
 bh=A9AKizVlh7YwZgDz11Q7MQyo+/kjbKC0FXk+98975y0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sIsgn6r516LedAVOu2RmzL+RDVQ43vGgGXe+zgIydxm1tPaZEQBz8KGeAm31AxaEe
 1NFqErZLCeeBk6yol6RTw6tKGbtvyYGgRkd59iszncN6B6PQULxZ8kDncqhY6LFe20
 uFznqttmCj0EgCOiQXxeHTtdgYEyptEEI6w4oi/nNBy+Nzz2OklxwoUZbNk/cd+Ue6
 US0WAY5pd2VcHrE82boxIjvWfXOsWNPcG1IgHrNPJdnmgsCUjWXd8GZA3dF0LXfF1V
 u/ZLf6QQhfEhxic0al8iK+1UtYJDW+F8Fmk//FK6i6OdoapL+2APvc9Y2206A3R/j0
 tHjqzSjDG3kNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sIsgn6r5
Subject: Re: [Buildroot] [PATCH 1/1] package/libxcrypt: bump version to 4.5.1
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

On 10/11/2025 11:05, Akhilesh Nema wrote:
> LICENSING hash updated due to the addition of new cryptographic 
> algorithm source file names.
> 
> Release notes:
> https://github.com/besser82/libxcrypt/releases/tag/v4.5.1
> https://github.com/besser82/libxcrypt/releases/tag/v4.5.0
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
