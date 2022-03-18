Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AD1C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 21:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D565281A65;
	Fri, 18 Mar 2022 21:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhzumawBxpSP; Fri, 18 Mar 2022 21:38:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6ABD817B0;
	Fri, 18 Mar 2022 21:38:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C8AF1BF2CC
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99A72606A9
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJ1CEKFkOSrk for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 21:38:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A664160648
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 21:38:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BE5A913F86F;
 Fri, 18 Mar 2022 22:38:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647639513;
 bh=31oPmOWzNoP8hQQtTdTxSrshOgERWXAty3wbgEtF1LY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OOlhTS6hMa+A2bhGbK3qiF54iU78qG4MpNIEeDtjlbCe0ABg43aHmlVE0pIp3XJsd
 EwQag+OUtV9nTbtBcDVRmLS0NtR/d83BiEOVQp7U9yjBmY9VEW19Y1nMCPICYOMhVA
 hwB3pWYZdcXqkqwDcz4wyZ8nu8RrX79OVeVeVGJLLtluFMZT+jexZjyekISTdg7IB3
 A7w3Fwka4I5f6PZvKcwfN+bQjpWoSUtXahGWL1m/TPZjmj35m3u51r/6lGptlbgcVz
 sb6btfNbdgNGh3pLx0Zwy3x1XXkg8bcuguNsUdSxxDcK+GyDDtmCDWbARBw4s0gIMu
 g/kRS53hFRbfQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 22:38:30 +0100
Date: Fri, 18 Mar 2022 22:38:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220318213830.GM283544@scaer>
References: <20220318194058.760799-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318194058.760799-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/wavpack: fix CVE-2021-44269
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-03-18 20:40 +0100, Fabrice Fontaine spake thusly:
> An out of bounds read was found in Wavpack 5.4.0 in processing *.WAV
> files. This issue triggered in function WavpackPackSamples of file
> src/pack_utils.c, tainted variable cnt is too large, that makes pointer
> sptr read beyond heap bound.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...e-DSD-file-types-for-invalid-lengths.patch | 42 +++++++++++++++++++
>  package/wavpack/wavpack.mk                    |  3 ++
>  2 files changed, 45 insertions(+)
>  create mode 100644 package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
> 
> diff --git a/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch b/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
> new file mode 100644
> index 0000000000..76c1e81674
> --- /dev/null
> +++ b/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
> @@ -0,0 +1,42 @@
> +From 773f9d0803c6888ae7d5391878d7337f24216f4a Mon Sep 17 00:00:00 2001
> +From: David Bryant <david@wavpack.com>
> +Date: Tue, 23 Nov 2021 13:14:35 -0800
> +Subject: [PATCH] issue #110: sanitize DSD file types for invalid lengths
> +
> +[Retrieved from:
> +https://github.com/dbry/WavPack/commit/773f9d0803c6888ae7d5391878d7337f24216f4a]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + cli/dsdiff.c | 6 ++++++
> + cli/dsf.c    | 1 +
> + 2 files changed, 7 insertions(+)
> +
> +diff --git a/cli/dsdiff.c b/cli/dsdiff.c
> +index d7adb6a..5bdcae3 100644
> +--- a/cli/dsdiff.c
> ++++ b/cli/dsdiff.c
> +@@ -278,6 +278,12 @@ int ParseDsdiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
> +             }
> + 
> +             total_samples = dff_chunk_header.ckDataSize / config->num_channels;
> ++
> ++            if (total_samples <= 0 || total_samples > MAX_WAVPACK_SAMPLES) {
> ++                error_line ("%s is not a valid .DFF file!", infilename);
> ++                return WAVPACK_SOFT_ERROR;
> ++            }
> ++
> +             break;
> +         }
> +         else {          // just copy unknown chunks to output file
> +diff --git a/cli/dsf.c b/cli/dsf.c
> +index e1d7973..dddd488 100644
> +--- a/cli/dsf.c
> ++++ b/cli/dsf.c
> +@@ -113,6 +113,7 @@ int ParseDsfHeaderConfig (FILE *infile, char *infilename, char *fourcc, WavpackC
> + 
> +     if (format_chunk.ckSize != sizeof (DSFFormatChunk) || format_chunk.formatVersion != 1 ||
> +         format_chunk.formatID != 0 || format_chunk.blockSize != DSF_BLOCKSIZE || format_chunk.reserved ||
> ++        format_chunk.sampleCount <= 0 || format_chunk.sampleCount > MAX_WAVPACK_SAMPLES * 8 ||
> +         (format_chunk.bitsPerSample != 1 && format_chunk.bitsPerSample != 8) ||
> +         format_chunk.numChannels < 1 || format_chunk.numChannels > 6 ||
> +         format_chunk.chanType < 1 || format_chunk.chanType > NUM_CHAN_TYPES) {
> diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
> index 485ab9b2ae..2e0438ac80 100644
> --- a/package/wavpack/wavpack.mk
> +++ b/package/wavpack/wavpack.mk
> @@ -14,6 +14,9 @@ WAVPACK_LICENSE = BSD-3-Clause
>  WAVPACK_LICENSE_FILES = COPYING
>  WAVPACK_CPE_ID_VENDOR = wavpack
>  
> +# 0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
> +WAVPACK_IGNORE_CVES += CVE-2021-44269
> +
>  ifeq ($(BR2_PACKAGE_LIBICONV),y)
>  WAVPACK_CONF_OPTS += LIBS=-liconv
>  endif
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
