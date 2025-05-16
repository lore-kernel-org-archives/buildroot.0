Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB70C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6674419BC;
	Fri, 16 May 2025 11:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8sxmXram4KB; Fri, 16 May 2025 11:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E11EC419B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E11EC419B5;
	Fri, 16 May 2025 11:02:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C59E51AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6E856103E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUzcMx_iGYZD for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:02:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE5F160B4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE5F160B4F
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE5F160B4F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:02:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA6CF1C0DFB; Fri, 16 May 2025 13:02:43 +0200 (CEST)
Message-ID: <2beb3ff1-e14d-4453-8b4f-065261fc1783@rnout.be>
Date: Fri, 16 May 2025 13:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250511161312.3194997-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250511161312.3194997-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393363; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pcvfwVf9IjBfUvTYrfYbEOGEIr7mgtVXrgX4MK/IAnE=;
 b=nooqtJfxbAQCn9OTX0xwRA9OS8CeGJg04sGpBzBDVoPMEPt4aHR0IRvamuZA1xncnUvIgq
 3/60H0FcXuzZF3rUkvn/rMWWd3Em6YodcxgaF/pHich24iv4tbY5zRB5Y8vprQhPDibMMC
 FNun5W0kHxaLZfX/xvfXC0+kefvwb4dCgSIFuwCPILzHlPJKKM9o8V57Eca6U3FTrCmGQN
 GKdDrgNzRaFKj9qbOha8X0EBNZCafATjfpYVKU0uuSfyPv1+10XWLIh0BeWOwQoI+c8UiU
 Liqx0/XtMxgIe+fPiTxTTI0nAHxpQxUZa6yXCwBez7KRKzyjI2KeGhaySWudag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nooqtJfx
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 10.05.1
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



On 11/05/2025 18:13, Bernd Kuhls wrote:
> Release notes: https://ghostscript.readthedocs.io/en/gs10.05.1/News.html
> 
> "This release addresses CVEs: CVE-2025-27835, CVE-2025-27832,
>   CVE-2025-27831, CVE-2025-27836, CVE-2025-27830, CVE-2025-27833,
>   CVE-2025-27837, CVE-2025-27834, CVE-2025-46646"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/ghostscript/ghostscript.hash | 4 ++--
>   package/ghostscript/ghostscript.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
> index 8f44c444f1..c434ac1f3a 100644
> --- a/package/ghostscript/ghostscript.hash
> +++ b/package/ghostscript/ghostscript.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10050/SHA512SUMS
> -sha512  5a8695726ea2c70fd153bac47696c9e9046e9f74eccf8eea500794f79f09d5d2be70597c9d85c0b51b71d46d7974f50c5c9e3b0e242816bb84e64f1098a306a6  ghostscript-10.05.0.tar.xz
> +# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10051/SHA512SUMS
> +sha512  1a3f2b0f53db9a00a245df19ce8fdce0fbccc6fad47b64d14fc9058b494ab07c77e21bb073df8d4a2522b3ccb0df26735f8224a9e36c07367031ed2262fb26af  ghostscript-10.05.1.tar.xz
>   
>   # Hash for license file:
>   sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index 9e2342e5ac..0ddcb950ff 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GHOSTSCRIPT_VERSION = 10.05.0
> +GHOSTSCRIPT_VERSION = 10.05.1
>   GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
>   GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
>   GHOSTSCRIPT_LICENSE = AGPL-3.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
