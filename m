Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFBBE748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5A9381A6D;
	Sun,  1 Oct 2023 16:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5A9381A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvtoKq3028tn; Sun,  1 Oct 2023 16:50:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD46A81AAB;
	Sun,  1 Oct 2023 16:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD46A81AAB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 790031BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 528C481AAB
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 528C481AAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UbUFFGSHB-uW for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:50:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28D0D81A6D
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28D0D81A6D
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE841240004;
 Sun,  1 Oct 2023 16:50:31 +0000 (UTC)
Date: Sun, 1 Oct 2023 18:50:31 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20231001185031.4d0e9a8d@windsurf>
In-Reply-To: <20230725173102.543874-5-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
 <20230725173102.543874-5-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696179032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZIM/BXS191MUd7kfoA0kb50cfHZ/5RtGiFVxT0Bgx4=;
 b=KIIt80AA+lobWqvR2303sbXSCha9GMRuQoWAWLgb2FCAn/1aROBSb48U1eJfGdeS42HSUa
 RnNJsEFYzPnkDR4wVs0F4mfnOHNnjx+co1ILlGU6urTA1W/l+VM7dCW+ydUeAhO0CiaGJR
 1V3ikrLjYsQaOL2e3+bhUBzsx/ICVa6GqYErvOtm0vswL5D4EsHrliEQyd/FULIizDL6zx
 zhbwVXZI+Ci5x5ADiy23lTZN2h/dSV6NFxcPiuZOoUUo6KDWRLmDfQsCSeDem0NB4dVt3N
 uFaFUoNQz47xkwZuEqKeKvKHF65V6phmVqZuCtrsURG83VNBbBPiB0xZkq5kEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KIIt80AA
Subject: Re: [Buildroot] [PATCH v2 4/9] package/spirv-headers: new package
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
Cc: Romain Naour <romain.naour@smile.fr>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 25 Jul 2023 19:30:56 +0200
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

>  package/Config.in                        |  1 +
>  package/spirv-headers/Config.in          |  6 ++++++
>  package/spirv-headers/spirv-headers.hash |  2 ++
>  package/spirv-headers/spirv-headers.mk   | 15 +++++++++++++++
>  4 files changed, 24 insertions(+)

Missing entry in DEVELOPERS file, so I've added that.


> diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
> new file mode 100644
> index 0000000000..b83959f7a4
> --- /dev/null
> +++ b/package/spirv-headers/spirv-headers.hash
> @@ -0,0 +1,2 @@

Missing "Locally calculated" comment.

> +sha256  71668e18ef7b318b06f8c466f46abad965b2646eaa322594cd015c2ac87133e6  spirv-headers-1.3.246.1.tar.gz
> +sha256  9b243f6f0bf44e295ff411a0f7b7642d1d0dff7cdc42507e9f7206f439e51b5a  LICENSE
> diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
> new file mode 100644
> index 0000000000..11119ac6b2
> --- /dev/null
> +++ b/package/spirv-headers/spirv-headers.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# spirv-headers
> +#
> +################################################################################
> +
> +SPIRV_HEADERS_VERSION = 1.3.246.1

I've bumped to the latest version, which fixes a build issue: this
older version was trying to build C++ code for an example/test. With
the newer version, it still tries to build C++ stuff, but mistakenly
with the host C++ compiler, which works because it has no dependencies.
Romain and I didn't bother fixing that as we really don't care about
this silly example being built.

Note: as a follow-up patch, I added a host variant of this package, and
a change to spirv-llvm-translator that makes use of it. Indeed
host-spirv-llvm-translator was downloading its own copy of the
spirv-headers during the build which is very bad (but not your fault,
since you did not introduce host-spirv-llvm-translator).

Anyway: this patch is applied. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
