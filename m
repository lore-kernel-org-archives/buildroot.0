Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF22C3ABC9
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 04:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17ADA411AB;
	Thu,  8 May 2025 04:20:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3puhRjcen-b0; Thu,  8 May 2025 04:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C1EE4118B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C1EE4118B;
	Thu,  8 May 2025 04:20:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3164C439
 for <buildroot@buildroot.org>; Thu,  8 May 2025 04:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1435460A92
 for <buildroot@buildroot.org>; Thu,  8 May 2025 04:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5eTgFhsNkRu for <buildroot@buildroot.org>;
 Thu,  8 May 2025 04:20:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5742460AAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5742460AAE
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5742460AAE
 for <buildroot@buildroot.org>; Thu,  8 May 2025 04:20:01 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 7C68244094B;
 Thu,  8 May 2025 07:19:47 +0300 (IDT)
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250507201105.1505495-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Wed, 7 May 2025 22:11:04 +0200")
References: <20250507201105.1505495-1-thomas.petazzoni@bootlin.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 08 May 2025 07:19:57 +0300
Message-ID: <8734dfzqc2.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1746677987;
 bh=+ElThS92Dqw/A9FUyA8613E7coo7BOVdEnlmbKPjHOg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=c53IZm+onwnQfMTwZmaN1BkJvOXGa44PmJg6DyXb7S63N+SEpjnWzw0lCem/OnqlK
 56TrQb1KolwV5jjfYaOXizn3VnS1xcrz7bOyBGVMLvtxYo50prnFxTLL1kV3QCtny/
 Rzc1NysDEJwMXSLSsBF4JhhwsKhHKUBOmIvnZhdKcwCIDO/2n2W/5ZZm7IckM7cBTY
 Tmi150dfpjCK7q3p/HqtPh8RTWGmjQhO4vKdNELiAGzHqE5tUWHL7UDLz0Io0muXF2
 cIxWsrI7MVa5eKD1Taw+0Bku8uFLlesJbT1caszYdj/js6NFr/R68Eo0MN10pLoBOA
 +vrQ7VqIJY/GQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=c53IZm+o
Subject: Re: [Buildroot] [PATCH] support/dependencies/dependencies.sh: awk
 is needed by Buildroot
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Tomas,

On Wed, May 07 2025, Thomas Petazzoni via buildroot wrote:
[...]
> diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
> index 5d3aa297a9..9ccc30cca0 100644
> --- a/docs/manual/prerequisite.adoc
> +++ b/docs/manual/prerequisite.adoc
> @@ -38,6 +38,7 @@ between distributions).
>  ** +file+ (must be in +/usr/bin/file+)
>  ** +bc+
>  ** +findutils+
> +**  awk

Any reason to make text formatting for this item different than all
other listed packages?

baruch

>  
>  * Source fetching tools:
>  ** +wget+
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index fb0defd0c9..2843e3c5d5 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -154,7 +154,7 @@ fi
>  
>  # Check that a few mandatory programs are installed
>  missing_progs="no"
> -for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
> +for prog in perl tar wget cpio unzip rsync bc cmp find xargs awk ${DL_TOOLS} ; do
>  	if ! which $prog > /dev/null ; then
>  		echo "You must install '$prog' on your build machine";
>  		missing_progs="yes"

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
