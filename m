Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E59CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E918614D5;
	Wed, 22 Oct 2025 16:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBPkKZKa5YvI; Wed, 22 Oct 2025 16:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5DA361478
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5DA361478;
	Wed, 22 Oct 2025 16:43:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D10843F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1438740888
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2UB0z6ZFnB7 for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15D42400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15D42400FC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15D42400FC
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D98FB979192; Wed, 22 Oct 2025 18:43:13 +0200 (CEST)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:12 +0200
Message-ID: <20251022164312.286241-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009143216.2282077-3-fiona.klute@gmx.de>
References: <20251009143216.2282077-3-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151393; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Z8LY6pzaMIifVz6aGQ+xSh5RtnvRxj9fHWnSdImdZaQ=;
 b=No5qmKqV7x6XVyC4otDbSZuJA8viSlj+i7C3b/2761TIaWiKH9Ohve0nQ4fIiYhb6M/vvS
 P/WW5lq94mR2e+ZV3tdDTInTgvouyAra11Cc3QPVhtJkswxRvH1h80JX8cIsgUc8scKglQ
 589z5NbVj6x9FfbAbP0xR3B9ViCwYGX533gS4M3KLCJiaopAHQ5aPEEKDIAme4DtEMAi2n
 p2uCPHuBImgeNUO0KV/Iudmi/0eYWNWKsk/gjbZ58JLOJZRXkO8+Qusvwe4z076nh8DupT
 omPM8Z+RtzGON1sGNo4e54gjFmZ8xKjSDALc1cYG9Em19XHisGclqwamuBW6sw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=No5qmKqV
Subject: Re: [Buildroot] [PATCH 2/4] package/libsemanage: install modules to
 site-packages dir
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
> $(PREFIX)/lib/python$(PYTHON3_VERSION_MAJOR) is for the standard
> library, additional modules like this should go to site-packages.
> This patch changes only the host package because Python bindings are
> disabled for the target package.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/libsemanage/libsemanage.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
> index 289954f700..12e378f045 100644
> --- a/package/libsemanage/libsemanage.mk
> +++ b/package/libsemanage/libsemanage.mk
> @@ -41,7 +41,7 @@ HOST_LIBSEMANAGE_MAKE_OPTS += \
>  	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/" \
>  	DEFAULT_SEMANAGE_CONF_LOCATION=$(HOST_DIR)/etc/selinux/semanage.conf \
>  	PYINC="-I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)/" \
> -	PYTHONLIBDIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/" \
> +	PYTHONLIBDIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages" \
>  	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
>  
>  define HOST_LIBSEMANAGE_BUILD_CMDS
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
