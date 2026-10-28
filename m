Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C781606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ML+xrwed
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D27A580F46;
	Wed, 28 Oct 2026 20:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYXNV2Qvaf0t; Wed, 28 Oct 2026 20:07:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E45BC813AC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793218053;
	b=Uklw1dqgWDuYhlUVvc1WgTKSc4aa2946q1PB86Peezx34SxBDeuypfGbWQjwWemtWXhr
	 UjWa1fiAlHjB8Yp4AcyPgHKmh7F3KkXc1crHq9XNUS+G69cXZkWKMx1jqHU0QyMPmwQrI
	 LWTeErNo8YeOeaH/x2QZYTB6LRanWgzAfzoOIk+1+X371ZocmqycfFBHEQWE9dM1Ho9wf
	 Y13swM/tuo0EG6u4V6nORiZMODoMrx67ub8XsuVaUCzKjKQFXLb3hDFwpFE5LTY6IGbM7
	 ywOl6ggOCJ/lXyl58SG6P4nh2N+xpOAMADe/pGP3M9bhQ+01PQNJZRWt30kkVKlAUPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793218053;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=fuhTLN0cmZ9aQ7V6k41NWJllY82SWuuBS+sA+UBmMXo=;
	b=jVvsMME0UsVzfFM7JAiyfops4xudjrSed57aCxeZ5+p4bQwrZhZsqxTqLwsonwQOdJ0H
	 mchaH875r8i9/V9oOsDaWM9o77UvPmHGVPzVPATTCRFrvJJ0+c0tZIcsu5IbCoHL93urL
	 sN9xpbF5jtGFXch0g6jAl7lqZO1wc2ReRBx+6vhWdTGJPdtxoJnjyRTqE5fuCShQNrQ+/
	 WLYlazdIMigb6SulQaguNwyujF0uGpmu0Im1u/RMRihqt0FeAwgmUwTx9x1TzkOJ55RlD
	 8/QRAhrjXAR9vwSIjvDEZkJyVx5SuoFsUjhzX/XEqv8IKz1Tc/hw4zz2wXY1crDsKHA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793218053;
	bh=fuhTLN0cmZ9aQ7V6k41NWJllY82SWuuBS+sA+UBmMXo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ML+xrwedGn6pVSGFXv2M2sygRKcoQGOTIvdP+U3aoVTyKG2CrWyuNUYLutcgkSCxg
	 uaueaRUxM5c261dAo6akYaIqzsd+wgalUk6eesSpclxrk98NtNq6KC+bmQ7E1YDMTP
	 +C8ixzAC2l5WxUzWGYt6ju54NjUr9aU2cDA7Uo0T0RKQnh9PBsCaK8fQ9mrJfoJvSE
	 B9AZp7ZWvIV5xU4Rt9uyaAZ9Mf+9e0NM8NkZ2JrK2nxHeB12dLWoOZmoKnIbvtHtrK
	 hlwSzHGyA4gica3WPPr2jAdKWlYKl75P5vVVQr7jj4tvHIMm7lDNib67q3GEL0K//W
	 EPZXhSmn6iZIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E45BC813AC;
	Wed, 28 Oct 2026 20:07:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53EBB235
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 20:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4511B409C9
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 20:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tpkJHHgwQYob for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 20:07:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1E04F409C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793218050;
 b=mGavaqZ82c48sE4QrmAPg6C75L5iNBcF0TiM8mPXuUXIGyds6X6HL8PMYvYrPyCzjREZ
 6trloGvek0haF6bOHq5nDc+3VaZ3exy/iO4RPBzxbzJJx6lsevy8EuOPDPgKNxl0JfXjv
 TwR3QW2kPJePVr2CW/1AkJkQsAdhHm5OPZ5KsXNgJ7Kx6O+uvk4iZTI0T0nIcTBqGGScD
 FY8w6GH/IMDD9byaOg0q0unCPkAWBvoQV950wQuJsk7D3+AmiEjqvz9FNSwE3bXR5nOiy
 T7asHFav2xnk9PKn5PowqEH7wyGkuXqKfN8bJwnAT6vpCRfumuAukbTt9I7vgspPavg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793218050;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wllD56PlxMimXhIcxMYyPTmJfWXkZgHB4xVTzWKUr5Q=;
 b=N+Gq6L+ExoZKVtSf6+57zSqriM6SzkBoE4PShc365MCIxzxEJ1DqITGxIT27PhWsipZ8
 7Z/YFa5j4ThZbAfoff+KOSpjcarn+vD2IQNLNfmrAIe/TyhA4Cm3fojmjPTZ18UOTjOyr
 VJMxB9gMTjmf3Ff8PRF0tVgvhqntMgjevP0QMEglWHwMNj0kclPG0B3JRrAn35T0gRFEg
 i6+1nhghH94zsUSbMpMpIgVplG/wRyGqdPynUbOiM1ydVaUPEQJhUY2PRHFM8WEzLupZk
 mddJP2raNqefUTiYl/q0BPHBjduQOPwI+HKOHEkaEbRV3QkK24TGU/HhKU4OvnsWctg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GiPn5gAf; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E04F409C6
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 20:07:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C29E42003C6;
 Wed, 28 Oct 2026 21:07:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 28 Oct 2026 21:07:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 28 Oct 2026 21:07:26 +0100
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261027194859.2166161-1-ps.report@gmx.net>
References: <20261027194859.2166161-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <b7b835979b3c6f9caad24d9050257e21@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1] package/libressl: bump version to 4.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peter,

Thanks for the patch.

On 27/10/2026 20:48, Peter Seiderer via buildroot wrote:
> - bump version to 4.4.0 (for details see [1])
> 
> [1] 
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.4.0-relnotes.txt
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libressl/libressl.hash | 2 +-
>  package/libressl/libressl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libressl/libressl.hash 
> b/package/libressl/libressl.hash
> index b64df284fc..e3978baa63 100644
> --- a/package/libressl/libressl.hash
> +++ b/package/libressl/libressl.hash
> @@ -1,4 +1,4 @@
>  # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
> -sha256  
> 57c8b2f8c6f9505587abaeddab003ea243d615edb7ed71957968121fc6316bd6  
> libressl-4.3.4.tar.gz
> +sha256  
> 7d02522ad5070b9adb32eb253ecabce181184a3750cf65abac0675ee908687c1  
> libressl-4.4.0.tar.gz
>  # Locally computed
>  sha256  
> 9853507b8821c3f277aa60bf554eade41441ef06b2df538d247183ad28789b7f  
> COPYING
> diff --git a/package/libressl/libressl.mk 
> b/package/libressl/libressl.mk
> index 6d6de78213..82de944fa5 100644
> --- a/package/libressl/libressl.mk
> +++ b/package/libressl/libressl.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBRESSL_VERSION = 4.3.4
> +LIBRESSL_VERSION = 4.4.0

This new version is introducing build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/3000952124

For reference, the previous version is building correctly:
https://gitlab.com/jolivain/buildroot/-/pipelines/3000975082

>  LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
>  LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original 
> OpenSSL code)
>  LIBRESSL_LICENSE_FILES = COPYING
> --
> 2.56.0

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
