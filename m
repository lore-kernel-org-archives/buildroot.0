Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D007606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 22:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YDXAmIqW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 209E7409D0;
	Thu, 26 Nov 2026 22:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9oyxHnTNug8o; Thu, 26 Nov 2026 22:15:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 14852409C1
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795731357;
	b=QhE7CaBb1+lCz8KbMS3NQciiwXAy/BmwF1iUKzFGnSTxBZfpESE/39V3mvoA6/ddzszx
	 kCH10fMtgnTSI3QwgzWHOoR3ZMJtj0JtRyrokm5VqTul22JqTvlWweCMqGW+IHbi3NjqT
	 pT2Ky6qMmi9QJ2a90cV2tPApmEf9jGHFoHuIbPvYN2d7tvL37qSQx7CgusLrmgbxDQrJU
	 TeG3l6shRhQFVT+vo86Pgh7U+sZZV9LJn0r2QaLgo0E78mEtpDrMcgWq3dWttbaseyiRL
	 qWSg36I2pSUyD5opmhjSgAetlUCXLvmC8bRQ3vcz3FOGId8TJ2Di28JGFiBvfgFBjzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795731357;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tSjMQFHNpGfUrwtBtRKOx3Wvm5MmE4cpjNZRqrRNfu0=;
	b=gxsUeNWFFThChXDmok1JCtMYvLhd/JL+3HlsHkZyMj84Lfe+TbSK7hWH5j+RgIHOZKZ6
	 hGTfYF15nglORUouggZZARfAQdM13oFl8H8ZbIURuQgGi+KZypJb46rO9yzOt2x7lO/S5
	 W0JpdcWV0rc8ahQpMpv0OEciT2P+pbBrDYbeDmj9e0HfSwkDpfnpUSC7zFnljTzOg5gNX
	 LleLVyDNSjZQyHW7yTUrSxUay+k7ul1RdeDLVbRIDS98E4tTeDERXqvbv1f5AH+KlfyWB
	 ncZFHMXMu7EiVc6/UZ9sTUXPh8AtUZlp0oupHMxzz5LeUf3WEncX/wTyJQ4phAtyyYw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795731357;
	bh=tSjMQFHNpGfUrwtBtRKOx3Wvm5MmE4cpjNZRqrRNfu0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YDXAmIqWOjyf0WIE9Ap0IVlMzIEWUK3PZapSii3i+QyIx4s0tbpSb3+6fNwus1S2g
	 kGAFS1ulsNlYhnfMdnkbdwbJLM9vovfC8I6LREhnrtmSAES0NnRqM8tg1DTvPQDv6A
	 a1z7AEfOFpFmUihHQBD5y8LJj9ZbLyD639XcjKbrF/g5gxyLLGEaARcotgm71NUajR
	 Mw4neOqiyhFlFHHhKtxD+lUcMp2l5xgrZZYV5MU/L25IN5OHIhwdCHVt56JzR48jyW
	 m+6619H9yMPFWMpCcp++XLVWhYvsKkVfTw0Lve5auFYfqKFbaMLqD73tMVzXK+aTgP
	 +zSuLH9+ryjWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14852409C1;
	Thu, 26 Nov 2026 22:15:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF0C91AB
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4DAD811EF
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nRZgk8bmckT for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 22:15:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 974B8808C9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 974B8808C9
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:15:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3152E4E417B9;
 Thu, 26 Nov 2026 22:15:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DD06960558;
 Thu, 26 Nov 2026 22:15:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CB53E11E68007; Thu, 26 Nov 2026 23:15:46 +0100 (CET)
Date: Thu, 26 Nov 2026 23:15:45 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <awivMBQ-DwKHC7b6@windsurf>
References: <20261125104644.434701-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261125104644.434701-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libroxml: switch to GitHub
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 11:46:44AM +0100, Yegor Yefremov via buildroot wrote:
> download.libroxml.net is broken: it serves a certificate for
> *.blunderer.org and answers every request with an HTTP 500 error, so the
> download fails:
> 
>   HSTS in effect for download.libroxml.net:80
>   [0] Downloading 'https://download.libroxml.net/pool/v3.x/libroxml-3.0.2.tar.gz' ...
>   HTTP ERROR response 500  [https://download.libroxml.net/pool/v3.x/libroxml-3.0.2.tar.gz]
> 
> Fetch the 3.0.2 tag from the upstream GitHub repository instead, which
> the libroxml homepage links to. Apart from the generated autotools
> files, its content is identical to the release tarball, so autoreconf
> the package. configure.ac uses PKG_CHECK_MODULES (for the optional fuse
> helper), so add host-pkgconf to provide pkg.m4.
> 
> The download site has been used since the package was added and only
> broke recently, so there is no culprit commit; all maintained branches
> (2025.02.x, 2026.02.x, ...) use the same URL and are affected.
> 
> Fixes:
> https://autobuild.buildroot.org/results/54c4c3522ae4e337ef7818988866dff2e961027d
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/libroxml/libroxml.hash | 2 +-
>  package/libroxml/libroxml.mk   | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libroxml/libroxml.hash b/package/libroxml/libroxml.hash
> index 547f82b60c..208272f2fa 100644
> --- a/package/libroxml/libroxml.hash
> +++ b/package/libroxml/libroxml.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  ed6d68d1bceabf98e5e76907411e2e4d93b2dbd48479ab41dede851f59dad6a3  libroxml-3.0.2.tar.gz
> +sha256  de41c88952c896e9a43ca630e88ac75e24af74a8731e21858b12e3cb2385c3f4  libroxml-3.0.2.tar.gz

Thanks, but this will unfortunately break when people will fallback to
sources.buildroot.net as it contains the old tarball. Basically in
Buildroot, you can't change the hash of a file, you must change the
file name.

So my suggestion to workaround this issue would be to use the Git
commit as LIBROXML_VERSION, using the Git commit that was tagged as
3.0.2. This way the file name will be different. I would just add a
comment above LIBROXML_VERSION explaining why we're using a Git hash
instead of a tag.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
