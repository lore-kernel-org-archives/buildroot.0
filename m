Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AA2C021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 14:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B5881387;
	Sat, 22 Feb 2025 14:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWXdtSpeaIKD; Sat, 22 Feb 2025 14:32:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1E178138E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1E178138E;
	Sat, 22 Feb 2025 14:32:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA987F11
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 14:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE906405E6
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 14:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id knLFSdjmofEA for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 14:32:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88433405A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88433405A4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88433405A4
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 14:32:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 181F519F5B2;
 Sat, 22 Feb 2025 15:32:31 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 22 Feb 2025 15:32:30 +0100
Date: Sat, 22 Feb 2025 15:32:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, yann.morin@orange.com,
 Christian Stewart <christian@aperture.us>
Message-ID: <Z7nf_jNmDVM-N6WI@landeda>
References: <20250205135825.2310972-1-fiona.klute@gmx.de>
 <20250205135825.2310972-2-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205135825.2310972-2-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740234755;
 bh=PCu+ANLseT/S41lYepBGRI+2DWiG5wyw3H58O4VGwYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p8cXzIfOZWYem5y6eKU64CPnJOg0wSWOjWthfeeg62ObQp4hLzuiikoNSil8vl1y2
 AVQ/aTgGjqr6eMKbyFH/IeNUEPuSL03APRvatC4LS54PEfEXE/5My4SRftRerO3usa
 +bHKoS8KTiIynFXkBm95qSqhPqvRvkFjKIWp+81ReaOR5arOROcmqcehmO+BLbWGsD
 JM3TU39NJ0o9O5UBFvgYwlQjKxp5m2VUuvGp9sntaProvNqrICLC2ic/Qcb71UjVbr
 gYsYSGF2QfzNH0Luz/KV1TZSHHMmu3CXWVlZ4BoymNn/37qo23ahlFeSEoFZSsRNWY
 lE3RMsZAjBF9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p8cXzIfO
Subject: Re: [Buildroot] [PATCH v3 2/3] package/pkg-golang: use ld.bfd
 instead of ld.gold on aarch64
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2025-02-05 14:58 +0100, Fiona Klute via buildroot spake thusly:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Go forces use of the Gold linker on aarch64 due to a bug in BFD that
> is fixed in Binutils >= 2.41 (that includes all versions provided by
> Buildroot). Forcing Gold will break with toolchains that don't provide
> it (like the Buildroot toolchains), so override the flag and use BFD.
> 
> This override should be removed if Go stops forcing Gold, and may have
> to be adapted if the set of available linkers changes (e.g. with a
> future Binutils update).

This patch would fix issues also related to containerd, that we also
see in the autobuilders, e.g.:

    http://autobuild.buildroot.org/results/a59/a59bc999e9620ff6b9d97138a2de898aadc07529/build-end.log

    [...]/host/bin/aarch64-buildroot-linux-gnu-gcc [...] -fuse-ld=gold [...]
    collect2: fatal error: cannot find 'ld'
    compilation terminated.

Regards,
Yann E. MORIN.

> See: https://github.com/golang/go/issues/22040
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> Changes v2 -> v3:
> * Note in commit message that changes to the override may be required
>   with Go or Binutils updates
> 
>  package/pkg-golang.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index a3421af288..bdf8de4d66 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -118,6 +118,16 @@ $(2)_EXTLDFLAGS += -static
>  $(2)_TAGS += osusergo netgo
>  endif
>  
> +ifeq ($(BR2_aarch64),y)
> +# Go forces use of the Gold linker on aarch64 due to a bug in BFD that
> +# is fixed in Binutils >= 2.41 (that includes all versions provided by
> +# Buildroot). Forcing Gold will break with toolchains that don't
> +# provide it (like the Buildroot toolchains), so override the flag and
> +# use BFD.
> +# See: https://github.com/golang/go/issues/22040
> +$(2)_EXTLDFLAGS += -fuse-ld=bfd
> +endif
> +
>  ifneq ($$($(2)_EXTLDFLAGS),)
>  $(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
>  endif
> -- 
> 2.47.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
