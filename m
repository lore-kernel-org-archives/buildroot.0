Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496D6C7618E
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 20:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7C2D403B8;
	Sat, 18 Mar 2023 20:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7C2D403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z2wLPGrJaoS9; Sat, 18 Mar 2023 20:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC36C401F1;
	Sat, 18 Mar 2023 20:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC36C401F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE2FC1BF332
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 20:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 588D8410E3
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 20:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 588D8410E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnuikZKVumPC for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 20:50:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8755C410DE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8755C410DE
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 20:50:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 52E5360007;
 Sat, 18 Mar 2023 20:50:14 +0000 (UTC)
Date: Sat, 18 Mar 2023 21:50:12 +0100
To: Steve Hay via buildroot <buildroot@buildroot.org>
Message-ID: <20230318215012.3d48267b@windsurf>
In-Reply-To: <20230318204407.2112290-1-me@stevenhay.com>
References: <20230318204407.2112290-1-me@stevenhay.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679172614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCyLVEms/o9EmdjLdJRud6k7hCfLHrs0T1mc80qvPLo=;
 b=PtcXdZH9X0JosSqKiFiDiXvkguczLYfiitOVtOSpmL9iqzYF0gE5CxsqFXcu0Ioa/f0t9U
 V+xWVqLzACiPFTx0Bhn2HL1x3c58PoABBxhadVpJl4VWF9H+4iPpd77KVazm+6ylfTEJP+
 L+gtVFYrjFUu7jOcMTvA6vo9Exs1qjfqkChiv9jq+LybaUn25wI4629u6uCyqAs+zPT+Xk
 GVaErucsqwoGrXuqI9hLvKks2vKRGnvEeTJX8C9uv94yAgEPMlFhRXV4OhkyELqiRYnRP4
 8vULSqeoP4TGM2hsTTUD4kqbHPm7JcelAlYJKswzV2ewydrt2iLFoSooJRDr5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PtcXdZH9
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: bump version to
 20230311
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
Cc: Martin Bark <martin@barkynet.com>, Steve Hay <me@stevenhay.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Steve,

On Sat, 18 Mar 2023 21:44:06 +0100
Steve Hay via buildroot <buildroot@buildroot.org> wrote:

> The impetus for this change was that wget fails to load pages signed by
> Let's Encrypt due to missing root certs. This version has the updated and
> correct certs.
> 
> Signed-off-by: Steve Hay <me@stevenhay.com>

Thanks for the patch, see some comments below.

> diff --git a/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch b/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
> index b76c1bfd7f..ced593664e 100644
> --- a/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
> +++ b/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
> @@ -1,4 +1,10 @@
> -From bf18b564122e8f976681a2398862fde1eafd84ba Mon Sep 17 00:00:00 2001
> +From a4e468a2a0afa80df174831c2f422184820bb0fa Mon Sep 17 00:00:00 2001
> +From: Steve Hay <me@stevenhay.com>
> +Date: Sat, 18 Mar 2023 17:57:18 +0100
> +Subject: [PATCH] mozilla/certdata2pem.py: make cryptography module optional
> +
> +Modified for a newer version of the ca-certificates module.
> +
>  From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  Date: Thu, 6 Jan 2022 23:15:00 +0100
>  Subject: [PATCH] mozilla/certdata2pem.py: make cryptography module optional
> @@ -15,37 +21,36 @@ the check is skipped.

The way you did that makes the patch no longer applicable with "git
format-patch". The patch now has two From/Date/Subject fields.

Could you instead make sure to apply the existing patch on
ca-certificates using git-am, fix the conflicts, and regenerate the new
patch with git format-patch? You should preserve the existing
authorship, but you can do something like this:

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Steve: refreshed to apply on ca-certificates version XYZ]
Signed-off-by: Steve Hay <me@stevenhay.com>


> diff --git a/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch b/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
> deleted file mode 100644
> index 0537da9224..0000000000
> --- a/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 5e493ca307a031e81528ceddb96f3da40bc062cf Mon Sep 17 00:00:00 2001
> -From: Wataru Ashihara <wsh@iij.ad.jp>
> -Date: Wed, 2 Nov 2022 12:40:05 -0400
> -Subject: [PATCH] mozilla/certdata2pem.py: Fix compat with cryptography > 3.0

The commit log should mention why this patch is dropped.

> -CA_CERTIFICATES_VERSION = 20211016
> +# batocera / version bump

What does this comment mean?

> +CA_CERTIFICATES_VERSION = 20230311
>  CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
> -CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20211022T144903Z/pool/main/c/ca-certificates
> +CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20230317T205011Z/pool/main/c/ca-certificates
>  CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
>  CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
>  CA_CERTIFICATES_LICENSE_FILES = debian/copyright

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
