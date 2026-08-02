Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E83C55162
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 07:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB615406B9;
	Sun,  2 Aug 2026 07:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1r-4Gd_aGoF; Sun,  2 Aug 2026 07:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF8A0406AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785655809;
	bh=kqCPP4OTilbNnwjiLMDKXmm4Lsbqb8KkbsfMZZ5z6QU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HzS6X9iRr5gbE0RJ0BdedEeS/Aexyv7DiMksuUh3fIliZguga7wW3McTbSiAoVp3i
	 upDt9QfWSX6xEwkMXw2r9h8LjP8dyf+eQNdHP7S4fA8T6SkxOzhRMPEYbO4bvNhyPO
	 y3AinTU9F3KKQoBZgzS03UQBLKkUmO/DYK56YfQenTehyUEIefkoSOk06cCVyG5hpK
	 PofT6bQ0Sxbz+2ieDuPTsBXvnb7s/qECqKNhf4Cv+AhCn47pipaGDqPQoFBMolLxTm
	 Qi6+OOjbGDHX6JyzQMDewrOFcIeTu/z9GMT4rZkb/PHggX+z4MD528MhWsTxN/MvVA
	 qJ1azSOZJe0cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF8A0406AF;
	Sun,  2 Aug 2026 07:30:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 317D0350
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 07:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2333D40084
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 07:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYnWQ1BGjMSE for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 07:30:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE6D840077
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE6D840077
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE6D840077
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 07:30:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 46029780509;
 Sun,  2 Aug 2026 09:30:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 09:30:03 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 09:30:03 +0200
To: Philippe Nunes <nunes.philippe@free.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20260707161000.629475-2-nunes.philippe@free.fr>
References: <20260701121937.346945-1-nunes.philippe@free.fr>
 <20260707161000.629475-1-nunes.philippe@free.fr>
 <20260707161000.629475-2-nunes.philippe@free.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <1f145fced560982ff7c7627ba97dfd3f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785655805;
 bh=KxLVFpgYmFeDmo/LbLJU5zpmRhOwHVZPDAipvN3PLUQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AcuORtOAjdTvhXCJNXQoWQQYdwZSBdHVa+n8ZSrGTwidhP8njV1HWaSMBrZ4rHQy9
 nRAdVLg434NSjbCjNPMuy47o/o2QdyoPbp0W9PYm1miJjbLD58X4T4z4QDWgxSdwQc
 eH/rRzg1F1hz9k4twEvb+64iyu6HO6KPQKKSJXVBJfRv1revusemcnWZoawReGGgPo
 oKcb/+OaTtUtEowO910k5uYs9jPkiS9dsk/17lVp8YNk9mhvutQoX9zNjYMM0iYVl0
 GDFOYFuC0b1zr2YAmOV6YcCiAr0vD0coDKuaOdTRhGMXmZssQrgiJPsesh2ZwiCfM7
 6kWWPUgpygx6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AcuORtOA
Subject: Re: [Buildroot] [PATCH v2 1/3] package/mcpp: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Philippe,

Thanks for the patch. I have a comment, see below.

On 07/07/2026 18:09, Philippe Nunes via buildroot wrote:
> mcpp (Matsui CPP) is a portable C/C++ preprocessor. Builds both
> host and target with --enable-mcpplib, so libmcpp.{a,so} and
> mcpp_lib.h are available to other packages in addition to the
> standalone mcpp(1) CLI.
> 
> Upstream: https://mcpp.sourceforge.net/
> 
> Suggested-by: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Philippe Nunes <nunes.philippe@free.fr>
> ---
>  DEVELOPERS                                    |  3 +
>  package/Config.in                             |  1 +
>  package/Config.in.host                        |  1 +
>  ...ined-assignment-between-differently-.patch | 36 +++++++++++
>  ...POSIX.1-2008-so-readlink-is-declared.patch | 36 +++++++++++
>  ...ue-false-labels-they-are-reserved-in.patch | 63 +++++++++++++++++++
>  package/mcpp/Config.in                        |  7 +++
>  package/mcpp/Config.in.host                   |  7 +++
>  package/mcpp/mcpp.hash                        |  4 ++
>  package/mcpp/mcpp.mk                          | 19 ++++++
>  10 files changed, 177 insertions(+)
[...]
> diff --git a/package/mcpp/mcpp.mk b/package/mcpp/mcpp.mk
> new file mode 100644
> index 0000000000..04ca6e15df
> --- /dev/null
> +++ b/package/mcpp/mcpp.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# mcpp
> +#
> +################################################################################
> +
> +MCPP_VERSION = 2.7.2
> +MCPP_SITE = 
> https://downloads.sourceforge.net/project/mcpp/mcpp/V.$(MCPP_VERSION)
> +MCPP_LICENSE = BSD-2-Clause
> +MCPP_LICENSE_FILES = LICENSE
> +
> +MCPP_INSTALL_STAGING = YES
> +

On a host with gcc 16 (like Fedora 44), compiling host-mcpp fails.
Using the command "make host-mcpp" produces the errors:

eval.c: In function 'eval_eval':
eval.c:1284:22: error: expected ',' or ';' before 'LL_FORM'
eval.c: In function 'dump_val':
eval.c:1638:51: error: expected ',' or ';' before 'LL_FORM'

You could probably workaround that issue by adding here:

HOST_MCPP_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu99"

But I don't really like the idea of introducing this new mcpp
package which has apparently not been maintained for the past
two decades... It already needs 3 patches and has this build
failures.

Is there any other maintained alternatives?

Otherwise, you could eventually fork it and maintain it, to have a
person of contact (e.g. for security and other bugfixes) and to avoid
piling up patches in Buildroot?

> +# builds libmcpp.{a,so} alongside the mcpp CLI
> +MCPP_CONF_OPTS = --enable-mcpplib
> +HOST_MCPP_CONF_OPTS = --enable-mcpplib
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> --
> 2.54.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
