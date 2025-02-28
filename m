Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2EEC282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 23:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D07A984A4A;
	Fri, 28 Feb 2025 23:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kybsA8p6NYDe; Fri, 28 Feb 2025 23:06:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDBCC847A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDBCC847A1;
	Fri, 28 Feb 2025 23:06:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA80E1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D96FF84A5A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3NdjOWzmRy1A for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 23:06:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 320E784A4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 320E784A4A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 320E784A4A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:06:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8FC302003BE;
 Sat,  1 Mar 2025 00:06:06 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Mar 2025 00:06:06 +0100
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 00:06:06 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250217115206.1884755-1-james.hilliard1@gmail.com>
References: <20250217115206.1884755-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <04299a4cc2cbcf0b364b1f3c9a997851@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740783967;
 bh=g1TUL6VqyiHXil+8eF7bX85vTmji/RWE0SDmJ8OTwhY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zmpfdws1OjIqhAlL14oGn0G0+VmM1tff3IFDhY1WwRcwgXFK4gDQiL3Z5eftRL7Dc
 y2yoWoWJDW/V/dneMI2xToHhTVDkhllTQdd8HXWOSUcXbGLXlHGumkH2sjkz1t0pP5
 Lyuie2+A4QD4cUd4RzmWQfC5Pnqe2gAk16sTHhIj5FK0mZvdp9PDQFQQq4CEbSgByu
 D+b023hZiJHR+an0HAH1T0Ks4CIb4Y3nFEkzY2xH2Ne1G+W8Hg5HjtlvfpBa/s5PkD
 LixxiGhNJyCmE533d87qw6YVM2PLDUlHFpseR4j0BsUl6+d5SF4/bKJpGRloLcx45N
 t86padAUDyUcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zmpfdws1
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiosqlite: bump to
 version 0.21.0
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

On 17/02/2025 12:52, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
