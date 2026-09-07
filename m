Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BAAC79FA0
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 18:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA67A6067B;
	Mon,  7 Sep 2026 18:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tchu4FSma6hL; Mon,  7 Sep 2026 18:27:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8981E605DA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788805665;
	b=Xpo9I33f6tjzTj+ys7ffJitznnRmQ1JdoxDWmw6P/a8+zawSUCuEWNcDgW+5hWj2ETEK
	 Jscy5wRbRXCP35ueN4nYhbv5WbgPD74G6XAzX3J7UgBNbzgufhcys2UvLFMJqp/mhNZVF
	 0liJZbRTGZl4V3CLKJjgmNW9H1Oh+50aSTHfYx9uvcQEy9OqGOSpOGqZh6gf/WmXwH1Lj
	 jUk/sLmtgzeBw6ZcDRUbpgvc1o5gSR8yJoxd6QsVwFQ8YDKiHvJfQBv3ZVKForOPrubCT
	 bmaXWL9qrCBnD/rJDGsUPLtDJwiKNmZ7tWr6bXqfGpQvLVSvx4Dvk0wnCiHPIg4oFDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788805665;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=VVNuJ5yzmmVdaj5B43Os32KtZnP9eCdW680LKJOnZpI=;
	b=TZ9/fcrXpkf7Tfbgs20PCm6cRFIAcfWqVmo95/es/45Ik7jW83GHgB4UK/LpMR2p95Og
	 Wp3DjmZ5FgjpS7BH8ELSF/FYr6p6vTwK5+7HvI2ptVeIo6wXe2RYT7OLca1qIUrUVqlkH
	 bxTYu4HxTXeH5gpOaGvlVNe4wjQRThQzf9h9a1lf6Z2FHVHJB+BDxop9fqaw2+420p0S6
	 cb1n7/yhi9qt26ySsIx1mfiHxDBgDcsM/U51qanagsK1nVUhj/4UQd3v1ZgmkR7K9SP73
	 iywcaGLDj4EdT+6qyl4tWvjdiztLGX3BqTYlVYJgf1prWHWIafGglt5etvkCgmbS0eg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788805665;
	bh=VVNuJ5yzmmVdaj5B43Os32KtZnP9eCdW680LKJOnZpI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NSNUI3aS2YZzyVjcok1QiTm2Tv3MzXXBNllXSSeW14avrAc6zlycK124CJa6S2zma
	 abm2ZX4ExD2gQ5b7UAeEqu542EUThViVnhFhxjifur9E5NKaXwS4Sp+LWg+Eiih8kG
	 KG8EXl7EBssNHFq8y2z5gdcE9BzAAFUSu4AP/q3QadXayKe+S0t/y5xfnrEHTNad7P
	 YMCESF6VT02YdJ11AeHcOMbaaLux5Q/3plgCSiXGMM3ed7EeOgOv0tewOzoJnzBhZ/
	 3ZAa2yk+zuhpqLoguB7Nqnmk4LI/feZngrywWstIWJBx+btY1lvjGc6sOtABhhY0Ma
	 hnwP3lzpqqZnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8981E605DA;
	Mon,  7 Sep 2026 18:27:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53ADF388
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4596E40070
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLPXP89ItMEY for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 18:27:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CFC314005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788805663;
 b=OPAZ+sZMcyDEHTpnm2gLGUrLY4fb8e3XZc2tN2eHepgea089ibxXZoAIKR9KncDSJ7ki
 Rg/MNUfAPMACtHHh9Lh7osMtBZVsjYjUFb9/i27r9fN4XxPKB0kzXzU940IIy0EZSNjS9
 yMnvXOgG79XtfLJ8BsuLL2lUAz6CudNBytnZJP4pW3dLrdQJglvfVzkMkVZtX/xzFEn2H
 4oF4cgWW3Oz/hWMp8MNh6FOz2P45Ut+ZpNPxT2WUfZw5Z+yR6egrKSiwVEVdAZTheAhOf
 tqMUZFZrAUadkCbCb8fBDKkC29+k7bs5FE3heGmvOn8sLmQ6dY3SV9xHT4sXx5OGbZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788805663;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=d5T6b/d6ZBndmjuoBzuCayO/M54UNJyiP5mEgjxd/cY=;
 b=UsCEsC+E7sNE0Xg7Y7FrFnpm98k/+GYF7z5y+oK+6FXpFsAjrn1zrBwPzVC9PfNVWBDI
 e7SEkGmdbnrGIKr6qSQ3T+h4xtNN6AHfrY8o81xNcZpdZO/sVX5jB6CtZ7bVahy0Bc0ul
 tsxWAPk1iUmus55P0SOaGIJ8NfOipnmc7YmcrVcwEylx9330JGVVpukxcBS7ChT0o7wij
 Z6/02Vx8BBjT3SbgsqA+BASJvYhDO+C0gpgV7XmKZTCuXyJCb8Usw9LTMxs+ZkuSx5RM8
 AHM7IJYHA4YNoBCOl+OvYVJLNMEXNzqDWuieUKPmzO5qqu5cNW/cCM3vBbxm3MnWPlQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZOI6Sov8; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFC314005A
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:27:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D5E2B78034D;
 Mon,  7 Sep 2026 20:27:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Sep 2026 20:27:37 +0200
MIME-Version: 1.0
Date: Mon, 07 Sep 2026 20:27:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260907110454.1071513-1-bernd@kuhls.net>
References: <20260907110454.1071513-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <b28ebf4f55176c4c8134e4eb131f29e1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libpcap: security bump version
 to 1.10.7
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

On 07/09/2026 13:04, Bernd Kuhls wrote:
> https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.10.7/CHANGES
> 
> Fixes the following CVEs:
> 
> CVE-2026-0799: Access M[] safely in the BPF interpreter.
> CVE-2026-31912: Mind the program bounds in pcap_offline_filter().
> CVE-2026-31911: Fail opcodes safely in the BPF interpreter.
> CVE-2026-6244: Avoid division by zero via pcap_offline_filter().
> CVE-2026-6554: Limit "ja L" looping in pcap_offline_filter().
> CVE-2026-18313: Fix a memory leak in rpcapd.
> CVE-2026-18238: Fix RPCAP_MSG_PACKET validation.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
