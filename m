Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB001606A31F
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 18:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pPZCi8Cz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 777ED60761;
	Mon, 19 Oct 2026 18:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5cGBg1YrHkI; Mon, 19 Oct 2026 18:30:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9600B60751
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792434630;
	b=D3cZV41IRN6J4oknDl1eJRRQdU9bsMt4XCXuQVj6HdpXB5Sh/GeyfhXLwKw47hbzUbV4
	 PO5JoLnDbn1VEjdRPsMSP0xomBOQUmK1y8wTuKMQ9iH1wHS5NlsMi2XHdYomAZaMFxoy4
	 8s62XKBdetK3TUJxXXiIe9OqGW+pYQAUVtKRCW1grMSlIfhQVyBdV8ts4GcOPdS+Yavui
	 6gJWVU7lT/PdXQlN3UpCl71eM4bcDusJAks5yaHmX2QnIpWUBorcti4hhtkCPoLR2Z+8J
	 SM/q1mBTodngntpLyxtDl6cvYiPWYsakBIj+KKDnx4qnPEupGPFdQW4W/QrPRs218YQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792434630;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6EcbfU9gzclRNNAs3WQQy1H3gNEQHy9CvjPvVZ/9+N4=;
	b=A70fZ1FIDwfWfnI8rHXR9Ajy7P+5AN8E/7ifFtxNt02QlJ5YPGHSjMRjnBpbVxT8gElC
	 oi/9n1TKs9lc8QCKhXoob1KTeKqx1F969HpnL3c5xDHxmUSpPhmDTRS2JMCcIRHmMCWhI
	 pH62xv4azT4ilUTy1iLm0gCf1jsP4kfMyNw3rLCx+NuhzI2lc/6FKTvrf2Z27c9CwGY/n
	 7S4YO2sQVB1acqNK+FOdDS/4On28GeGTp53NgclJhlZwvRn+IG+NYIBBQpyaLObWaixmD
	 tCXvjHILqhyoaf4iF4ixldlOELb9QmhgzBP4cnDvzc7CUegGzb/G+H0c6oSpLEeRmyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792434630;
	bh=6EcbfU9gzclRNNAs3WQQy1H3gNEQHy9CvjPvVZ/9+N4=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pPZCi8Cz0e4z8oDV2bqYGE9fUsN7kGLZ0M7AcH9UgfywjU1KUzvLMalgpxuoyMSGu
	 UXxT4D+kT53AcJchRJjkK4G0MoLe4QBN9YnH9N+eG5vzefpCQ6K12QOWxeThYg+Lg7
	 SOFDAALCuKewXDSSObaCsXELsHjs5RDXL28R6tWWx2jWe80bD7QahxAvTndJ3tYI/G
	 NEv6rhh9SoxIndcwOcglEgRzsVxXM2if46Xkea6/uLcCy8u8RNbUjP+o+d0a1q3tVP
	 UNUj1r2qc6Z/XzIXl7Qb4j1bGdGtnaIovMardHS+SWGtBR0GFNYYzFLAB8htFbiRwB
	 eubeCaiOu6aVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9600B60751;
	Mon, 19 Oct 2026 18:30:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 172D023A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 18:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 087D680D34
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 18:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 435gp0u_zOHI for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 18:30:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 918C680CB6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792434628;
 b=OAr2bocF9xdCkYbrBqpxAZ2Kq8Bwsw4mYUDSgHTU9h/3d4fzSaKNnsHpm8KUEWPc2G6v
 e+0b9KYuhSxbPDMSAQquww4NBxW0fCw/IbrAHqrpCJwL6ubZ4Uj7c2NaIw5y2ZBQJVrSZ
 I6aRp6SEAm5/DXijPH6H0LgCJQMvwodn2wwhjOc4YIqNpJmAXfvR2PIayZy3yCBpij8X2
 wScH6rYeywTjsWkeKd36VnO17+WvwPA7K1BGneoehvRSl+QZTZD4gLo8oQ5pAcZEV7toJ
 8F9PowDddek9HMeC0RVjaSuIJ05WAXUULHobzyYGSE09hNh95YxVQy4DZJ1DcEAAW+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792434628;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
 bh=aoK/RlnJfvMQi0BWhBROFq+LLii85sg+hEBIpx8bDYA=;
 b=XQCqxXxEUaq3Oh6VoSNhTiJMSdpe52G+rHNguro8d7g+2j6Tapb6zhKN0gaHTbZy4Hqw
 bPK8Dn9yOjaqLsBDFI/KyNTBpiQoWb0B7BV1dIIzKibQ90Nk7gdThXV6tvrJetnZCNCj2
 30yrBRJzR3zZC/kgGeXuH9gSpzfmQD0FuYK38d/tgcqUV7x3p7SdOZPJGtssWiGAFGXXa
 xF8m6yPJ0vDOuAgqWdHopLTb8HjwcZyf0txVnW163Evf84DH8bArBp9+RbPz4l/vwj9cs
 0Q4uCHet90hoXIvU1Y3/Yi5ZUdCfzZl2k0x1eH7pR5BZlCNMEjqx48pFetkfwr1sGIg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=tkos.co.il;
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=0mryjbi8; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 918C680CB6
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 18:30:26 +0000 (UTC)
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id 6A4C5440513;
 Mon, 19 Oct 2026 21:29:02 +0300 (IDT)
