Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213D2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C188084DDC;
	Sat, 18 Dec 2021 21:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id if1NAabJMQHe; Sat, 18 Dec 2021 21:50:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB5EC84DE0;
	Sat, 18 Dec 2021 21:50:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE2EB1BF2A0
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9BD940190
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pFrbEIzZg6y6 for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 21:50:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EE024017C
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:50:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BD18A5FF10;
 Sat, 18 Dec 2021 22:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639864233;
 bh=pJTtQtQrMf6YZzWDN86r5qWeswK+O92bSR7zavvu2xs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q6qX1cRs84SOuhdS/87gOrp8GcoE73sQAy4lIMGUSf1KIbWmsTINB94iYvuMcPQCC
 0fLOGqEZmGP8ousRRlRHKCnc7LsXm0LK0eR6tZu//gFDKpuu0UQOMjZlflGAFOT8Mt
 /3eJlV5fV7S1KsbYBVLqRZtE9i67dceo2TQNV8YZ4erOk5aIexJuMyQgIgXF58YrWq
 RZDAk5bcHpYTsDfhFgqq0EyAI+766APauQO2C0BL0PDfLZtxSu8FFoCxhxLyVAM1Zl
 2JxtqXDLKLUC87onagqCIFVqCJHXhe+M7FD4s0gOsfpz+kN+ItJysw4tw8xDVzzqxE
 neTFhYRw8eBGQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 22:50:24 +0100
Date: Sat, 18 Dec 2021 22:50:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211218215024.GQ2603@scaer>
References: <20211217214121.101414-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217214121.101414-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/lapack: fix CVE-2021-4048
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
Cc: Benjamin Kamath <kamath.ben@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-12-17 22:41 +0100, Fabrice Fontaine spake thusly:
> Fix CVE-2021-4048: An out-of-bounds read flaw was found in the CLARRV,
> DLARRV, SLARRV, and ZLARRV functions in lapack through version 3.10.0,
> as also used in OpenBLAS before version 0.3.18. Specially crafted inputs
> passed to these functions could cause an application using lapack to
> crash or possibly disclose portions of its memory.
> 
> It should be noted that commit 59a1fcc69620da8eab1c048977fa22d297b18284
> wrongly assumed that this CVE was fixed in version 3.10.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...001-Fix-out-of-bounds-read-in-slarrv.patch | 82 +++++++++++++++++++
>  package/lapack/lapack.mk                      |  3 +
>  2 files changed, 85 insertions(+)
>  create mode 100644 package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch
> 
> diff --git a/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch b/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch
> new file mode 100644
> index 0000000000..43c6444b02
> --- /dev/null
> +++ b/package/lapack/0001-Fix-out-of-bounds-read-in-slarrv.patch
> @@ -0,0 +1,82 @@
> +From 0631b6beaed60ba118b0b027c0f8d35397bf5df0 Mon Sep 17 00:00:00 2001
> +From: Keno Fischer <keno@juliacomputing.com>
> +Date: Thu, 30 Sep 2021 03:51:23 -0400
> +Subject: [PATCH] Fix out of bounds read in slarrv
> +
> +This was originally reported as https://github.com/JuliaLang/julia/issues/42415.
> +I've tracked this down to an our of bounds read on the following line:
> +
> +https://github.com/Reference-LAPACK/lapack/blob/44ecb6a5ff821b1cbb39f8cc2166cb098e060b4d/SRC/slarrv.f#L423
> +
> +In the crashing example, `M` is `0`, causing `slarrv` to read uninitialized
> +memory from the work array. I believe the `0` for `M` is correct and indeed,
> +the documentation above supports that `M` may be zero:
> +
> +https://github.com/Reference-LAPACK/lapack/blob/44ecb6a5ff821b1cbb39f8cc2166cb098e060b4d/SRC/slarrv.f#L113-L116
> +
> +I believe it may be sufficient to early-out this function as suggested
> +in this PR. However, I have limited context for the full routine here,
> +so I would appreciate a sanity check.
> +
> +[Retrieved from:
> +https://github.com/Reference-LAPACK/lapack/commit/38f3eeee3108b18158409ca2a100e6fe03754781]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + SRC/clarrv.f | 2 +-
> + SRC/dlarrv.f | 2 +-
> + SRC/slarrv.f | 2 +-
> + SRC/zlarrv.f | 2 +-
> + 4 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/SRC/clarrv.f b/SRC/clarrv.f
> +index 1f09e4da6..42f710757 100644
> +--- a/SRC/clarrv.f
> ++++ b/SRC/clarrv.f
> +@@ -348,7 +348,7 @@ SUBROUTINE CLARRV( N, VL, VU, D, L, PIVMIN,
> + *
> + *     Quick return if possible
> + *
> +-      IF( N.LE.0 ) THEN
> ++      IF( (N.LE.0).OR.(M.LE.0) ) THEN
> +          RETURN
> +       END IF
> + *
> +diff --git a/SRC/dlarrv.f b/SRC/dlarrv.f
> +index b036c1e66..299430361 100644
> +--- a/SRC/dlarrv.f
> ++++ b/SRC/dlarrv.f
> +@@ -350,7 +350,7 @@ SUBROUTINE DLARRV( N, VL, VU, D, L, PIVMIN,
> + *
> + *     Quick return if possible
> + *
> +-      IF( N.LE.0 ) THEN
> ++      IF( (N.LE.0).OR.(M.LE.0) ) THEN
> +          RETURN
> +       END IF
> + *
> +diff --git a/SRC/slarrv.f b/SRC/slarrv.f
> +index 9d72b339a..95f94fd1b 100644
> +--- a/SRC/slarrv.f
> ++++ b/SRC/slarrv.f
> +@@ -350,7 +350,7 @@ SUBROUTINE SLARRV( N, VL, VU, D, L, PIVMIN,
> + *
> + *     Quick return if possible
> + *
> +-      IF( N.LE.0 ) THEN
> ++      IF( (N.LE.0).OR.(M.LE.0) ) THEN
> +          RETURN
> +       END IF
> + *
> +diff --git a/SRC/zlarrv.f b/SRC/zlarrv.f
> +index 51ec558f5..e4be63e0d 100644
> +--- a/SRC/zlarrv.f
> ++++ b/SRC/zlarrv.f
> +@@ -348,7 +348,7 @@ SUBROUTINE ZLARRV( N, VL, VU, D, L, PIVMIN,
> + *
> + *     Quick return if possible
> + *
> +-      IF( N.LE.0 ) THEN
> ++      IF( (N.LE.0).OR.(M.LE.0) ) THEN
> +          RETURN
> +       END IF
> + *
> diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
> index f34f685ae2..a80131c9ad 100644
> --- a/package/lapack/lapack.mk
> +++ b/package/lapack/lapack.mk
> @@ -12,6 +12,9 @@ LAPACK_INSTALL_STAGING = YES
>  LAPACK_SUPPORTS_IN_SOURCE_BUILD = NO
>  LAPACK_CONF_OPTS = -DLAPACKE=ON -DCBLAS=ON
>  
> +# 0001-Fix-out-of-bounds-read-in-slarrv.patch
> +LAPACK_IGNORE_CVES += CVE-2021-4048
> +
>  ifeq ($(BR2_PACKAGE_LAPACK_COMPLEX),y)
>  LAPACK_CONF_OPTS += -DBUILD_COMPLEX=ON -DBUILD_COMPLEX16=ON
>  else
> -- 
> 2.33.0
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
