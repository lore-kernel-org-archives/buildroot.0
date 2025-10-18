Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D85CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 15:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B5DD816E0;
	Sat, 18 Oct 2025 15:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0kujpfxNTV_A; Sat, 18 Oct 2025 15:59:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 412C4816D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 412C4816D3;
	Sat, 18 Oct 2025 15:59:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B8F7D8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 15:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3245D60BD5
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 15:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAhWpSSLK0Qa for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 15:59:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F81560B1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F81560B1E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F81560B1E
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 15:59:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4D0B713F88F;
 Sat, 18 Oct 2025 17:59:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Oct 2025 17:59:15 +0200
MIME-Version: 1.0
Date: Sat, 18 Oct 2025 17:59:15 +0200
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Eric Le
 Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20251005-waffle-v1-1-4aab4f497a8a@gmail.com>
References: <20251005-waffle-v1-0-4aab4f497a8a@gmail.com>
 <20251005-waffle-v1-1-4aab4f497a8a@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <deb2e73feb27f480ad3dbb1e70939021@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760803158;
 bh=mRL/HVdCG7s27UCw5oIdGiF7ExZLYdXlXssK6lzNK+Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=haIjYwGREVOaTegAfsnYlo2qXV+cr/o/LAZEHj21j7qQ2SvPEm3z1AykC5DqtTTTy
 EuHeRF6FaQnOAc77B0103crVx7vj6+ZZXLY8yG6Gm+M64waJIYsjkqAZkNXJvSkx0k
 yJqOKHU2SZ+t7l6/YjdL0o746vHg7qUnegmFsa4UG6CFeXv54yMDM+6dWRo6hwLGlg
 gZDl5t7N6SO/nmBDbeqklJh2ea7Dmwk6jGViPmzbXHoBouSc/QjHRR6e82dAha4InV
 y/6gcA7raSQwSYAr+Zkt4+Pp6cfJ7YoJEmCsq+R7n1CUC+U8+KwNDYERpdldHLP6OM
 8HC973jtaOdHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=haIjYwGR
Subject: Re: [Buildroot] [PATCH 1/4] package/waffle: fix website reference
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

Hi Raphael,

On 05/10/2025 15:24, Raphael Gallais-Pou wrote:
> http://www.waffle-gl.org yields "403 Forbidden".
> Switch to freedesktop.org subdomain.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

I applied this series on master. Thanks.

I did few minor changes.
- I squashed patches related to the bump altogether
- I changed _VERSION to use "git describe --abbrev=40" format
- I removed .checkpackageignore entries to fix check-package errors

See:
https://gitlab.com/buildroot.org/buildroot/-/commit/106b3d43a44fb126d4bd7ff6828110e85e3eca22

While reviewing and testing this patch, I've seen that the only
waffle user package is piglit, which did not received any update
since 2020 and no longer build. In case you are interested to update
it, please send a patch.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
