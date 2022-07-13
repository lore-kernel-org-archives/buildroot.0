Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ED9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 06:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 755D542390;
	Wed, 13 Jul 2022 06:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 755D542390
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJIzmB3TC4mm; Wed, 13 Jul 2022 06:54:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AE7142398;
	Wed, 13 Jul 2022 06:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AE7142398
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 375721BF4D6
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 06:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F9B984509
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 06:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F9B984509
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G77-dbUHCpdO for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 06:54:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 095F384514
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 095F384514
 for <buildroot@busybox.net>; Wed, 13 Jul 2022 06:54:02 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 78CDA440F2F;
 Wed, 13 Jul 2022 09:53:40 +0300 (IDT)
References: <d88aa72dcbbcbf5988e643e3ecd0a49e1a455d94.1654802516.git.baruch@tkos.co.il>
 <Ys5oV/gCnSknmvtJ@einstein.dilieto.eu>
User-agent: mu4e 1.8.2; emacs 27.1
To: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Wed, 13 Jul 2022 09:43:11 +0300
In-reply-to: <Ys5oV/gCnSknmvtJ@einstein.dilieto.eu>
Message-ID: <87bkttec55.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1657695220;
 bh=mHLcAvPACdl9b3tFo3Uv8Id0DttgJu6VHfPXG3v49e4=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=NJpy9DgP7MdFS0w9Ev6yFS2bvE0gBdlDMZng4uWKV2Kz/vZzseMcaZMwPr2ery130
 Lp+9gVKjIIp5BzfX1opu+kfSF9tWxcgHbnjgm8RFWlUwAhPp/C0RJtU7MWi01aiViI
 U+/p2PNFrOtu8sRZrRlZLC2IK/i7FgEKbpy2RyXkR9xBF96PbKTX8ZUvd6/zOhPvij
 ZTQSV7zvrWcENktPrz/6LRUCfh9vKi5IGYuhHdQ1Kzx4qqp017MWpK7Et/MrtP2Q6X
 6n9GZxPaoOcUsJ9TVtRo8AyETXfjeKpkaASUW7thVZss7i2VkQi1bZXyXWk39yciJ+
 rDvWi37yUmNig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=NJpy9DgP
Subject: Re: [Buildroot] [RFC PATCH] package/uacme: requires TLS support in
 libcurl
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nicola,

On Wed, Jul 13 2022, Nicola Di Lieto wrote:
> I am afraid this won't work because unlike curl, uacme only supports OpenSSL,
> GnuTLS and mbedTLS. If either BearSSL or WolfSSL are chosen as the SSL
> library, uacme will fail at configure stage.

This issue is already in current code. The line

  select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)

does not guarantee that libcurl uses any of these as crypt back
end. libcurl might still have BR2_PACKAGE_LIBCURL_BEARSSL or
BR2_PACKAGE_LIBCURL_WOLFSSL set.

This patch only fixes the BR2_PACKAGE_LIBCURL_TLS_NONE case, but we can
easily add others for something like

  depends on BR2_PACKAGE_LIBCURL && !BR2_PACKAGE_LIBCURL_TLS_NONE
          && !BR2_PACKAGE_LIBCURL_BEARSSL && !BR2_PACKAGE_LIBCURL_WOLFSSL

The reason I marked this patch RFC is because we usually do not 'depend'
on non obvious dependencies like libcurl, but 'select' them
automatically to make it easier for the user. But I could not find a way
to avoid build failure using only 'select'.

What do you think?

Thanks,
baruch

> On Thu, Jun 09, 2022 at 10:21:56PM +0300, Baruch Siach wrote:
>>uacme configure script fails when libcurl does not support TLS. This
>>means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme. But
>>there is no way to change the choice to something other than
>>BR2_PACKAGE_LIBCURL_TLS_NONE. So instead make uacme depend on libcurl
>>and !BR2_PACKAGE_LIBCURL_TLS_NONE.
>>
>>As a result we can no longer select BR2_PACKAGE_OPENSSL since it causes
>>recursive dependency. The existence of encryption library is implied
>>when !BR2_PACKAGE_LIBCURL_TLS_NONE. So we can drop that 'select'
>>entirely.
>>
>>Fixes:
>>http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
>>http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
>>http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/
>>
>>Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
>>Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>---
>> package/uacme/Config.in | 7 +++++--
>> 1 file changed, 5 insertions(+), 2 deletions(-)
>>
>>diff --git a/package/uacme/Config.in b/package/uacme/Config.in
>>index d69343611557..4b20cbcdfe4b 100644
>>--- a/package/uacme/Config.in
>>+++ b/package/uacme/Config.in
>>@@ -1,8 +1,7 @@
>> config BR2_PACKAGE_UACME
>> 	bool "uacme"
>> 	depends on BR2_USE_MMU # fork()
>>-	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
>>-	select BR2_PACKAGE_LIBCURL
>>+	depends on BR2_PACKAGE_LIBCURL && !BR2_PACKAGE_LIBCURL_TLS_NONE
>> 	help
>> 	  uacme is a client for the ACMEv2 protocol described in
>> 	  RFC8555, written in plain C with minimal dependencies
>>@@ -14,6 +13,10 @@ config BR2_PACKAGE_UACME
>>
>> 	  https://github.com/ndilieto/uacme
>>
>>+comment "uacme needs libcurl with TLS support"
>>+	depends on BR2_USE_MMU
>>+	depends on !BR2_PACKAGE_LIBCURL || BR2_PACKAGE_LIBCURL_TLS_NONE
>>+
>> if BR2_PACKAGE_UACME
>>
>> config BR2_PACKAGE_UACME_UALPN
>> -- 2.35.1
>>


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
