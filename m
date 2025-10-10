Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392E6CCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 11:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10E2F833CA;
	Fri, 10 Oct 2025 11:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moiJ7gSW7eC3; Fri, 10 Oct 2025 11:43:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 254428430E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 254428430E;
	Fri, 10 Oct 2025 11:43:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16EE9119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08EFE8430E
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuTOqKFOkaF0 for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 11:43:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40148833CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40148833CA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40148833CA
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 11:43:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8833F13FA39;
 Fri, 10 Oct 2025 13:43:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Oct 2025 13:43:09 +0200
MIME-Version: 1.0
Date: Fri, 10 Oct 2025 13:43:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251007204919.3783289-1-bernd@kuhls.net>
References: <20251007204919.3783289-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7f5e181d1aa2d8bb9a60f660d5856d92@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760096590;
 bh=jBuxojjq9xY2WSMXfen/bHlArk6RGiM9pcYIRbq2sdE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W0UqVPmQ4x9LVuu/bekHVAM6XfKwDcaE7doz+L7IlCn6gUqovcnTjO/lmzYIZw9e0
 gG3PdpZOtHFCs1z3W6pr+IUe3qKpPe5JyrUBzgbR1SDWn+vPaQylpGYuN2jvANWwVY
 vnkqrhdd5Ka5wVl/Wp5hDhgXrgtYneWQ7pbwYqoQKm8Ql0Qe80v9/HxWRTh0r6VVgl
 x/vPvYwGg5cip6ttQy5cNs1cxANtJCaOjqEFl1RC9W+xo5o3Ar9wyazBY4VdOduBaV
 VRmwmtLHfN7L27CML0AYD8wrXMULsc0fJ/PUM+Ye/EMwXBJrOCllCYYF46w4Yk1sME
 duodI/h8wD2DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W0UqVPmQ
Subject: Re: [Buildroot] [PATCH 1/1] package/libdisplay-info: include
 sys/types.h to fix build error
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

On 07/10/2025 22:49, Bernd Kuhls wrote:
> Fixes: 
> https://autobuild.buildroot.org/results/2d72feabdd0c9e1c9aa89e6d683d5f5ae0bb942d/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
