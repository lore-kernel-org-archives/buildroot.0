Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472A2C3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 079AF81B69;
	Fri,  2 May 2025 10:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-gAXVfHSqcS; Fri,  2 May 2025 10:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E26D83C46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E26D83C46;
	Fri,  2 May 2025 10:53:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4503FEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3694D420E1
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhFgZbd6nDss for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B8DF40B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B8DF40B0E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B8DF40B0E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:53:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 835DA1C00E6; Fri,  2 May 2025 12:53:04 +0200 (CEST)
Message-ID: <82969f9b-b662-4319-9c51-77181c7e4ccf@rnout.be>
Date: Fri, 2 May 2025 12:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20250418144342.24540-2-dalang@gmx.at>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250418144342.24540-2-dalang@gmx.at>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183184; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9/wF1SdzafhUXT3Bd3XkqozgOFOkyB2rCK2Sag+44VI=;
 b=GSFAx+ntODK5dBM5c3wSWPu5sTh1IEdHP8K3pEd6x+EcZVK/iuZDgowPeFV58/yK9KgBhO
 I+Lx53CX41LNTWp6fxhAtPsMEGLtW135ToiWDlbqOuov8Vy0k5pZUp5BkPoishbhrzIw36
 j85G496NFVZnjSR1B96NpZSHB/1w5MJE2Wos7Rfu2tMUZ698ui07PbqB8WN2yHHfD7uMDZ
 7B6zR2J71ldJoLbckDu22MDgMPlkPgdmso+uiqv6ArQ9fPDNpt2jP1lbTpYlNgRbjViC8P
 pPV8A2jn5+x+SlkXcMKPgACG6pw31o77XPtLV83NHP+lZ4gUEYsTtP4VwJT7Fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GSFAx+nt
Subject: Re: [Buildroot] [PATCH] package/glibmm2_66: bump to version 2.66.8
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



On 18/04/2025 16:43, Daniel Lang via buildroot wrote:
> https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.66.8/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/glibmm2_66/glibmm2_66.hash | 4 ++--
>   package/glibmm2_66/glibmm2_66.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibmm2_66/glibmm2_66.hash b/package/glibmm2_66/glibmm2_66.hash
> index 19272d2b90..20249977e8 100644
> --- a/package/glibmm2_66/glibmm2_66.hash
> +++ b/package/glibmm2_66/glibmm2_66.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.6.sha256sum
> -sha256  5358742598181e5351d7bf8da072bf93e6dd5f178d27640d4e462bc8f14e152f  glibmm-2.66.6.tar.xz
> +# From https://download.gnome.org/sources/glibmm/2.66/glibmm-2.66.8.sha256sum
> +sha256  64f11d3b95a24e2a8d4166ecff518730f79ecc27222ef41faf7c7e0340fc9329  glibmm-2.66.8.tar.xz
>   # License files, locally calculated
>   sha256  3ea7fa7c5d9a3a113e950eca9cfb85107f096270d8e4dd99daa9d8abdebc60e7  COPYING
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
> diff --git a/package/glibmm2_66/glibmm2_66.mk b/package/glibmm2_66/glibmm2_66.mk
> index 7f28342c52..bbf1a97f3f 100644
> --- a/package/glibmm2_66/glibmm2_66.mk
> +++ b/package/glibmm2_66/glibmm2_66.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   GLIBMM2_66_VERSION_MAJOR = 2.66
> -GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).6
> +GLIBMM2_66_VERSION = $(GLIBMM2_66_VERSION_MAJOR).8
>   GLIBMM2_66_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
>   GLIBMM2_66_LICENSE_FILES = COPYING COPYING.tools
>   GLIBMM2_66_SOURCE = glibmm-$(GLIBMM2_66_VERSION).tar.xz

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
