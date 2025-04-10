Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38150C3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 04:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD93260B06;
	Thu, 10 Apr 2025 04:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6FjwXGJ8MU2; Thu, 10 Apr 2025 04:07:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7652B608D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7652B608D6;
	Thu, 10 Apr 2025 04:07:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D47A8108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 04:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C34A180E9D
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 04:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMYwslGHCG9F for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 04:07:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CD5783065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CD5783065
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CD5783065
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 04:07:09 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 8509B4408BE;
 Thu, 10 Apr 2025 07:06:24 +0300 (IDT)
To: Matt Silva <dev@matt-silva.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250410012923.37614-1-dev@matt-silva.com> (Matt Silva's message
 of "Wed, 9 Apr 2025 21:29:23 -0400")
References: <20250410012923.37614-1-dev@matt-silva.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 10 Apr 2025 07:07:05 +0300
Message-ID: <87zfgo8xsm.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1744257984;
 bh=p70OtxuYai0QkRw3lO51As2Kp+7v5zCJfkMBU1Sti4w=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hiHQbVsfqg0ZrUr8CIe4IU2vPmSfEgOoqf3B/ncXgG0E1drI2tMgXSlqzHOg/ykt1
 S2VBLjIn7MXCX2GowzQ1rfCzvV5Cm6+sTAIbY+ey9RUqxeRd2fEqdUiBM86xBFOWMR
 zxerI3+bvERzVPh1BMtvcSNMt//3FOe7rjLvlZnBXL/DNGUx8KMGOwcPIofnS/HLtu
 9yXTW4I7flAGLtnVMJXOPxL7c0jrB5BVZUk6sqGevzfYzuhd/XRZVZYQ6WQU2b69QU
 YeJgnv91NDhC1LslbAkxsNhipZoaphMWlq0ZT5STOPQhNkUDFVZ1LDr2GddRVxC7Lt
 0EEorjli9YxZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=hiHQbVsf
Subject: Re: [Buildroot] [PATCH 1/1] package/rlwrap: use the github helper
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

Hi Matt,

On Wed, Apr 09 2025, Matt Silva wrote:
> Currently, rlwrap just downloads directly from the hardcoded URL to its
> Github releases. However, we have a github helper function to streamline
> this and handle if Github changes its download mechanisms in the future.
>
> Signed-off-by: Matt Silva <dev@matt-silva.com>
> ---
>  package/rlwrap/rlwrap.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/rlwrap/rlwrap.mk b/package/rlwrap/rlwrap.mk
> index e3973e841b..3d3d4fab92 100644
> --- a/package/rlwrap/rlwrap.mk
> +++ b/package/rlwrap/rlwrap.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RLWRAP_VERSION = 0.46.1
> -RLWRAP_SITE = https://github.com/hanslub42/rlwrap/releases/download/$(RLWRAP_VERSION)
> +RLWRAP_SITE = $(call github,hanslub42,rlwrap,v$(RLWRAP_VERSION))

We prefer to use release tarball when the package maintainer provides
one. See the relevant section in the Buildroot manual:

  https://buildroot.org/downloads/manual/manual.html#github-download-url

baruch

>  RLWRAP_LICENSE = GPL-2.0+
>  RLWRAP_LICENSE_FILES = AUTHORS COPYING

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
