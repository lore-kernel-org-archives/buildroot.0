Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84254CD4F54
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 19:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F3FF6068F;
	Mon, 18 May 2026 19:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0M32d69x_wB; Mon, 18 May 2026 19:26:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E50560720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779132368;
	bh=JoKk+j6U/j9ixVMI9A1u0Ihqc0FXLVq5kfEdrAhC9tQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G/2R0tnaaNbYb3ngzGq+xJ7D2f8MHnwk5aUB2AANcs2NGTWDEpUSXQm1Kh7pNsVDg
	 HW4hUwwcqCls6eGR12xwjHDLDt+sX2BxZpoSxzlYjDFEV9ZwdQ5ODrgq5ujUR0vgVV
	 r6oZwX1pb+n1S4EMaqIFHuJFmNwVrqRvkpd8avrRNW9QcxPlAONyYh02dfBQVMya2p
	 /U14yIgTXrbmfsbjXYMQF428uNyNhOdas2HTYJDK2ewBVjAVBmEkQKEeFB+L8m88kD
	 wIpRyUY4Z43pjtvIunulgdn+EmbKsetPcK0dT5lC6CNvTFKTvWtRG21BvrC0gyeg6k
	 l3sL6/OblEBPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E50560720;
	Mon, 18 May 2026 19:26:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA228265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5F5E401B0
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Ir5LmhHSSyP for <buildroot@buildroot.org>;
 Mon, 18 May 2026 19:26:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4B0F401A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4B0F401A0
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4B0F401A0
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:26:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 76CD2B97BE3F; Mon, 18 May 2026 21:26:03 +0200 (CEST)
Message-ID: <d02d0c67-54ce-4522-8396-f96758df80e7@rnout.be>
Date: Mon, 18 May 2026 21:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: john.ernberg@actia.se, Andreas Ziegler <br025@umbiko.net>
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-5-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260510193826.2846038-5-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779132364; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=wPPuNBA770VHKpaHsdQCRX902NzSWNS9y14oRMrn+5w=;
 b=bi8jgFuxb1pTUi+f+LbRchAf4pT5j8UGzD4sXTiycBFpkVac+lsqli0lA4wwjQjsgz6Eae
 3dGGtgg1bTTjavPtn/s9GyfXSvWCq2S3nSH02Bz/vQ6zETAHYaEbBna3oz9oqgMBVGcrNs
 Um7/400TNz9P9oiEoKfhq0WztWlmcQgsrPY7s8laKVHEMnHLkFouNWHbJyHXjlcFy5m12R
 G5tFS2quchiAAOaUHhmph9jejcyos7gJHbZt8JSHWGuYIPpZ+RSuU7MYiDk6fmUwsU6oiS
 5xXYCQnH39B+EjrTgrT04CPfRtoajuPDueoQLomUBX5ItIfSc3buWYy3MNyrDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=bi8jgFux
Subject: Re: [Buildroot] [RESEND PATCH 4/8] package/mpd: Disable sidplay
 support
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



On 10/05/2026 21:38, John Ernberg wrote:
> Commit 25af5a3b3aa3 ("package/mpd: update version to 0.24") from March 2025
> bumped mpd to a version that dropped support for the libsidplay2 library in
> favor of libsidplayfp. [1]
> 
> Since libsidplayfp is not provided by buildroot and no one has complained
> yet the sidplay feature is likely unused, as enabling it breaks the build.
> 
> Drop support. If someone needs it it can be re-added along with the
> dependency.
> 
> Link: https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24/NEWS [1]
> Cc: Andreas Ziegler <br025@umbiko.net>
> Signed-off-by: John Ernberg <j@j-ernberg.se>

  Applied to next, thanks!

  Regards,
  Arnout

> ---
> 
> RESEND:
>   - Forgot to subscribe this e-mail to the list
> 
>   package/mpd/mpd.mk | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index ce7c44a9a8..e60eb23cfa 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -24,6 +24,7 @@ MPD_CONF_OPTS = \
>   	-Dmpcdec=disabled \
>   	-Dopenmpt=disabled \
>   	-Dpipewire=disabled \
> +	-Dsidplay=disabled \
>   	-Dsnapcast=false
>   
>   ifeq ($(BR2_PACKAGE_EXPAT),y)
> @@ -284,13 +285,6 @@ else
>   MPD_CONF_OPTS += -Dshout=disabled
>   endif
>   
> -ifeq ($(BR2_PACKAGE_MPD_SIDPLAY),y)
> -MPD_DEPENDENCIES += libsidplay2
> -MPD_CONF_OPTS += -Dsidplay=enabled
> -else
> -MPD_CONF_OPTS += -Dsidplay=disabled
> -endif
> -
>   ifeq ($(BR2_PACKAGE_MPD_SQLITE),y)
>   MPD_DEPENDENCIES += sqlite
>   MPD_CONF_OPTS += -Dsqlite=enabled

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