To: Martin Contamin via buildroot <buildroot@buildroot.org>
Cc: Martin Contamin <martin.contamin@murena.io>
In-Reply-To: <20261019180050.1175211-2-martin.contamin@murena.io> (Martin
 Contamin via buildroot's message of "Mon, 19 Oct 2026 20:00:50 +0200")
References: <20261019180050.1175211-1-martin.contamin@murena.io>
 <20261019180050.1175211-2-martin.contamin@murena.io>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Mon, 19 Oct 2026 21:30:22 +0300
Message-ID: <877bjdk0g1.fsf@tarshish>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/libtool: make v2.6 patch apply
 to libtool 2.6.0 ltmain.sh
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Martin,

On Mon, Oct 19 2026, Martin Contamin via buildroot wrote:
> Commit 5dbba2616f ("package/pkg-autotools.mk: also handle libtool 2.6.x")
> enabled the libtool 2.6 patch for packages shipping an ltmain.sh
> generated with libtool 2.6.0, such as libmodbus 3.1.12. But this patch
> was written against libtool 2.6.2, where the -static-libtool-libs
> pattern was merged with --static and -Bstatic. In libtool 2.6.0 the
> corresponding context line only reads "-static-libtool-libs)", so
> hunk #4 failed to apply and the build stopped at the "Patching libtool"
> step.
>
> Remove the context lines around this deletion so the hunk only relies
> on the deleted lines themselves, which are identical in both versions;
> the patch now applies to ltmain.sh from both libtool 2.6.0 and 2.6.2.
>
> Fixes: https://autobuild.buildroot.org/results/11f3c460407c816d9829f101f0ee55e4b03965cd/
>
> Signed-off-by: Martin Contamin <martin.contamin@murena.io>

You might want to take a look at the patch Thomas suggested:

https://patchwork.buildroot.org/project/buildroot/patch/20261011074658.1888569-1-thomas.petazzoni@bootlin.com/

baruch

> ---
>  support/libtool/buildroot-libtool-v2.6.patch | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/support/libtool/buildroot-libtool-v2.6.patch b/support/libtool/buildroot-libtool-v2.6.patch
> index b3968b1289..060acaad5d 100644
> --- a/support/libtool/buildroot-libtool-v2.6.patch
> +++ b/support/libtool/buildroot-libtool-v2.6.patch
> @@ -42,19 +42,13 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>   	  if test yes = "$build_libtool_libs" && test -z "$link_static_flag"; then
>   	    func_warning "complete static linking is impossible in this configuration"
>   	  fi
> -@@ -7072,12 +7076,6 @@
> - 	  fi
> - 	  prefer_static_libs=yes
> - 	  ;;
> +@@ -7072,6 +7076,0 @@
>  -	-static)
>  -	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
>  -	    dlopen_self=$dlopen_self_static
>  -	  fi
>  -	  prefer_static_libs=built
>  -	  ;;
> - 	-static-libtool-libs | --static | -Bstatic)
> - 	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
> - 	    dlopen_self=$dlopen_self_static
>  @@ -7393,7 +7391,8 @@
>         prevarg=$arg

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
