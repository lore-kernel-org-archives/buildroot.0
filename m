Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC70AC87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 14:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 993CF60C22;
	Sat,  9 Aug 2025 14:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xa0kX9N65V9r; Sat,  9 Aug 2025 14:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD35660BE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD35660BE5;
	Sat,  9 Aug 2025 14:20:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 137A11D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 14:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04FDF82151
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 14:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R88f5PGYehvl for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 14:20:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E39F8214A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E39F8214A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E39F8214A
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 14:20:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2EC7519F5A5;
 Sat,  9 Aug 2025 16:20:48 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 09 Aug 2025 16:20:48 +0200
MIME-Version: 1.0
Date: Sat, 09 Aug 2025 16:20:48 +0200
To: Andreas Ziegler <br015@umbiko.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250808115703.580212-1-br015@umbiko.net>
References: <20250808115703.580212-1-br015@umbiko.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <a79681d2a00b3cb951ba642f5f262292@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754749249;
 bh=/PQo+dQO4VVyMiW5A8aza9dQ+r6D+TK1qj+TOIC/2hs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=frfF05mlWuPLslvDhDH5xr7vLsDA+F8pYVgo387TJf2HSYvxYP5Z7R1JCXi6gRUj9
 X5ha+qa9p/1abZDFA/7g36m1fgpDusRHY7gu/u29BwXoLKcHRQnNMcfWbOZTkHQJXe
 jWR1ottxyOb1UpwJwLD0lLGnrvct+Wqk3eedVuBOnecZdCYsODZWCxu+wKb1HNsmRQ
 HLAukVJsm7/2e9YvRfM8nS4h3pulViyeHoOoMqSsYdcN/4lRLQIJKZSvjuXNJVebZt
 qsLQMcZXq4WMFT1Wh6lBkzgfYUvX2ZLgLjjDCrk0QRPSntCZ0pQE0H//2+t50FXOXk
 PZEu4JmiLCSdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=frfF05ml
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.5
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

On 08/08/2025 13:57, Andreas Ziegler wrote:
> Version 0.24.5 change log:
> 
> * database
>   - fix disappearing playlist files
> * decoder
>   - ffmpeg: handle "*.aif" files
>   - mpg123: add option "full_scan"
>   - mpg123: support seeking on remote files
>   - mpg123: work around libmpg123 ID3 corruption bug
>   - sidplay: add support for PSID files
> * output
>   - pipewire: fix resuming playback after it was paused by "single" 
> mode
> * Windows
>   - fix libfmt error "what(): invalid utf8"
> 
> Tested-by: Andreas Ziegler <br015@umbiko.net>
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
