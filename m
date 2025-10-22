Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD556CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 964C840C65;
	Wed, 22 Oct 2025 16:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqxPy0FoG6eS; Wed, 22 Oct 2025 16:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A08FF40C80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08FF40C80;
	Wed, 22 Oct 2025 16:43:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15C0770A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F08C040C80
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obXDURNF4uBJ for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00C7640C90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00C7640C90
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00C7640C90
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CABFCB979192; Wed, 22 Oct 2025 18:43:06 +0200 (CEST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:05 +0200
Message-ID: <20251022164305.286138-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008151504.20176-1-bernd@kuhls.net>
References: <20251008151504.20176-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151387; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=fHz2M7WfqpRyzYO+SuSrX3XbMrP7sACztT/fIdBkzpI=;
 b=aUCszxUx/RRQlTXvW73VVin7ai5bhxdYiYEF1kls18Qub150oywRBZj61NHB3a4uCNpXMu
 ekazs6nDxD0z7Gi3cJ9rDzAZi7yhZPxM3j6q0pCsP0P7ipzu/qfQPVowMR68DBz+PEYnPU
 KLG5yE/hXH6UYgmWcE0qT9WAUv3O3YCqAE9DghycXNchwaI15Bc4KpM0he1i507sHJvHgm
 7/bkQIv9R6ohGX8F38kOe6b49+YDMBENsu1M+j29DvRaTPjCHOpZqL6lgWtBQ9FQeyL1vu
 sTUjxZEgtSFasBJvKInEs7RsIPbOQNgYX/40vRlc+Jc5DQ15V1zLAG0HN0QSmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=aUCszxUx
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.19
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
> https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
> https://forum.torproject.org/t/stable-release-0-4-8-19/20648
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index 95a3a26eb7..ca2d49fb19 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.8.18.tar.gz.sha256sum
> -sha256  4aea6c109d4eff4ea2bafb905a7e6b0a965d14fe856214b02fcd9046b4d93af8  tor-0.4.8.18.tar.gz
> +# From https://dist.torproject.org/tor-0.4.8.19.tar.gz.sha256sum
> +sha256  3cb649a1d33ba6a65f109d224534e93aaf0a6de84a5b1cb4b054bfa06bb74f5a  tor-0.4.8.19.tar.gz
>  # Locally computed
>  sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index f9ff4fbca6..208e71ae51 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.8.18
> +TOR_VERSION = 0.4.8.19
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
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
