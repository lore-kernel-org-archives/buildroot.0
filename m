Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBD4C7EE32
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 10:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E27534080F;
	Sat, 28 Jun 2025 10:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vvw6s-YGIHak; Sat, 28 Jun 2025 10:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19DA440662
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19DA440662;
	Sat, 28 Jun 2025 10:08:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 683E4154
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AC32400E9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnMEDeN5zUDk for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 10:08:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6FFF400A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6FFF400A2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6FFF400A2
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:08:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 160AB780502;
 Sat, 28 Jun 2025 12:08:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Jun 2025 12:08:25 +0200
MIME-Version: 1.0
Date: Sat, 28 Jun 2025 12:08:25 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250627153627.1461751-1-giulio.benetti@benettiengineering.com>
References: <e588cb906285e712ff53b179c01b3621@free.fr>
 <20250627153627.1461751-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <f330d58816528e5c69da6763ce31783a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751105307;
 bh=/6tHL8lfvkRqroxnqtPDTy7XUnYbmfcSyUhKFowVt8M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GDGn28lDRJpvJlz1B9AQWENheZWnNBh3ezFEkiSdsc1CM+JQb9/NnT3w1M5cqt0II
 WqGikfM0fiuQdoRDx6rBtPgIyBwGZ8FsC5dFCAzf0EDymeZZnutFn3A/3IQWsg+qmL
 RwHpqFEYt0+U+3hqBzeGCmBdEeYnCJJGbp6d896wFXyNqRxM5uMb/84I/mq7ZqnjAQ
 wcSWW+h7UFKHsKT+aKxSCsBvDprMQNf9nMQ84wP8pLsR+igraQJGwsiUnJncywD0m2
 AA0+DofJKm1hNdjFvt1j+fMCoWtW9I1oxclKXus7wb0Qs5LUZBs0/4WL09bFPYOx23
 lx0rOCWTzLROA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GDGn28lD
Subject: Re: [Buildroot] [PATCH v2] board/freescale/mxs: fix Linux booting
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

On 27/06/2025 17:36, Giulio Benetti wrote:
> Actually DTB_LIST accepts only file and not files with relative path
> preprended. This leads to have vfat without .dtb files and so Linux
> doesn't start. Let's fix this by including slash in sed command as done
> for mxc as well as basename in front of $dt.dtb to remove possible
> useless folders present in the dts path. Let's also add set -e at the
> top of the script to make it more verbose on error and modify this
> section according to spellcheck as done for mxc.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
