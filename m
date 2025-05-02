Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42318C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14DDC81882;
	Fri,  2 May 2025 10:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XL_GZrjRzyI1; Fri,  2 May 2025 10:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BCFE818CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BCFE818CD;
	Fri,  2 May 2025 10:52:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EF5B229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2140440E1E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NN2Do9YYKZT3 for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:52:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38C2C40B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38C2C40B0E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38C2C40B0E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:52:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4CC541C0F8A; Fri,  2 May 2025 12:52:23 +0200 (CEST)
Message-ID: <8f8ba98a-46d1-40e6-a68e-7ce958fa576b@rnout.be>
Date: Fri, 2 May 2025 12:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20250418144004.24089-2-dalang@gmx.at>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250418144004.24089-2-dalang@gmx.at>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183143; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FAbpTBGlP148STwGrwFIDxiQ3/iNU0tj4mFCvJfVg38=;
 b=XPQn4D8eGXqy9M9B9+78a8k8aCRKpGovqH7a5Ucjl/Vljdw3XbjeOmip+HJWlyJwGmeNh1
 QessIdIJ6ReYx9wRhowxRVD8JRXribczYfj12lXoVl3Wrh2mDxNB7czkbX8dACvrLqCHXa
 Jn6502t35+8tUHr60dttLeRg34CzVWMEiilVpruzSuNl9ZI2LxOTCRBhBXZBWm31SavUk0
 91Zd/MaeGyJJlze2NTD3uCZFsPOyunmkueZ1/nH64j1LfGVLkRsrek8/je2evTpzqgu/E2
 svHs9bB80whdfpPPVIU6JLpnCVz6lguwyFR3umL2qp/gvWv4B+RVlPzJhf4EDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XPQn4D8e
Subject: Re: [Buildroot] [PATCH] package/atkmm2_28: bump to version 2.28.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/04/2025 16:40, Daniel Lang via buildroot wrote:
> https://gitlab.gnome.org/GNOME/atkmm/-/blob/2.28.4/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/atkmm2_28/atkmm2_28.hash | 4 ++--
>   package/atkmm2_28/atkmm2_28.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/atkmm2_28/atkmm2_28.hash b/package/atkmm2_28/atkmm2_28.hash
> index 776c9851b8..b7c106d2d0 100644
> --- a/package/atkmm2_28/atkmm2_28.hash
> +++ b/package/atkmm2_28/atkmm2_28.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/atkmm/2.28/atkmm-2.28.3.sha256sum
> -sha256  7c2088b486a909be8da2b18304e56c5f90884d1343c8da7367ea5cd3258b9969  atkmm-2.28.3.tar.xz
> +# From https://download.gnome.org/sources/atkmm/2.28/atkmm-2.28.4.sha256sum
> +sha256  0a142a8128f83c001efb8014ee463e9a766054ef84686af953135e04d28fdab3  atkmm-2.28.4.tar.xz
>   # locally computed
>   sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
> diff --git a/package/atkmm2_28/atkmm2_28.mk b/package/atkmm2_28/atkmm2_28.mk
> index b56da61ec0..47924e64b6 100644
> --- a/package/atkmm2_28/atkmm2_28.mk
> +++ b/package/atkmm2_28/atkmm2_28.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   ATKMM2_28_VERSION_MAJOR = 2.28
> -ATKMM2_28_VERSION = $(ATKMM2_28_VERSION_MAJOR).3
> +ATKMM2_28_VERSION = $(ATKMM2_28_VERSION_MAJOR).4
>   ATKMM2_28_SOURCE = atkmm-$(ATKMM2_28_VERSION).tar.xz
>   ATKMM2_28_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM2_28_VERSION_MAJOR)
>   ATKMM2_28_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
