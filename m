Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13165C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A05B4416FD;
	Sun, 17 Jul 2022 13:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A05B4416FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ssJC84lbTc51; Sun, 17 Jul 2022 13:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A676416F7;
	Sun, 17 Jul 2022 13:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A676416F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F37341BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBD94409D3
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBD94409D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPHp2bC0yskk for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:23:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9962400DD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9962400DD
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:23:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C7534780501;
 Sun, 17 Jul 2022 15:23:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:23:36 +0200
Date: Sun, 17 Jul 2022 15:23:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717132336.GL2249625@scaer>
References: <20220710134822.373689-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220710134822.373689-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658064218;
 bh=mTuSwxrW4omaDY8+suc/lnx2qOHMXjY1hZJEqHoMyVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UTmGY9yXrwZOHbYIi7n1ZO1cd9qOnLNsaKFqnMnup8ybU13xan74Epdgvi/xWh850
 dHBq9MAGKzeEphk/Jwh//wWypfjITCyOW36mGYWCPxu+UPPLqgGZ1bAsGdDO42mJZ3
 imXtKerdXil/AgvdnM5zJGY3xIFEUEJKCGEALtROdvTdXvGQKGlS/Q7JcilsiZqijO
 DztAl2XlY8hSfgAoTFcdNqWRcxgF7734goq2pBy62wUgy2jVOWkSHxHncqHujqohQ0
 88Q01vqMMfGWJT+oWHfMTVA27MDpNWFt1xbEVxAj/FGT/CkAnW/s4TywpVMGr9e0/W
 vHmK+tI6Ukj/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UTmGY9yX
Subject: Re: [Buildroot] [PATCH 1/1] package/wavpack: bump to version 5.5.0
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

On 2022-07-10 15:48 +0200, Fabrice Fontaine spake thusly:
> - Drop patch (already in version)
> - Update hash of license file (update in year:
>   https://github.com/dbry/WavPack/commit/30d4161c47e135bda2c25a2161b9e3e44e4980ce)
> 
> https://github.com/dbry/WavPack/releases/tag/5.5.0
> https://github.com/dbry/WavPack/blob/5.5.0/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...e-DSD-file-types-for-invalid-lengths.patch | 42 -------------------
>  package/wavpack/wavpack.hash                  |  4 +-
>  package/wavpack/wavpack.mk                    |  5 +--
>  3 files changed, 3 insertions(+), 48 deletions(-)
>  delete mode 100644 package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
> 
> diff --git a/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch b/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
> deleted file mode 100644
> index 76c1e81674..0000000000
> --- a/package/wavpack/0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 773f9d0803c6888ae7d5391878d7337f24216f4a Mon Sep 17 00:00:00 2001
> -From: David Bryant <david@wavpack.com>
> -Date: Tue, 23 Nov 2021 13:14:35 -0800
> -Subject: [PATCH] issue #110: sanitize DSD file types for invalid lengths
> -
> -[Retrieved from:
> -https://github.com/dbry/WavPack/commit/773f9d0803c6888ae7d5391878d7337f24216f4a]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - cli/dsdiff.c | 6 ++++++
> - cli/dsf.c    | 1 +
> - 2 files changed, 7 insertions(+)
> -
> -diff --git a/cli/dsdiff.c b/cli/dsdiff.c
> -index d7adb6a..5bdcae3 100644
> ---- a/cli/dsdiff.c
> -+++ b/cli/dsdiff.c
> -@@ -278,6 +278,12 @@ int ParseDsdiffHeaderConfig (FILE *infile, char *infilename, char *fourcc, Wavpa
> -             }
> - 
> -             total_samples = dff_chunk_header.ckDataSize / config->num_channels;
> -+
> -+            if (total_samples <= 0 || total_samples > MAX_WAVPACK_SAMPLES) {
> -+                error_line ("%s is not a valid .DFF file!", infilename);
> -+                return WAVPACK_SOFT_ERROR;
> -+            }
> -+
> -             break;
> -         }
> -         else {          // just copy unknown chunks to output file
> -diff --git a/cli/dsf.c b/cli/dsf.c
> -index e1d7973..dddd488 100644
> ---- a/cli/dsf.c
> -+++ b/cli/dsf.c
> -@@ -113,6 +113,7 @@ int ParseDsfHeaderConfig (FILE *infile, char *infilename, char *fourcc, WavpackC
> - 
> -     if (format_chunk.ckSize != sizeof (DSFFormatChunk) || format_chunk.formatVersion != 1 ||
> -         format_chunk.formatID != 0 || format_chunk.blockSize != DSF_BLOCKSIZE || format_chunk.reserved ||
> -+        format_chunk.sampleCount <= 0 || format_chunk.sampleCount > MAX_WAVPACK_SAMPLES * 8 ||
> -         (format_chunk.bitsPerSample != 1 && format_chunk.bitsPerSample != 8) ||
> -         format_chunk.numChannels < 1 || format_chunk.numChannels > 6 ||
> -         format_chunk.chanType < 1 || format_chunk.chanType > NUM_CHAN_TYPES) {
> diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
> index abc9ab6905..021703df74 100644
> --- a/package/wavpack/wavpack.hash
> +++ b/package/wavpack/wavpack.hash
> @@ -1,3 +1,3 @@
>  # locally computed hash
> -sha256  4bde6a6b2a86614a6bd2579e60dcc974e2c8f93608d2281110a717c1b3c28b79  wavpack-5.4.0.tar.xz
> -sha256  f38defde000d62c4ff158f1445cb85a0c2f67cbc1d3cfa34ed882f439f6e3b43  COPYING
> +sha256  ef749d98df46925bc2916993e601cc7ee9114d99653e63e0e304f031ba73b8e6  wavpack-5.5.0.tar.xz
> +sha256  275d65ec11a78d552d078b9c26d950e3075892bca895a415ceaaec33bcfabff9  COPYING
> diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
> index 2e0438ac80..a3d952e29b 100644
> --- a/package/wavpack/wavpack.mk
> +++ b/package/wavpack/wavpack.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WAVPACK_VERSION = 5.4.0
> +WAVPACK_VERSION = 5.5.0
>  WAVPACK_SITE = \
>  	https://github.com/dbry/WavPack/releases/download/$(WAVPACK_VERSION)
>  WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.xz
> @@ -14,9 +14,6 @@ WAVPACK_LICENSE = BSD-3-Clause
>  WAVPACK_LICENSE_FILES = COPYING
>  WAVPACK_CPE_ID_VENDOR = wavpack
>  
> -# 0001-issue-110-sanitize-DSD-file-types-for-invalid-lengths.patch
> -WAVPACK_IGNORE_CVES += CVE-2021-44269
> -
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
