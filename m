Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983DDCCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 16:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C2F280415;
	Fri, 10 Oct 2025 16:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhMFp2cHtzzt; Fri, 10 Oct 2025 16:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 616EB803FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 616EB803FD;
	Fri, 10 Oct 2025 16:26:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 322FE226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0926D400E3
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yrR7YmKltaQ for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 16:26:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1637F400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1637F400E4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1637F400E4
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 16:26:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F06956012D;
 Fri, 10 Oct 2025 18:26:28 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 18:26:28 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 18:26:28 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20251010125356.1245450-1-thomas@devoogdt.com>
References: <20251010125356.1245450-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4dd2d2235443be2742b8be56702a8f46@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760113591;
 bh=TshHBKZOsEW36yOmPYY3Y+5PK3AKUtpXtQq3hoEBYtY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tBmmoG4m0JWridpnFvtOMP/xuBko9exXhNtreWQmQGOvyC/pb+po3qpZGs0TmwjoU
 qewUEZXZswrgFdXW82QNmaOdKWW1iIK1VVUEISU7Udb026UVveXVxGIeu6OjLnDWBq
 Ti54TfqFH0XQd8T9xMiEpmPzObhhHsA1GGi3MgyqvaBKVYYitumGbycnOoZDK2aViP
 MmEh6Hgidi3ho7RSmBmEMpiJPH7FrPd/v2K9CaCQlxWUp868drBeqL0Dph2t2SDED/
 rwJlR5sBqQaFXxgpLIhGVwgYrwW1hD/3lOTSzUmHJS8bpbOVbxP3ArK6kzhXy+QVDf
 HC9RQE0ewrFKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tBmmoG4m
Subject: Re: [Buildroot] [PATCH v1] package/libgtk4: bump to 4.21.0
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

On 10/10/2025 14:53, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> News: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/NEWS
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
