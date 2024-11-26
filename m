Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC97D66B9A
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 23:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56D376FA93;
	Tue, 26 Nov 2024 23:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgmrY3VR9-ml; Tue, 26 Nov 2024 23:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C1D6FAF9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57C1D6FAF9;
	Tue, 26 Nov 2024 23:46:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D614D712
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 23:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5192853C0
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 23:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgOSgOh51QTY for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 23:46:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DAB385650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DAB385650
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DAB385650
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 23:46:15 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:90f9:2523:9be3:f561])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 40B78B0051E;
 Wed, 27 Nov 2024 00:46:11 +0100 (CET)
Date: Wed, 27 Nov 2024 00:46:10 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <ezukwweovwn2ehq4r3go4zfjzsuwkt6qbmupeqpbysim2fn4um@hnmorwahtoai>
References: <20241126215918.277204-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241126215918.277204-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732664772;
 bh=qo3xFQWT8JAcIjsJpxD44shL2ZYG6qV0BC64LxS8VsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pMoX8EtHPOcqvkr3tA3f/ZGLrCeiND536W5Tx60DLxQegyj9+OSRg5VbtsKHDyVwM
 ZrXLRtE+C7kPGiuCEQithTExGBMHjaU5oylT0zem+1ByDbD8nH6/U8Eoh0AEuKuQ2O
 hjvvXGpHVr7vX3W1kUmFs1Kwlc6zGsLKo8qviNAzFx2W6PFy4omUGJA8NAIt9ES6Jk
 8B/8cPmu1RFRJEYYLUvqPxVVMdWweSckDIy84Z+A12wII5gBF7et0HsgAEnwf/+qhH
 qiuY6DfRCBBobe9rZdG2NWCgrihVzQs3IcU0S+2TMUS3KHr9/kOYn6JARal7TKKag2
 t1yj8c7LHuHPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pMoX8EtH
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: security bump version to
 9.1.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Nov 26, 2024 at 10:59:18PM UTC, Julien Olivain wrote:
> For release note, see:
> https://frrouting.org/release/9.1.2/
> 
> Fixes:
> https://nvd.nist.gov/vuln/detail/CVE-2024-44070

Ack't

Reviewed-by: Vincent Jardin <vjardin@free.fr>

Thanks Julien for spotting this update.

best regards,
  Vincent

> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/frr/frr.hash | 2 +-
>  package/frr/frr.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/frr/frr.hash b/package/frr/frr.hash
> index 81f8dfdae3..ea88fcef9b 100644
> --- a/package/frr/frr.hash
> +++ b/package/frr/frr.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  6eb254c72dca867fefffd5ded80a6c2d5ce8df223ce93263302db4b8bfbb19c4  frr-9.1.1.tar.gz
> +sha256  a23ab9aba5c45d919f9c6d14febfad8a797b7f63272bde4009c70ff77aac3a77  frr-9.1.2.tar.gz
>  sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
>  sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
>  sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index 7f26fd3c57..921ef99665 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FRR_VERSION = 9.1.1
> +FRR_VERSION = 9.1.2
>  FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
>  FRR_LICENSE = GPL-2.0+
>  FRR_LICENSE_FILES = \
> -- 
> 2.47.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
