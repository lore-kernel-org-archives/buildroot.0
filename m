Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D32C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 13:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99B64417B5;
	Thu,  8 Jun 2023 13:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B64417B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fHQGBJH13Bwl; Thu,  8 Jun 2023 13:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D587140B74;
	Thu,  8 Jun 2023 13:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D587140B74
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BEAB1BF3A4
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 13:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8B3283BCF
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 13:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8B3283BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfzLHjk810Gv for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 13:42:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D909883BD1
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D909883BD1
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 13:42:10 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 8DC9344060F;
 Thu,  8 Jun 2023 16:41:43 +0300 (IDT)
References: <20230608132859.4162544-1-KAMenyaev@sberdevices.ru>
User-agent: mu4e 1.9.21; emacs 28.2
To: KAMenyaev@sberdevices.ru
Date: Thu, 08 Jun 2023 16:41:11 +0300
In-reply-to: <20230608132859.4162544-1-KAMenyaev@sberdevices.ru>
Message-ID: <87r0qmcbpu.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1686231703;
 bh=LV0UxpEG3ZPDa4cnmwWjOe4P/EMUxByB31g3iiKuLmk=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=RehboMhiwGpBNe6Q32Aeh13mcTXACoujrlFUjbjsnV0CYFp7Pg9ZAYvDbt2K37J/t
 yyFfF/M3nu1SVo5YPZIRunNH3s+tjva4tv5XjK2GcGVLxtAco4gGnvCe8e9kw3YV2L
 mqEhKgvlzFllQO5UrX2JFWbSnUEBCxvJkDQ8SQQgTNPeKjvkTRlN8TQoRW+9J2kDeD
 YRB3rUL7LOaLxgDe/RAA2o7DOGRgavO3XhR7ICtVVgloNuF5wE51Tpkf8+JyPGlc2f
 a5+B6J+/GqIUs8zf/HKfVBDdUIO91wtmq9Bj1Ye/TH2NMkBNSdPSrCmON3iK5yedsG
 jPd0LSssnwc1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=RehboMhi
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump to version 6.3
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org, sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Konstantin,

On Thu, Jun 08 2023, Konstantin Menyaev via buildroot wrote:
> From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
>
> Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>

This bump is already in the 'next' branch:

  https://git.buildroot.net/buildroot/commit/?id=fe567a81846b35b17c6989d759c2d893e46bc023

baruch

> ---
>  package/strace/strace.hash | 4 ++--
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/strace/strace.hash b/package/strace/strace.hash
> index d49abf1f16..555d074c5d 100644
> --- a/package/strace/strace.hash
> +++ b/package/strace/strace.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
> -# https://strace.io/files/6.2/strace-6.2.tar.xz.asc
> -sha256  0c7d38a449416268d3004029a220a15a77c2206a03cc88120f37f46e949177e8  strace-6.2.tar.xz
> +# https://strace.io/files/6.3/strace-6.3.tar.xz.asc
> +sha256  e17878e301506c1cc301611118ad14efee7f8bcef63b27ace5d290acce7bb731  strace-6.3.tar.xz
>  sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
>  sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
> diff --git a/package/strace/strace.mk b/package/strace/strace.mk
> index 730a91d277..6514bfe354 100644
> --- a/package/strace/strace.mk
> +++ b/package/strace/strace.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -STRACE_VERSION = 6.2
> +STRACE_VERSION = 6.3
>  STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
>  STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
>  STRACE_LICENSE = LGPL-2.1+


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
