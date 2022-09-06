Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD79C38145
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 07:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1C4B81C11;
	Tue,  6 Sep 2022 07:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1C4B81C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dt5hQZ3MS49P; Tue,  6 Sep 2022 07:34:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE31C81BB2;
	Tue,  6 Sep 2022 07:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE31C81BB2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3118F1BF30F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 07:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C75E81BB2
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 07:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C75E81BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pud-3wdWgNC1 for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 07:34:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F9BE81BB0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F9BE81BB0
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 07:34:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 016ADB0051E;
 Tue,  6 Sep 2022 09:34:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 09:34:01 +0200
Date: Tue, 6 Sep 2022 09:34:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: sergio.prado@e-labworks.com
Message-ID: <20220906073401.GN1490660@scaer>
References: <20220905135533.4182511-1-sergio.prado@e-labworks.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220905135533.4182511-1-sergio.prado@e-labworks.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662449644;
 bh=fCAPBkM7bE9FGlvtF2bJ39Ot3xJjkumiFUroG9VEoxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GzdTfPnu+VIs3JboAtuaswJg/hx2AlMNYe6zntlReR9ED5VlS4JDrOWU6/ascEawF
 vT6BVO0aFKDfH7htNZkaBkxR3t5WRMwUcOanM3UXG86Vcrjz1B+9koDIbqueEJP10U
 nEqBxCfMVQXddCvsPDCFZ+Vt/L/AWbG/nYSx9Iv6ltJ75+BhxLhbI7ykZAYiYMYu0f
 rQYCP+CVQwtiAYzdSD/m8I6/ovYH5BMAvc9pHGJm3vApkmDOwamTG0gLO1elfoEDLh
 efP4P5nKSmbayUZDy6S5w+TPZhtn7HofDfG9AAVaSB9ruVTXLvkTO1mp0sOOIyaAIw
 4T9nhyX6H2yow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GzdTfPnu
Subject: Re: [Buildroot] [PATCH] package/stella: bump to version 6.7
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

Sergio, All,

On 2022-09-05 10:55 -0300, Sergio Prado via buildroot spake thusly:
> From: Sergio Prado <sergio.prado@e-labworks.com>
> 
> - drop a patch (already in version)
> - update Copyright.txt (changed from 1995-2021 to 1995-2022)
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/stella/0001-configure-add-CC.patch | 30 ----------------------
>  package/stella/stella.hash                 |  4 +--
>  package/stella/stella.mk                   |  2 +-
>  3 files changed, 3 insertions(+), 33 deletions(-)
>  delete mode 100644 package/stella/0001-configure-add-CC.patch
> 
> diff --git a/package/stella/0001-configure-add-CC.patch b/package/stella/0001-configure-add-CC.patch
> deleted file mode 100644
> index d4b29e39b5d5..000000000000
> --- a/package/stella/0001-configure-add-CC.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 143cf9fa13a07b827de7065a5e919631406b0941 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 12 Dec 2021 22:46:52 +0100
> -Subject: [PATCH] configure: add CC (#854)
> -
> -Add CC to fix the following build failure when cross-compiling which is
> -raised since
> -https://github.com/stella-emu/stella/commit/771b5b44e31de1b81a552ee47b65014fbc338776:
> -
> -out/src/sqlite/sqlite3.o: file not recognized: file format not recognized
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/stella-emu/stella/commit/143cf9fa13a07b827de7065a5e919631406b0941]
> ----
> - configure | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/configure b/configure
> -index df666b377..0101d2567 100755
> ---- a/configure
> -+++ b/configure
> -@@ -899,6 +899,7 @@ echo "Creating config.mak"
> - cat > config.mak << EOF
> - # -------- Generated by configure -----------
> - 
> -+CC := $CC
> - CXX := $CXX
> - CXXFLAGS := $CXXFLAGS
> - LD := $LD
> diff --git a/package/stella/stella.hash b/package/stella/stella.hash
> index 8aa51181650c..17d059226cfd 100644
> --- a/package/stella/stella.hash
> +++ b/package/stella/stella.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  d481efc6d27b5294565dfcc10983de2dbc4db8a59932a678ffdb4d2404b8c207  stella-6.6-src.tar.xz
> -sha256  d5e5897578c2590e48328986cebd950ff215653f7f506ef93accf981870366a6  Copyright.txt
> +sha256  babfcbb39abbd1a992cb1e6d3b2f508df7ed19cb9d0b5b5d624828bb98f97267  stella-6.7-src.tar.xz
> +sha256  e82dd017fea2c70a16726aa1d7c05c5b7597e10f7229511c1b110bf84cb507c0  Copyright.txt
>  sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
> diff --git a/package/stella/stella.mk b/package/stella/stella.mk
> index 198a1134dc7e..aa5da1996e1f 100644
> --- a/package/stella/stella.mk
> +++ b/package/stella/stella.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -STELLA_VERSION = 6.6
> +STELLA_VERSION = 6.7
>  STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
>  STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
>  STELLA_LICENSE = GPL-2.0+
> -- 
> 2.25.1
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
