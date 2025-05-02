Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D586C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 445E640E32;
	Fri,  2 May 2025 10:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYPi2Wpy1e1D; Fri,  2 May 2025 10:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D6CF4156F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D6CF4156F;
	Fri,  2 May 2025 10:52:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3756229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A051A838E6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWa-P9TkRIM7 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:52:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C28F81882
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C28F81882
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C28F81882
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:52:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 49CA61C00E6; Fri,  2 May 2025 12:52:47 +0200 (CEST)
Message-ID: <53443ca6-9575-45c8-b5d1-3d3df3823698@rnout.be>
Date: Fri, 2 May 2025 12:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20250418144256.24452-2-dalang@gmx.at>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250418144256.24452-2-dalang@gmx.at>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183167; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0Rn2ZE3Z/738alPA21VkYwcKX+SzswzmeZXyCSJu++w=;
 b=nYyu+rW2S+RtemcThg9lVU+jBTvfc9GH2xO0ykiTKnvUP4b0AJTLm6xFTecJMoRtfkM0DP
 fmTeECO6btwHmy8UgtGpuyJs4e+IyyCcdY/5yXVHqN/X/ubcKtlTWHA3jiWQHehf67Wkm7
 JqLg8zM2p85azAmZsdpvWYJSkAw1QIC5HWBe2xis32lFhsinoX2PNF3KqfLHAKtmdcq6UL
 FHPBzueXoV+QW46njzAmJ/PGBJP7K+ECWJItdgMtlqqRXA+TYeDBsOSk8M1kQzXBzuwooa
 0ovFVwHfdVNtLw0RGNnEyGEjQMQ0m6kQWNat+Z1KOYEe8dL4pom0On0fbNFajw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nYyu+rW2
Subject: Re: [Buildroot] [PATCH] package/cairomm1_14: bump to version 1.14.5
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/04/2025 16:42, Daniel Lang via buildroot wrote:
> https://gitlab.freedesktop.org/cairo/cairomm/-/blob/1.14.5/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/cairomm1_14/cairomm1_14.hash | 6 +++---
>   package/cairomm1_14/cairomm1_14.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/cairomm1_14/cairomm1_14.hash b/package/cairomm1_14/cairomm1_14.hash
> index 6d58de360a..69511993ce 100644
> --- a/package/cairomm1_14/cairomm1_14.hash
> +++ b/package/cairomm1_14/cairomm1_14.hash
> @@ -1,6 +1,6 @@
> -# From https://www.cairographics.org/releases/cairomm-1.14.4.tar.xz.sha1
> -sha1  a58419bb9792a2c998631704ce5671c38e0c82a1  cairomm-1.14.4.tar.xz
> +# From https://www.cairographics.org/releases/cairomm-1.14.5.tar.xz.sha1
> +sha1  c33938b021046619d86cd2631f4c79dfd0f5bdac  cairomm-1.14.5.tar.xz
>   
>   # Locally computed
> -sha256  4749d25a2b2ef67cc0c014caaf5c87fa46792fc4b3ede186fb0fc932d2055158  cairomm-1.14.4.tar.xz
> +sha256  70136203540c884e89ce1c9edfb6369b9953937f6cd596d97c78c9758a5d48db  cairomm-1.14.5.tar.xz
>   sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
> diff --git a/package/cairomm1_14/cairomm1_14.mk b/package/cairomm1_14/cairomm1_14.mk
> index 6502d34c5a..b19ba08cfd 100644
> --- a/package/cairomm1_14/cairomm1_14.mk
> +++ b/package/cairomm1_14/cairomm1_14.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CAIROMM1_14_VERSION = 1.14.4
> +CAIROMM1_14_VERSION = 1.14.5
>   CAIROMM1_14_LICENSE = LGPL-2.0+
>   CAIROMM1_14_LICENSE_FILES = COPYING
>   CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.xz

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
