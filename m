Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F24CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F1B861511;
	Wed, 22 Oct 2025 16:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tVAC4yb518Z; Wed, 22 Oct 2025 16:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A287961527
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A287961527;
	Wed, 22 Oct 2025 16:43:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C8FE70A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A3C4400FC
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buw1uHpIQp2L for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0272340888
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0272340888
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0272340888
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1942BB979192; Wed, 22 Oct 2025 18:43:32 +0200 (CEST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:31 +0200
Message-ID: <20251022164331.286728-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012152336.93115-1-bernd@kuhls.net>
References: <20251012152336.93115-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151412; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=IpQxCTyU7u7BwyU+HrYueuZOvmmrLWuh9PhJS0piR90=;
 b=kCzOgDSHqP1ZsbBD40mzD2VezP765fnM076HgmOmJ2NaKk1BVZYhlqD+lLqTUq2Ig4ifDJ
 LffgOElyMMeOCb5KHd1R+s4/4bbE+CHDnuiqDqnWVwk14JcRIAcd1yNrNLzUlJdGSbyAVV
 LusGVdEKXeHfRFXZPhMVXA5BDMmoLGV0GMIfP2okf1NpKb3XqUJHs04dXYK1dOVSP6+UuL
 lXNFDGwn6TfAS1ASLRegAtboK5+T/DQg0lamEMrrbSQv1wRbEIqxyQF++OgooAId4FlfbS
 PVrYZ2vZlacBhrDdkKt2TOQ/MsJOR3AWyjJEOL9Q/FJN81sS1ytf0E35wPTa7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kCzOgDSH
Subject: Re: [Buildroot] [PATCH 1/1] package/libvpx: security bump version
 to 1.15.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Release notes:
> https://chromium.googlesource.com/webm/libvpx/+/refs/tags/v1.15.2
> https://chromium.googlesource.com/webm/libvpx/+/refs/tags/v1.15.1
> 
> Fixes CVE-2025-5283.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/libvpx/libvpx.hash | 2 +-
>  package/libvpx/libvpx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
> index ce88265d9e..1082721f1a 100644
> --- a/package/libvpx/libvpx.hash
> +++ b/package/libvpx/libvpx.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  e935eded7d81631a538bfae703fd1e293aad1c7fd3407ba00440c95105d2011e  libvpx-1.15.0.tar.gz
> +sha256  26fcd3db88045dee380e581862a6ef106f49b74b6396ee95c2993a260b4636aa  libvpx-1.15.2.tar.gz
>  sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
>  sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
> diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
> index 25144f3892..4f4144f4ff 100644
> --- a/package/libvpx/libvpx.mk
> +++ b/package/libvpx/libvpx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBVPX_VERSION = 1.15.0
> +LIBVPX_VERSION = 1.15.2
>  LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
>  LIBVPX_LICENSE = BSD-3-Clause
>  LIBVPX_LICENSE_FILES = LICENSE PATENTS
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
