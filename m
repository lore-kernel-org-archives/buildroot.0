Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCD7D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80FF94068D;
	Thu, 27 Nov 2025 20:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bT0MhiNiZT67; Thu, 27 Nov 2025 20:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEA474061D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEA474061D;
	Thu, 27 Nov 2025 20:06:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CD09708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2312C405C0
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwNR_v_Nt6ZE for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:06:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DF3A4059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DF3A4059A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DF3A4059A
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:06:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1337AB979CEF; Thu, 27 Nov 2025 21:06:51 +0100 (CET)
Message-ID: <55f732c2-a8ca-4de8-aed5-89340f0b3324@rnout.be>
Date: Thu, 27 Nov 2025 21:06:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251122124909.2229139-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251122124909.2229139-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764274011; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=S8JWsp7is1mi0wVAz8NfkFkJRmCV4VS25nZkgGcgAZI=;
 b=g8EAj4f/eFmDjbJ0uHBPH1DvIJ2yBTHUrxkUuXdSQyvmdQvP16O8IdRNghBEJFVfgTCjH0
 V288AFzHNE/YybwKVqMzfPgH+JbDWfJqa/zRuRKH4bGxfjv2QANNHS/f4YeRPIzesh9zKO
 Q36T6x1aP2TIlq1cMVAgCQntf5sS+gtVbcXhnDzrjmlNiHR44AbWG1+EYVAwSPiHEqmJR2
 GMH5+fRIIyNwc+0HeRzXCefgVvm/4Mg3IyB5joB0eozwY5taiK7VJWFyOfsQUTPom8HOr7
 4LLF7i48I7Snl+MCVM6iYinsuaJQzHG0yEOXG+egPAZ1/sbG5K9+Na2gnwIeag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=g8EAj4f/
Subject: Re: [Buildroot] [PATCH 1/1] package/open-plc-utils: bump version
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



On 22/11/2025 13:49, Bernd Kuhls wrote:
> Changelog:
> https://github.com/qca/open-plc-utils/compare/1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2...46c3506453c15b873fd6ed3e76c9872cea5e143a
> 
> Upstream commit
> https://github.com/qca/open-plc-utils/commit/cbf52f68b5e2ab0c4071600ab34126120e54f5cd
> fixes build errors with newer gcc versions.
> 
> Instead of adding this patch to buildroot we bump to HEAD which also
> includes other bug fixes and documentation updates.
> 
> Fixes:
> https://autobuild.buildroot.net/results/c74/c74730bbadc9ba20cdccf448dbc508d0afbabf41/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/open-plc-utils/open-plc-utils.hash | 2 +-
>   package/open-plc-utils/open-plc-utils.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/open-plc-utils/open-plc-utils.hash b/package/open-plc-utils/open-plc-utils.hash
> index 0ab661231a..bcb5253bb9 100644
> --- a/package/open-plc-utils/open-plc-utils.hash
> +++ b/package/open-plc-utils/open-plc-utils.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4b1b55896939f178321ffe1ec2dc6937ea688d577b3671a5f0edb5c3326dfa3d  open-plc-utils-1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2.tar.gz
> +sha256  e02ffc2d2abde6f31c183b0717742c243b5746d0dbe9ffaa38f6154f14a1bd4d  open-plc-utils-46c3506453c15b873fd6ed3e76c9872cea5e143a.tar.gz
>   sha256  3137c632bbcec5e88b72dc13f4fe06ee184eea364fec8f7494bdfa57672ef921  LICENSE
> diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
> index 086552e09b..1c0d213278 100644
> --- a/package/open-plc-utils/open-plc-utils.mk
> +++ b/package/open-plc-utils/open-plc-utils.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPEN_PLC_UTILS_VERSION = 1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2
> +OPEN_PLC_UTILS_VERSION = 46c3506453c15b873fd6ed3e76c9872cea5e143a
>   OPEN_PLC_UTILS_SITE = $(call github,qca,open-plc-utils,$(OPEN_PLC_UTILS_VERSION))
>   OPEN_PLC_UTILS_LICENSE = BSD-3-Clause
>   OPEN_PLC_UTILS_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
