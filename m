Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9556EBFD22
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 09:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60FBA4106B;
	Mon, 13 Apr 2026 09:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpXU_P9UWUho; Mon, 13 Apr 2026 09:24:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A6C41092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776072244;
	bh=9OyurxQRKOZSyQ+WSng6x59FEbhIxP1YeeYEpiZwHo0=;
	h=In-Reply-To:References:Date:Cc:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r3dzKDs2bZX3AQ7+6A5agkTQYuEjk4eYyrWWZBd79lx8qmdJ6dTZ7IWKiZboXME5r
	 O09TsxD5YD3dIX3HSl69Em0aHBFiNXuFEFjTqq05+lTCPxvVH/BvrVkpuM+MFDO6qn
	 pN+e6YENy/ltSLIRChO5cg/93jzzO2alzqaYltbef+hAPp71LnOzpF3nlpM1MupV3k
	 VdcpliT+pW5oxTrAmZkb5IUTlAZZs/+ubbWhgGR8B8Bu619YjuabUHTyyOK2Y8du7q
	 /O51M1U00aB+FAa7gtkG6zelJGO07i7EVEQjdKi9xXrCxXjmz3pO23QqDzsR//YRNS
	 vt1cZO9IXD7Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A6C41092;
	Mon, 13 Apr 2026 09:24:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE5CB194
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 09:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA2A6400CE
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 09:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IaUGWqMpNJiz for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 09:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 601424008A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 601424008A
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 601424008A
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 09:24:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 224B51814BF; Mon, 13 Apr 2026 11:23:57 +0200 (CEST)
In-Reply-To: <20260403173909.4F1FF8013A@busybox.osuosl.org>
References: <20260403173909.4F1FF8013A@busybox.osuosl.org>
Date: Mon, 13 Apr 2026 11:23:57 +0200
Cc: buildroot@buildroot.org, "Julien Olivain" <ju.o@free.fr>,
 "Bernd Kuhls" <bernd@kuhls.net>
To: "Thomas Perale" <thomas.perale@mind.be>
MIME-Version: 1.0
Message-ID: <0871dc43-7b87-8808-6a93-ba8244d624be@heine.tech>
User-Agent: SOGoMail 5.12.5
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1776072238; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Dqdijxleb7G1+BtBO8fcQVSUrWkjgc4Lr4GH/lkdLqk=;
 b=tdpv5JCtoAt8Spxg0CG6xb2jXKflY8jLko3OnRB1OhqfbC9DO9oehjf95hk5+lB910Lc6d
 NbjSqUoizJTVx2jl0USR8m3vePFt1Ly9yeaUiMvqj7K9QMRbSy+IiGpb2Yvx0KUV8aORlL
 qp9WBsrclw5USMtFn7THyfz7XcacfLY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=tdpv5JCt
Subject: Re: [Buildroot] 
 =?utf-8?q?=5Bgit_commit=5D_package/libmicrohttpd=3A_?=
 =?utf-8?q?bump_version_to_1=2E0=2E3?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

this version bump was actually a security bump. It fixes

https://www.cve.org/CVERecord?id=CVE-2025-62689
https://www.cve.org/CVERecord?id=CVE-2025-59777

So I think this should go into the maintenance branches.

Regards,
Michael

On Friday, April 03, 2026 19:37 CEST, Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> commit: https://gitlab.com/buildroot.org/buildroot/-/commit/82186898102ea15b23b011ba39ddffe0ca4b4c20
> branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master
> 
> https://lists.gnu.org/archive/html/info-gnu/2026-04/msg00000.html
> 
> Switched project URL to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/libmicrohttpd/Config.in          | 2 +-
>  package/libmicrohttpd/libmicrohttpd.hash | 2 +-
>  package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
> index 8477ef6668..4ce089bf6b 100644
> --- a/package/libmicrohttpd/Config.in
> +++ b/package/libmicrohttpd/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBMICROHTTPD
>  	  GNU libmicrohttpd is a small C library that makes it easy to
>  	  run an HTTP server as part of another application.
>  
> -	  http://www.gnu.org/software/libmicrohttpd/
> +	  https://www.gnu.org/software/libmicrohttpd/
>  
>  if BR2_PACKAGE_LIBMICROHTTPD
>  
> diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
> index 59c87a738d..bd5d0b3e8b 100644
> --- a/package/libmicrohttpd/libmicrohttpd.hash
> +++ b/package/libmicrohttpd/libmicrohttpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  df324fcd0834175dab07483133902d9774a605bfa298025f69883288fd20a8c7  libmicrohttpd-1.0.2.tar.gz
> +sha256  7816b57aae199cf5c3645e8770e1be5f0a4dfafbcb24b3772173dc4ee634126a  libmicrohttpd-1.0.3.tar.gz
>  sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
> diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
> index 335234c14b..b74a7a1338 100644
> --- a/package/libmicrohttpd/libmicrohttpd.mk
> +++ b/package/libmicrohttpd/libmicrohttpd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBMICROHTTPD_VERSION = 1.0.2
> +LIBMICROHTTPD_VERSION = 1.0.3
>  LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
>  LIBMICROHTTPD_LICENSE_FILES = COPYING
>  LIBMICROHTTPD_CPE_ID_VENDOR = gnu
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
