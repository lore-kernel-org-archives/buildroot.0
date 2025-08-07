Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB50DC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 22:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A704980956;
	Thu,  7 Aug 2025 22:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuPCusbHHdvP; Thu,  7 Aug 2025 22:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9A1B808FC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9A1B808FC;
	Thu,  7 Aug 2025 22:30:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F33B31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E92C8808F5
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmZtqYR8SAW4 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 22:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 57963808A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57963808A3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57963808A3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:30:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4E39513F86A;
 Fri,  8 Aug 2025 00:30:15 +0200 (CEST)
Received: from ip099.116-187-66.sogetel.net ([66.187.116.99:39758])
 via ip099.116-187-66.sogetel.net ([66.187.116.99]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 Aug 2025 00:30:15 +0200
MIME-Version: 1.0
Date: Fri, 08 Aug 2025 00:30:15 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250807205439.1104044-1-thomas.perale@mind.be>
References: <20250807205439.1104044-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <145e51c89dd5eeb529215113601e1203@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754605817;
 bh=5wX0E2YUTc1NwOg1qfyBEB8hMoFk6Qgq2TrXGq/ZZx4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FRN5nzpii76+JvtdK2vh3YAzxYr0jcqe3bGM6irfso9O0wbvlQ1zAdUj704UX1ZsJ
 NXZZtVbAlfljW638/EPPnX56936sIpuM/8821neCOgDRYuc3+mYBpKmlw0XG41FQkW
 Ykeu1rw3Ar6cvv3twMfOakKInxYIFEjdkxaHJB6L4OHmipMwxVWmNLxi/ld4eIvBmz
 uS8LSMxmazopZEz0YZAny6S2nauqkh86apx2B+vxtIHrkMTgXTRAoIIablRdD98OhC
 aUEVdPmn8vHx5TZ5Q+YtsyqXihVB9FBZMHlQA5OAV4apEBUwBQq0Cfl4ASLeZHYtWR
 IGfKVhfeIkCTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FRN5nzpi
Subject: Re: [Buildroot] [PATCH] package/libhtp: security bump to v0.5.51
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

On 07/08/2025 22:54, Thomas Perale via buildroot wrote:
> For more information on the release, see:
>  - https://github.com/OISF/libhtp/releases/tag/0.5.51
>  - https://github.com/OISF/libhtp/releases/tag/0.5.50
>  - https://github.com/OISF/libhtp/compare/0.5.49...0.5.51
> 
> This fixes the following vulnerability:
> 
> - CVE-2025-53537
> 
>     LibHTP is a security-aware parser for the HTTP protocol and its
>     related bits and pieces. In versions 0.5.50 and below, there is a
>     traffic-induced memory leak that can starve the process of memory,
>     leading to loss of visibility. To workaround this issue, set
>     `suricata.yaml app-layer.protocols.http.libhtp.default-config.lzma-
>     enabled` to false. This issue is fixed in version 0.5.51.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-53537
>   - 
> https://github.com/OISF/libhtp/security/advisories/GHSA-v3qq-h8mh-vph7
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
