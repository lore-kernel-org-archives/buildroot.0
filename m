Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A58C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 12:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06B2F418B7;
	Tue, 19 Apr 2022 12:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id up6G8qjud4yA; Tue, 19 Apr 2022 12:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDA064167C;
	Tue, 19 Apr 2022 12:35:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3551BF288
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 12:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76D1E40C64
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 12:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZRePRnuVJct for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 12:35:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 691CA40125
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 12:35:25 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4KjNYh6bk9z9sld
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 14:35:20 +0200 (CEST)
Message-ID: <8e960e59-65c7-22eb-eccf-7217ec6b09e8@othermo.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1650371718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXTCzndctt5r84fn8hieGjYcVZDTn1ggZ20uZ4wKr4I=;
 b=uxaE7B5xidEQMvnlMK1GMOH4mU5ZXJNc/NuB3VLy1kgHjCeUGcCrEotHJqzh+RsBQicT7A
 dOj5JsAXFrDsJRePvLPITVYXVm/OGW2y/JS7bC8eAXMYBmht13rICDRLty21vUZBxj84t0
 DlECqjq6Cx2JNg/Rx5CN4yv/zMRaNc14QFkBzxxTibTINOqPi2xyrDnh3WpncZhufDW2HI
 U2k+XV+7X6UhWOoBdpH6p5u/xQOmHPnEu9qXbROf57x+YIgURw0JUaJAMH7NwF15y/Ircg
 eUulgydoip9eIyzZvmpz7UZBQ9hhzQA75B1uMoboCbMEPN+8m1pVVDgvjXlqxw==
Date: Tue, 19 Apr 2022 14:35:13 +0200
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220419113409.1008586-1-peter@korsgaard.com>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220419113409.1008586-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/xz: add upstream security fix for
 CVE-2022-1271 / ZDI-CAN-16587
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19.04.22 13:34, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> - CVE-2022-1271: Malicious filenames can make xzgrep to write to arbitrary
>    files or (with a GNU sed extension) lead to arbitrary code execution.
> 
> For more details, see the announcement and advisory:
> 
> https://www.mail-archive.com/xz-devel@tukaani.org/msg00551.html
> https://www.zerodayinitiative.com/advisories/ZDI-22-619/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Ah, that's better than my attempt :-).

Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

> ---
>   package/xz/xz.hash | 1 +
>   package/xz/xz.mk   | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/package/xz/xz.hash b/package/xz/xz.hash
> index 3dd0cbe459..9577e98e80 100644
> --- a/package/xz/xz.hash
> +++ b/package/xz/xz.hash
> @@ -1,5 +1,6 @@
>   # Locally calculated after checking pgp signature
>   sha256  5117f930900b341493827d63aa910ff5e011e0b994197c3b71c08a20228a42df  xz-5.2.5.tar.bz2
> +sha256  98c6cb1042284fe704ec30083f3fc87364ce9ed2ea51f62bbb0ee9d3448717ec  xzgrep-ZDI-CAN-16587.patch
>   
>   # Hash for license files
>   sha256  bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c  COPYING
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index af611975a0..cdb01e06a9 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -13,6 +13,10 @@ XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
>   XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
>   XZ_CPE_ID_VENDOR = tukaani
>   
> +XZ_PATCH = xzgrep-ZDI-CAN-16587.patch
> +# xzgrep-ZDI-CAN-16587.patch
> +XZ_IGNORE_CVES += CVE-2022-1271
> +
>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>   XZ_CONF_OPTS += --enable-threads
>   else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
