Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA088C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 14:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A929F60B3B;
	Sat, 25 Jan 2025 14:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oA6-n-IokGrZ; Sat, 25 Jan 2025 14:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACC3F60BB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACC3F60BB7;
	Sat, 25 Jan 2025 14:34:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3EF31183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FEB980BD9
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gkcgxbf_nSJb for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 14:34:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F29C680E26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F29C680E26
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F29C680E26
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:34:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 07F1B13F86E;
 Sat, 25 Jan 2025 15:34:34 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:36514])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 15:34:34 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 15:34:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124184356.3795058-1-james.hilliard1@gmail.com>
References: <20250124184356.3795058-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <28caa0fa6cec0ca01de3a524328e6177@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737815676;
 bh=COYk7KjlRrSuMVvo4ylMves2KioFV+ONUxKQM3gfOJU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kl11DvoG/fesZe7nAIyuST6bMT291F/bmDe3EM9T65ivrdUYtYzJbfqqFnBK7tZuQ
 wZJGn1rOS7qD0txlYSfwHPF4gYQh8JIDJipXQPHnTYTGNQphYpQwo938Ik5oG2MVxI
 VWdskK5wwmIr24HeTAuQkCCVX4szReO7Tt+a7Cwfuc1GTQjqPOfHFSHcq8OMGMMnoD
 N4RBQgnDaESRhITGpN+/R+P41IApekuC9hCgJ1IBEsicCsNeyDkQpkRQOC1z4TZmR8
 JKyFqrPIJQ8AoWl2Zg36lPSoi/CUH3ZbFqoFkxRXoGhlisXiQ3NIRukwqTLDW+j9w5
 z6jB5Stu+hAfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kl11DvoG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-starlette: bump to
 version 0.45.3
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

On 24/01/2025 19:43, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
