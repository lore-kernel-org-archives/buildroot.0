Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5277C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 21:10:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2851561027
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 21:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2851561027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA25A81959;
	Sun, 12 Sep 2021 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HFN2caq0kcaS; Sun, 12 Sep 2021 21:10:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51D1C8196A;
	Sun, 12 Sep 2021 21:10:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D64AE1BF95A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 21:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5E0E60606
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lx_AhL1EciHN for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 21:10:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59B67605F5
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 21:10:00 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PWjdmw5FoKBZzPWjdmdtbM; Sun, 12 Sep 2021 23:09:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631480997; bh=63w3A0sSW44EMZor25B3iH+g6SfeLrjnr5wwT5A/cYU=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=jJZxv2R+BUc3gOOx33PrxD+uMJSvypspQ6DFP1hC8HF+A9g6U8JIr6AAHE2+eWwj8
 5K78YEaO53km+hR2735u6JrTob9dhRNCkusBKBeEhXf8Ydk0BQWErNuSjfDmE4aCdp
 AupRtDDBSx3sFuadYnpa7OYNHt3TfAtF8bMv4+qvdrij1p5baF5RidF6sWFb92CvzD
 vIkc8/jtUCCJ79nlKuIZKs/d0aL9elptvGkblYWHGtf/c58q2Yalv4bv9UNqbS1wFh
 BDIG7WdxCSx3X4rnjM/GzKrB/X+KPcm5beu37C33Uvr7vy9XR2FgGLQK+cWWayj/fa
 v7d/jz4icpmLA==
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210912200706.2884974-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <bfb503d3-a70e-9e12-6a39-d0d56dbb5e56@benettiengineering.com>
Date: Sun, 12 Sep 2021 23:09:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912200706.2884974-1-fontaine.fabrice@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPTDAcs2IZgpvPqzzYHIuT46q/Q0GPW/dohry5aQKkP+6fOZsD32wlsz0wZHjIyzVBg7H+s3xmGrT4+9q2a8dJHvc4wuhOwyWvX5nh3TwL8biuUrnJWx
 SqU7oVN8yHFXcLTKNA7daXp+fPCo51J/m+OosbZzucd0Osxv1jy/yIkQxRWZ0AVtkVxjja32IN6+3bETNDNhiFfxhVtrx+COj8c99bDoqLyohaJunumP9Dlj
 zP6f+LmHJsCUpMyEYF5ZVKuKGBRpDWgQGTF5fkk5r6I=
Subject: Re: [Buildroot] [PATCH 1/1] package/minicom: drop autoreconf
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Simon Dawson <spdawson@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Fabrice,

On 9/12/21 10:07 PM, Fabrice Fontaine wrote:
> autoreconf (and so AM_ICONV) is not needed since commit
> 2df32e0d4437b422175089edf1917219656fccef

Can you specify the upstream commit instead of the Buildroot one in 
commit log?

Except that:

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/minicom/minicom.mk | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
> index b81ee52120..5cd1d6b8b8 100644
> --- a/package/minicom/minicom.mk
> +++ b/package/minicom/minicom.mk
> @@ -11,12 +11,9 @@ MINICOM_SITE = \
>   MINICOM_LICENSE = GPL-2.0+
>   MINICOM_LICENSE_FILES = COPYING
>   MINICOM_CPE_ID_VENDOR = minicom_project
> -MINICOM_AUTORECONF = YES
>   
>   MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv) \
>   	$(TARGET_NLS_DEPENDENCIES) host-pkgconf
> -# add host-gettext for AM_ICONV macro
> -MINICOM_DEPENDENCIES += host-gettext
>   
>   MINICOM_CONF_OPTS = \
>   	--enable-dfl-port=/dev/ttyS1 \
> 

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
