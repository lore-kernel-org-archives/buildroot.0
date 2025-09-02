Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEBECA0FFE
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 13:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E22F541848;
	Tue,  2 Sep 2025 13:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wD9rWP-OMgnF; Tue,  2 Sep 2025 13:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08D8D41705
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08D8D41705;
	Tue,  2 Sep 2025 13:49:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C283439
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 13:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DEED60DDA
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 13:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQf6hxBnLyCk for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 13:49:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 761FC60D8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 761FC60D8A
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 761FC60D8A
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 13:49:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8F5D6C8EC76;
 Tue,  2 Sep 2025 13:49:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7CAA960695;
 Tue,  2 Sep 2025 13:49:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7A3541C22C4CE; 
 Tue,  2 Sep 2025 15:49:39 +0200 (CEST)
Date: Tue, 2 Sep 2025 15:49:36 +0200
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, David Pierret <david.pierret@smile.fr>, Romain
 Naour <romain.naour@smile.fr>
Message-ID: <20250902154936.1563f079@windsurf>
In-Reply-To: <20250902134250.622347-1-elmehdi.younes@smile.fr>
References: <20250902134250.622347-1-elmehdi.younes@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756820980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4BAyCdHapb6Hk/cUrKRdFa2GjTdffvfbjUVHa/ZmK+U=;
 b=bm8fjgxWqK0lPhlha7o9OL7QT9tpJZzpIb4zWO6RDHfrAJhX3f4zqnmBWI504X9qYK4jW1
 pdkBvWPz222SaBM59utp6BSRIbYOXZYRI+XkqICg0jAXpnxnAkwzGbHOAVXvVv3k05LAAs
 R8ytGi3PxiUiK1D49Of8ltfERXlJSrDjXwhME6XCEUX5v5uuVi5O0AGqq9afTC/tpL537d
 t8+x/TxfO69mUZRbgc6OT9v4fW2/8XFHO30Po1/hFCcDYWAGQ/FUfPe6DDfuPi5u7HrdSP
 NijtmLHzAQRR/+wngMhX8gZji96oOkbZEO6/egk7zE10GFy8pI92mUGHeIukBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bm8fjgxW
Subject: Re: [Buildroot] [PATCH 1/1] package/bat: fix build with GCC 15
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for your patch!

On Tue,  2 Sep 2025 15:42:50 +0200
El Mehdi YOUNES <elmehdi.younes@smile.fr> wrote:

> Bat pulls in the onig crate (version 6.4.0) through syntect with the
> default "regex-onig" feature. This crate depends on the Oniguruma C
> library (via onig_sys), which fails to build with GCC 15 due to C23
> keyword conflicts. Newer versions of onig fix this issue, but bat
> cannot directly update the onig version because it is pinned by syntect.
> 
> To resolve the build failure, apply a patch that replaces the
> "regex-onig" feature with "regex-fancy" in bat's minimal-application
> feature set. This switches bat to use the pure-Rust fancy-regex engine
> instead of Oniguruma, avoiding the problematic onig_sys dependency.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/?reason=bat-%

This link doesn't make sense as it can contain failures unrelated to
this one, especially in the future. You need to include the link to one
specific build result.

> diff --git a/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch b/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
> new file mode 100644
> index 0000000000..6d13c406cc
> --- /dev/null
> +++ b/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
> @@ -0,0 +1,40 @@
> +From 9b6727df25e45222b3863dbe5f5bc58237b68ab9 Mon Sep 17 00:00:00 2001
> +From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> +Date: Tue, 2 Sep 2025 14:02:11 +0200
> +Subject: [PATCH] Replace regex-onig by regex-fancy in minimal-application
> +
> +The default "application" feature enables "minimal-application", which
> +in turn pulls in the "regex-onig" feature of syntect. This brings in the
> +onig crate (version 6.4.0) and its dependency onig_sys, which fail to
> +build with GCC 15 due to C23 keyword conflicts.
> +
> +It is not possible to simply update the onig crate from bat itself,
> +since its version is pinned indirectly by syntect. To avoid this
> +dependency and fix the build, replace "regex-onig" with "regex-fancy" in
> +"minimal-application". This makes bat use the pure-Rust fancy-regex
> +engine instead of Oniguruma, removing the need for onig_sys and allowing
> +the package to build with GCC 15.
> +
> +Upstream: not submitted

Why?

> +diff --git a/Cargo.toml b/Cargo.toml
> +index 80d19321..93a07a1d 100644
> +--- a/Cargo.toml
> ++++ b/Cargo.toml
> +@@ -29,7 +29,7 @@ minimal-application = [
> +     "clap",
> +     "etcetera",
> +     "paging",
> +-    "regex-onig",
> ++    "regex-fancy",
> +     "wild",
> + ]

Are you sure this works? Patches are applied *after* the download step,
during which we do the Cargo vendoring. Also, if you pull in more
dependencies, I would expect the hash of the tarball to change, since
we hash the tarball after Cargo vendoring.

Am I missing something here?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
