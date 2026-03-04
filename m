Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553E1EDEC04
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 04:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D20C48156B;
	Wed,  4 Mar 2026 04:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpPWtT189w3Z; Wed,  4 Mar 2026 04:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B56808156D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772598910;
	bh=KGl0pI9qAAkqyrZYOi+OyoWM4gl3SLgI16sxhoJvCNY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EveAfyVPfZJLxWi44KJ8lzDqGsj09OEflyy6z5ldOg/sRkDRAerCYpeJR++XtHLbb
	 qI7nWDBfzdPTi9mOPju66SWelxSR4mhejHibMCklzT5qTU5mD+eGvpO1iBDZsr5R0T
	 V21K9ABYA0OuhaTaDz766vTqB/1pTyHAaQLsdqYZfIdp5/IDo9ycjAW85h/61Jgphw
	 hKLKx4PM6VN8aj3iGfgUmOgjaE52PivC3+L8ALXSy4ShECi1j72AX2cTWGRsIFm3MI
	 qJNC4KiDgfXtBOqbndXPrOjELW2kEX392oTNLby5t9VIaplZlB0v9X/YEM6B01FDS0
	 mpMqhB6+3wUzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B56808156D;
	Wed,  4 Mar 2026 04:35:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85F88231
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 04:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BAC040342
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 04:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ED5Do5Bbqv_r for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 04:35:08 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 577884019D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 577884019D
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 577884019D
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 04:35:06 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 04C84BDE0317;
 Wed, 04 Mar 2026 05:35:03 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 04 Mar 2026 04:35:02 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Romain Naour <romain.naour@smile.fr>
In-Reply-To: <mailman.37807.1772576641.2009750.buildroot@buildroot.org>
References: <mailman.37807.1772576641.2009750.buildroot@buildroot.org>
Message-ID: <dbd49ae98de7302e5a0cf5394e8c9b05@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1772598903; bh=Uvd+FY5fcBbHIEJJK4jyKELruAoD8TBIdq35I+rKYT0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=au4yxCbH6KKIX6eM1JtnrVAyxmjcHK/2Rq5hlSTkY2blowgTU7btP5zUOFBXceo8q
 8nnfD+EG6AbYjiOfLyr7BAFZJTgk5bPAbPlWUVRNX2Q+QqJCfSO68G94KWa+muiKjd
 n01VopnqpPnrZax4gGew2fjC9BLJ4ARd/awndhJk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=au4yxCbH
Subject: Re: [Buildroot] [PATCH v2] package/icu: fix static linking with
 icu-uc for musl static toolchains
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

Hi Shubham,

[add Romain Naour -> author of 0003]

The commit message in patch #3 states it addresses the static linking, 
but changes the shared linking statement instead. Since it obviously 
works, probably the commit message is wrong? Or can this patch simply be 
replaced with yours?

(patch related remarks below)

On 2026-03-03 23:51, Shubham Chakraborty wrote:
> 
> During static linking with a C application and libicuuc.a,
> -lstdc++ is required. The previous patch (0003) only addressed the
> shared library case (Libs.private). This patch adds -lstdc++
> to the main Libs line for the static case to fix undefined
> reference errors when linking programs like xmlcatalog (libxml2)
> with musl static toolchains.
        ^^^^
This probably affects not only musl toolchains.

> 
> Upstream: Inactive-Upstream [Buildroot specific]
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - Fixed the malformed patch
>   - Removed unnecessary whitespace
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  ...atic-linking-with-icu-uc-static-musl.patch | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 
> package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
> 
> diff --git 
> a/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch 
> b/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
> new file mode 100644
> index 0000000000..e17f6ac775
> --- /dev/null
> +++ b/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
> @@ -0,0 +1,26 @@
> +From 2107f9dfb39eeb6559fb4271c7af8b39aef521ca Mon Sep 17 00:00:00 2001
> +From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +Date: Tue, 3 Mar 2026 10:00:00 +0000
> +Subject: [PATCH] fix static linking with icu-uc (static case)
> +
> +During static linking with a C application and libicuuc.a,
> +-lstdc++ is required. The previous patch (0003) only addressed the
> +shared library case (Libs.private). This patch adds -lstdc++ to the
> +main Libs line for the static case to fix undefined reference
> +errors when linking programs like xmlcatalog (libxml2) with
> +musl toolchains.

The existing 0003-fix-static-linking-with-icu-uc.patch could be replaced 
with a patch that addresses both issues.

> +
> +Upstream: Inactive-Upstream [Buildroot specific]
> +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +---
> + source/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
> +--- icu.orig/source/Makefile.in
> ++++ icu/source/Makefile.in
> +@@ -281,3 +281,3 @@
> + ifeq ($(ENABLE_SHARED),)
> +-	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" 
> '$${baselibs}' >> $@
> ++	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" 
> '$${baselibs}' -lstdc++ >> $@
> + else
> --
> 2.53.0

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
