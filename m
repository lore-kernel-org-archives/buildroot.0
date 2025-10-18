Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6D6CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 10:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D114D834F2;
	Sat, 18 Oct 2025 10:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoUfrcwiDRC0; Sat, 18 Oct 2025 10:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0408B833A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0408B833A0;
	Sat, 18 Oct 2025 10:54:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E65D43F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C19040B9C
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibTRsSfiM6N7 for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 10:54:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 85EF940B85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85EF940B85
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85EF940B85
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 10:54:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 87A47B0055E;
 Sat, 18 Oct 2025 12:54:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Oct 2025 12:54:51 +0200
MIME-Version: 1.0
Date: Sat, 18 Oct 2025 12:54:51 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20251015110230.2738967-1-buildroot@bubu1.eu>
References: <20251015110230.2738967-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <6d088b89f9e179960231c5808e69065f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760784894;
 bh=WemmnTfIEPnGA/HIfG3ZTRlKG73Lj/wgGax51pza5qE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MXaoIhCcHopwjZzmW+YAJ/GcKsD3eaY6WosqxM9hMdQPbH8RGk2UdHGIJ6G1ZmBMK
 Y0W8pXfH9vlAAvUS5TOelsnVds/GUg7UQUeB9mfhZbV9phcoYEWZOcCk1oyc4iTj0H
 kK80V5kZV+PSWuK0oVRJoP7AoPzGDNjZ3Cj5MIbj0Zq5EzRl19+yFbFSkuB42T4YIm
 lDZs6DAvpLna/D+WrgLJqV+bC8yYZzNeCdn9vHLyw2b9mE2QI2j36fdGRtTku7E5un
 bPdNXbqAqvl4fub60WGamJBdGrQWC9mPpUgwOny0Q9+F0GWbGvDVNiGYNN/3/30pwy
 FNLh3Yutzn3DQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MXaoIhCc
Subject: Re: [Buildroot] [PATCH] package/python-jc: bump to version 1.25.6
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

On 15/10/2025 13:02, Marcus Hoffmann via buildroot wrote:
> Changes: https://github.com/kellyjonbrazil/jc/releases/tag/v1.25.6
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
