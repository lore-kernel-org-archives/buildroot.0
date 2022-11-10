Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BF4C433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 10:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CBAF40481;
	Thu, 10 Nov 2022 10:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CBAF40481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJg-E9VHJeZH; Thu, 10 Nov 2022 10:26:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F8AA4019B;
	Thu, 10 Nov 2022 10:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F8AA4019B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B11051BF842
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 10:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CA4D812A5
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 10:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CA4D812A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b1tXExicgFhi for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 10:26:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF8FB81303
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF8FB81303
 for <buildroot@busybox.net>; Thu, 10 Nov 2022 10:26:31 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 68362440EA2
 for <buildroot@busybox.net>; Thu, 10 Nov 2022 12:23:59 +0200 (IST)
References: <3e8e93e9eed117bc7e49580fd77e254eee237a99.1668060990.git.baruch@tkos.co.il>
User-agent: mu4e 1.8.10; emacs 27.1
To: buildroot@busybox.net
Date: Thu, 10 Nov 2022 12:15:53 +0200
In-reply-to: <3e8e93e9eed117bc7e49580fd77e254eee237a99.1668060990.git.baruch@tkos.co.il>
Message-ID: <87a64zumuk.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1668075839;
 bh=ess31pwWwim71D24dZCAgA2WALIa+X0/Ft+p3iDKr5M=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=NIY0d5UQFZY6UVhHbY3awuuekQcWAusLlQ8ebwWZlA1V6Fh1nv40Ng5esMYdF/XC/
 RCmLOeaztxlEobUutPuK2BD4NRTb0yAgHAclsC4smqXN3G8YvSljyXx4eT/ONCTTKi
 31K3i7j1OZW1dYlJy6TdBKMi5cjtzT/Go09bXda+7oWHPTUC9BhyqSgKNNloDWrab2
 2JFl0wlThTLs/MzvQWc7Si2eSu6nf1OwkgxM8NOR37esaoK6Q2kNwjQ4HSJ64feJ6k
 SIgazPaXiIat1d8bN9RCSX6WdNMTAcEcBK8Xwn65/4fungwRbSFIieTuslmX5SVnaP
 lZaN9OfLjRy7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=NIY0d5UQ
Subject: Re: [Buildroot] [PATCH] package/socat: support OpenSSL only
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Buildroot list,

On Thu, Nov 10 2022, Baruch Siach wrote:
> socat is not compatible with libressl.
>
> Fixes:
> http://autobuild.buildroot.net/results/6f0204004c52f762d6e3cb3064238d7eb3646038/

This issue only shows up in the 'next' branch where we have socat
version 1.7.4.4 which includes upstream commit 15e38be2f52 ("Fixed
SIGSEGV of OpenSSL on exit()") that exposes the issue. The (unused)
reference to OPENSSL_INIT_SETTINGS is there even in the previous 1.7.4.3
version that is in 'master'.

Note though that this patch applies to 'next', but conflicts with commit
934ec83e9d0 ("package/socat: disable openssl for static build") in
'master'. If this patch is applied to 'next' it will cause conflict when
'next' merges into 'master'.

Let me know if you want a patch against 'master' instead.

baruch

>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/socat/socat.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/socat/socat.mk b/package/socat/socat.mk
> index 0414c8adc855..639b3d302847 100644
> --- a/package/socat/socat.mk
> +++ b/package/socat/socat.mk
> @@ -31,7 +31,7 @@ SOCAT_DEPENDENCIES = host-autoconf
>  # incompatibile license (GPL-3.0+)
>  SOCAT_CONF_OPTS = --disable-readline
>  
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>  SOCAT_DEPENDENCIES += openssl
>  else
>  SOCAT_CONF_OPTS += --disable-openssl


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
