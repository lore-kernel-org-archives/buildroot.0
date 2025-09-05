Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7B0CA1010
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 17:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C2E48135D;
	Fri,  5 Sep 2025 17:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSJo_xzcPAhq; Fri,  5 Sep 2025 17:35:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB7C8812F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB7C8812F6;
	Fri,  5 Sep 2025 17:35:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 374D928B
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 17:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D63A40767
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 17:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7E86WqnaOxA for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 17:35:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA40D40787
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA40D40787
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA40D40787
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 17:35:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5E8972003C3;
 Fri,  5 Sep 2025 19:35:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Sep 2025 19:35:07 +0200
MIME-Version: 1.0
Date: Fri, 05 Sep 2025 19:35:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250905055201.76291-1-bernd@kuhls.net>
References: <20250905055201.76291-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c2838f1e901924f5f57f8f247e59c0e6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757093708;
 bh=k+XxbfNuQDSAeN3xOa4hiHgu0lGmjzgJU/6ZGFaOxrw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pEUfZSPOr8b8n/lJVMpJ9azvK8eN1guhu6ZbGkwGtk/Tv+ClYaIKoh/wQyfuX5aYL
 i4g3o9Snvnoo+1Kp2A3rG4anVzZAbtf00Vwof6729xMaCXr85SsXCXWyhFl6k2VNQJ
 BW22ptQ8ePvbYYxkZm5B9PfZXVjaawHeJ1u9p8FZkT8RzbB3TXbt3YnKwm0uP63dWw
 JIm4VaZqKivgtvO4s5Kn9N42DC5NCeJQ2l2Fe6gxea7QbC7GDX/S+DhDo9fbWROa7Y
 sKr87yt2MUJ7O+xIBLKfY6Tu/xm6o2oO4Mlsp7CwwuckWdj+W6btkT7DE79uM3WtL8
 WyuEToA5C3zpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pEUfZSPO
Subject: Re: [Buildroot] [PATCH 1/1] package/exiv2: security bump version to
 0.28.7
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

On 05/09/2025 07:52, Bernd Kuhls wrote:
> Changelog:
> https://exiv2.org/whatsnew.html
> https://github.com/Exiv2/exiv2/blob/v0.28.7/doc/ChangeLog
> 
> Release notes of 0.28.0 with a long list of security-related fixes:
> https://github.com/Exiv2/exiv2/issues/2406#issuecomment-1529139799
> 
> 0.28.1 fixed CVE-2023-44398: https://github.com/Exiv2/exiv2/issues/2813
> 
> 0.28.2 fixed CVE-2024-24826 & CVE-2024-25112:
> https://github.com/Exiv2/exiv2/issues/2914
> 
> 0.28.3 fixed CVE-2024-39695: https://github.com/Exiv2/exiv2/issues/3008
> 
> 0.28.5 fixed CVE-2025-26623: https://github.com/Exiv2/exiv2/issues/3181
> 
> 0.28.6 fixed
> * 
> [CVE-2025-54080](https://github.com/Exiv2/exiv2/security/advisories/GHSA-496f-x7cq-cq39)
> * 
> [CVE-2025-55304](https://github.com/Exiv2/exiv2/security/advisories/GHSA-m54q-mm9w-fp6g)
> 
> Please read https://github.com/Exiv2/exiv2/issues/2406 for the 
> discussion
> whether these CVEs are relevant and their status of backporting to the
> 0.27.x branch.
> 
> Removed patch which is included in this release.
> Switch to github helper due to upstream not providing tarballs anymore.
> 
> Added optional support for inih:
> https://github.com/Exiv2/exiv2/commit/43c9ec0f5095d92e2dd748c6c0b6f7ae4e6c73bf
> and brotli:
> https://github.com/Exiv2/exiv2/commit/557a5cebd52ced79d11080089d8e2874126fb038
> both introduced in the 0.28.x branch.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
