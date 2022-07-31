Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EFCC00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 11:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9F6940CD8;
	Sun, 31 Jul 2022 11:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9F6940CD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oBjle6InsRqr; Sun, 31 Jul 2022 11:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB155408DA;
	Sun, 31 Jul 2022 11:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB155408DA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 717A61BF589
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 11:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CD3860E7C
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 11:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CD3860E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aH6zlGqJehxW for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 11:47:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66D9560E93
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66D9560E93
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 11:47:49 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 4B1BF44086F;
 Sun, 31 Jul 2022 14:47:08 +0300 (IDT)
References: <20220731114235.93784-1-bernd.kuhls@t-online.de>
User-agent: mu4e 1.8.6; emacs 27.1
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jul 2022 14:45:27 +0300
In-reply-to: <20220731114235.93784-1-bernd.kuhls@t-online.de>
Message-ID: <87les9wlk0.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1659268028;
 bh=pRPalwDjy0LvTDyCYAsFBbCeaDQKStFFWcKK9KJCetU=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=WlR4CLsFy2CbixIAohk3Wbm4bZvsfBv6Vg+2zWPkrS5ALns2DRGn9sW23tj9SuvLx
 VArGVPLqFSMB+AKAXnKCvvBNrKZtxxuAm5yYVjWJ0ztZdEIULv9M0F7chNqtHHcIHX
 V2aQx6RA+FcsecTRDkXRaWVO2MsHQmBOWudNAXC5HRgEovOhp4LZ28ltyAAUQAswwr
 f9nVivseUUUxRmBe3kJ98nzQ3R31/n7W9rzd8hWBeTY8JSygjEakzH87LLZtVXd/dP
 ycFkFaCWMLloP4UYwNI1/zZjBPEHF4trAC0N2/OCfYnGxMJAg2Rc8gsW9yFAoI7+Km
 y+2bQIzRjJJ9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=WlR4CLsF
Subject: Re: [Buildroot] [PATCH 1/1] package/php: ignore various CVEs
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Sun, Jul 31 2022, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/php.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/php/php.mk b/package/php/php.mk
> index cb7a8d71d4..8e362ba144 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -14,6 +14,12 @@ PHP_DEPENDENCIES = host-pkgconf pcre2
>  PHP_LICENSE = PHP-3.01
>  PHP_LICENSE_FILES = LICENSE
>  PHP_CPE_ID_VENDOR = php
> +# fixed with version 5.x: https://ubuntu.com/security/notices/USN-485-1
> +PHP_IGNORE_CVES += CVE-2007-2728

Why do we need to ignore these old CVEs? Isn't the package version check
sufficient?

Same question for a few other similar patches that you posted earlier.

baruch

> +# not a security vulnerability according to Red Hat
> +PHP_IGNORE_CVES += CVE-2007-3205
> +# not a security vulnerability according to Mandriva
> +PHP_IGNORE_CVES += CVE-2007-4596
>  PHP_CONF_OPTS = \
>  	--mandir=/usr/share/man \
>  	--infodir=/usr/share/info \


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
