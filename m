Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452C9CCA470
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 04:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04EDF4079C;
	Wed,  8 Oct 2025 04:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMMQMTRKzDtN; Wed,  8 Oct 2025 04:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36CE240787
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36CE240787;
	Wed,  8 Oct 2025 04:38:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 983179DA
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 04:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89DF280DC4
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 04:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTD_iQWVnZxX for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 04:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 858EA80DC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 858EA80DC6
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 858EA80DC6
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 04:38:39 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 6F930440621;
 Wed,  8 Oct 2025 07:37:37 +0300 (IDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251007210514.3784984-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 7 Oct 2025 23:05:14 +0200")
References: <20251007210514.3784984-1-bernd@kuhls.net>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Wed, 08 Oct 2025 07:38:34 +0300
Message-ID: <878qhmknxx.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1759898257;
 bh=mNRZ1RME9cGz81N//4Y2Tpgsdm1EGth5XaczOv6AiKw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=deXAde4Bx+LqeDZmcKTHMCn1fU173N0dOSRHFWq2jImcOJP6WnrLXpbBmp+0u1FPd
 n8LcQm7owuBciAVAeNP4laHTAGbPPd2st0LIWS/l5GIquEYQjD9TDhsB4uH9iX3r49
 eCn8rH3Zq75vTzB6tPlYD+/Di9GqUSeJnVQMqsHHKS/r+Uc+n4J6CBHkhRYjHvyTuD
 zJezb/jSP5GRsqS+FxOMblRLl9+7G07rN8JrmxexyyFMYagB2+7ghmbw/RMJIWA+eK
 CEPwnZzTSq7+Wzg1A+bFeWY4gaAvicEKW5LTJuKWwrJA2uFH3HDyJOn3qrsJGns/ST
 g1YhIYhmccOxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=deXAde4B
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: fix configure options
 for GnuTLS
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

Hi Bernd,

On Tue, Oct 07 2025, Bernd Kuhls wrote:
> Buildroot commit fb5fb06ee5a886df5036c5c5e6c4536f2bc8e1c1 bumped libcurl
> to 8.16.0 which includes commit
> https://github.com/curl/curl/commit/2f6524ce3c3a8231c62d1e0c8af509fe5b0228a0
> to limit the use of the configure option --with-ca-fallback to OpenSSL
> causing build errors with GnuTLS:
>
> configure: error: --with-ca-fallback only works with OpenSSL
>
> Fixes: https://autobuild.buildroot.net/results/64f/64fad87dddecda1e8ff6b0a9abc0b827b5136e4f/
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  package/libcurl/libcurl.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 0aa88044bd..51b8c4d147 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -68,8 +68,7 @@ LIBCURL_CONF_OPTS += --without-openssl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL_GNUTLS),y)
> -LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr \
> -	--with-ca-fallback
> +LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
>  LIBCURL_DEPENDENCIES += gnutls
>  else
>  LIBCURL_CONF_OPTS += --without-gnutls

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
