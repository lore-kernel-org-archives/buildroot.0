Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0140C83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 21:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F4840A67;
	Tue,  1 Jul 2025 21:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2rFM1TpW7Kv; Tue,  1 Jul 2025 21:30:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7465C409A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7465C409A8;
	Tue,  1 Jul 2025 21:30:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 229C0128
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 21:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 145AF84A5F
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 21:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUSLJ4MjyYWA for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 21:30:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 221D2847C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 221D2847C5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 221D2847C5
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 21:30:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 0E06E5FF95;
 Tue,  1 Jul 2025 23:30:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Jul 2025 23:30:26 +0200
MIME-Version: 1.0
Date: Tue, 01 Jul 2025 23:30:26 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20250701150331.530854-1-thomas.perale@mind.be>
References: <20250701150331.530854-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <72521cb68da66d3c9755d00e1af60681@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751405429;
 bh=AO05o36FgW4yYrPQMirRhmWeN+7g070XiGYWh+bF7gs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CSiBVzkcD6ZPQa91ZRQGhHkbaLwH4HaNJzUdHgI7gwXoqoz25Z1bzpTWyYEWmTE+H
 h1nEPHctJsANwEowG7s1wT5Ia4LhLIJr6VhsdNUPc18dHGjqV921IgJY7P36fW4Vvx
 8g8WT91RRJqCghXO7CISYcnA/QIlbOJPR80/Tk4xQeqMGKGUhyOK16q/+3QByylppQ
 CQmh/NL2HfVcoDNho4zgxnmFNFMY7b2JsODTl02/zD7vddTbji4hRlJcdx3v/uHG6J
 RcqN4cccXcnpnH1BoYcVzgW8Bpc6NmNN6rSdrx29d/smG+STVYu3wrULu3m+qjJ/uB
 QPrS3bziX35yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CSiBVzkc
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server:
 security bump to version 21.1.18
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

On 01/07/2025 17:03, Thomas Perale via buildroot wrote:
> Fixes the following security issues:
> 
> - CVE-2025-49175: A flaw was found in the X Rendering extension's
>   handling of animated cursors. If a client provides no cursors, the
>   server assumes at least one is present, leading to an out-of-bounds
>   read and potential crash.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49175
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/0885e0b2
> 
> - CVE-2025-49176: A flaw was found in the Big Requests extension. The
>   request length is multiplied by 4 before checking against the maximum
>   allowed size, potentially causing an integer overflow and bypassing
>   the size check.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49176
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/03731b32
> 
> - CVE-2025-49177: A flaw was found in the XFIXES extension. The
>   XFixesSetClientDisconnectMode handler does not validate the request
>   length, allowing a client to read unintended memory from previous
>   requests.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49177
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab02fb96
> 
> - CVE-2025-49178: A flaw was found in the X server's request handling.
>   Non-zero 'bytes to ignore' in a client's request can cause the server
>   to skip processing another client's request, potentially leading to a
>   denial of service.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49178
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/d55c54ce
> 
> - CVE-2025-49179: A flaw was found in the X Record extension. The
>   RecordSanityCheckRegisterClients function does not check for an
>   integer overflow when computing request length, which allows a client
>   to bypass length checks.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49179
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/2bde9ca4
> 
> - CVE-2025-49180: A flaw was found in the RandR extension, where the
>   RRChangeProviderProperty function does not properly validate input.
>   This issue leads to an integer overflow when computing the total size
>   to allocate.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-49180
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/3c3a4b76
>   - https://gitlab.freedesktop.org/xorg/xserver/-/commit/0235121c
> 
> For more details on the version bump, see:
>   - Security Advisory 
> https://lists.x.org/archives/xorg/2025-June/062055.html
>   - 21.1.17 https://lists.x.org/archives/xorg/2025-June/062056.html
>   - 21.1.18 https://lists.x.org/archives/xorg/2025-June/062066.html
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
