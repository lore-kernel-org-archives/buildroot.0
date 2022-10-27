Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A03C38A2D
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE33D8136A;
	Thu, 27 Oct 2022 06:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE33D8136A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8xZ5ept_bZLi; Thu, 27 Oct 2022 06:49:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 120FC8135A;
	Thu, 27 Oct 2022 06:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 120FC8135A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 892C91BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57F98405EB
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57F98405EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhPys366tS_j for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:49:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1313940328
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1313940328
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:49:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 95859E0002;
 Thu, 27 Oct 2022 06:49:01 +0000 (UTC)
Date: Thu, 27 Oct 2022 08:49:00 +0200
To: Tobias Waldekranz <tobias@waldekranz.com>
Message-ID: <20221027084900.0844e13a@windsurf>
In-Reply-To: <20221020141412.346992-5-tobias@waldekranz.com>
References: <20221020141412.346992-1-tobias@waldekranz.com>
 <20221020141412.346992-5-tobias@waldekranz.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666853342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRVBcka597jahuuICSJLphgsKwfhMcg71W54SzwX+/c=;
 b=cyp7BmF3SzWgrn8CJQO2ykCXzgxNwE6/XfYmqdPgD5/WkJkV2a/GQAhpHRYwNSNWbL0EsA
 GVn9UFlQON/DpziPiPEnTYCRVqZEKptLTGALsvfVI77gEe5qr43QctCPqDkmhOs/d6GHAM
 /sEvUb5rkfsa4gE11A6nhirdZtpMHjagwDhKSBix55XnBNLx48h8GR+LWqQfvT9E1kqt5Q
 prhdRxABgQUqTDSWZwFV8s9kgpV27hduvrd9q9hg6nL4Hz8jfiZJ7x7P6wO0FYWGcP8vHM
 iIfKuierQlbJVKrUXb+W0vlV3kkjpW5qWuajaMqXudQaaKurAEg5GIQlOjj1Uw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cyp7BmF3
Subject: Re: [Buildroot] [PATCH 4/4] package/kmemd: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Oct 2022 16:14:12 +0200
Tobias Waldekranz <tobias@waldekranz.com> wrote:

> kmemd let's you inspect a live Linux kernel's memory using GDB.
> 
> Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>

I have applied a patch, with a few small changes.

> ---
>  package/Config.in        |  1 +
>  package/kmemd/Config.in  | 11 +++++++++++
>  package/kmemd/kmemd.hash |  5 +++++
>  package/kmemd/kmemd.mk   | 20 ++++++++++++++++++++
>  4 files changed, 37 insertions(+)

I added an entry in the DEVELOPERS file for this package, so that we
know you are the contact. You will receive e-mails if there are build
failures or CVEs affecting this package, and when new releases are made
upstream (even though I suppose you are the upstream maintainer, so you
should already know!)

> diff --git a/package/kmemd/Config.in b/package/kmemd/Config.in
> new file mode 100644
> index 0000000000..2190488b0f
> --- /dev/null
> +++ b/package/kmemd/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_KMEMD
> +	bool "kmemd"
> +	depends on BR2_PACKAGE_LIBBPF_SUPPORTED

Changed to repeat the dependencies of libbpf.

> +	select BR2_PACKAGE_LIBBPF
> +	help
> +	  Explore a live Linux kernel's memory using GDB
> +
> +	  https://github.com/wkz/kmemd
> +
> +comment "kmemd needs libbpf"
> +	depends on !BR2_PACKAGE_LIBBPF_SUPPORTED

This comment was not correct: you are selecting libbpf, so you don't
need to say that you need it. Instead, I've added our usual comment,
which corresponds to the dependencies inherited from libbpf.

> diff --git a/package/kmemd/kmemd.hash b/package/kmemd/kmemd.hash
> new file mode 100644
> index 0000000000..60b8589dd2
> --- /dev/null
> +++ b/package/kmemd/kmemd.hash
> @@ -0,0 +1,5 @@
> +# Locally calculated
> +md5  9954bf82279eeb0da016654689f69ac2  kmemd-1.0.0.tar.gz
> +sha1  3ae3bdceb70d674f41f56cd489c7497944b9b0f0  kmemd-1.0.0.tar.gz
> +sha256  519ac3cdd367acee5090eec3b7e08400724f9b84486b191f3af534bd7cffca70  kmemd-1.0.0.tar.gz

When we have a sha256, md5/sha1 hashes are not needed, so I dropped them.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
