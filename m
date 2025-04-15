Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFADC369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 17:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4176F81156;
	Tue, 15 Apr 2025 17:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgONdmuYyK1C; Tue, 15 Apr 2025 17:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 798F581ECE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 798F581ECE;
	Tue, 15 Apr 2025 17:28:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31703109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B4FB41208
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7m2I05TTUQkN for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 17:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1290405F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1290405F1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1290405F1
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:28:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A267A5FFA3;
 Tue, 15 Apr 2025 19:28:03 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 19:28:03 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 19:28:03 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20250414110341.3044655-1-buildroot@bubu1.eu>
References: <20250414110341.3044655-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.10
Message-ID: <e7a0ff08bc2fbe2eff149d572d16084b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744738086;
 bh=dJRgifJ6rJYfShmF8i6J9fjWDcTWlgI7xbLJPjGRbwo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LQkb3dUk9dHQ6v0ZJCGrq3u796g9Njrc2+Ud039Y0mYVrC6xANGq1cWaYkDs7VP2Z
 5SLezuq03w4KyKTadGC/O66QqtbSvQhg3N/oX2AGKAyEi8lozFoibWnnEJXogWd8gk
 bPZ/ahVF2w+xRmUASFF96Kw+8lapYTPg9QuNFcyWiU0R64ZYKqufuAf8McBwTp1MvG
 3BJB8mYJYc2DEXqKG17ghkrk6rQXdnEDNEM90zH3Jxm8EMKD4QCdWIkzWQd5+EVbuO
 bFV54BTQdaRMbRIXhU34gf6fh5781Ll5te4IDio8rHH1FQNP1HU3aFcal89XJk893b
 c9qXvfecbaV+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LQkb3dUk
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-tzlocal: bump to 5.3.1
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

On 14/04/2025 13:03, Marcus Hoffmann via buildroot wrote:
> Switch the test assert to use 'Europe/Berlin' instead of
> 'posix/Europe/Berlin'. The tz-name is an internal implementation detail
> anyway and the lookup changed to prefer the stated name in 
> /etc/timezone
> again, if it matches the configured timezone via /usr/share/zoneinfo.
> 
> Ref: 
> https://github.com/regebro/tzlocal/commit/4ffac9232bc854a0fa25df9f275a4267fb232850
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
