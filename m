Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71BCCCFA00
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 17:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11BC141F79;
	Sat,  1 Nov 2025 17:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JWWFwLVrnIx; Sat,  1 Nov 2025 17:03:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C38D141F07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C38D141F07;
	Sat,  1 Nov 2025 17:03:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1DD5222
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3A4F4087B
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XhB7YFBOB3L for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 17:03:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C642B40853
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C642B40853
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C642B40853
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 17:03:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B2B305FFBA;
 Sat,  1 Nov 2025 18:03:11 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Nov 2025 18:03:11 +0100
MIME-Version: 1.0
Date: Sat, 01 Nov 2025 18:03:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20251101080236.305350-1-bernd@kuhls.net>
References: <20251101080236.305350-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <0cee964c645af9dd26d51adaa2bd87d3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762016593;
 bh=Cmra0GGe164ZIau0wRblikegU95feQNZ6dy5cHRuAJU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aZwV7iKzJ+VmKmDa+6Ll97hWA4IZMENtJThHOegOn2ilMpb7QpALsqGozYKJmqMXP
 X+JVGsQT3pdUVUh4CoKm7kRapji0HMXLlDhpTji22TQYR5NOSmUu4nt1X4ACzrYjJ8
 et0fOQWmTAGJVCd0fJETKp1+WnJM5H1c2GrGok05M1mf4d4NKbPig67xWhk5tSVK0K
 nJmln7HQltD047kRxJhKQW+SfqCORtzyZmO9nTrhtGWaZkp3pVMkK/uN9kSHgLnmtz
 jy2vIpu4WKXyOJ0jCxxj+thrrGy4AClsmf8/dm3Jlj5PHezMPtdZEbYH7SSIb3yn9t
 xCWLinEy3Uf7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aZwV7iKz
Subject: Re: [Buildroot] [PATCH 1/2] package/snmppp: bump to version 3.6.3
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

On 01/11/2025 09:02, Bernd Kuhls wrote:
> Changelog: https://www.agentpp.com//download/changes_snmp++v3.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
