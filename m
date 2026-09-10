Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EA6C79F9F
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 18:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8FA340B7E;
	Thu, 10 Sep 2026 18:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwUKbWaOVn3u; Thu, 10 Sep 2026 18:46:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ED38540B78
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789066006;
	b=R/7xBFNF1IgE7PHkCtsm67QbYooXukuSUk1XnJHl0geFo09Q1r0UcooSqF8hXGvW8JWe
	 Ohp7tedsmp5bU0bnn6rwXzLYrfTrtouggQp9LIcdTx0dz+lW1Sw8ZPzp5RQmZrVjiFzyA
	 VhsWtXNyTxy9YL7gIoz5y4AUpBx68P6TL+TSs005ojgWPu0UsY91ehFwuYiZDuVdeRgLM
	 EvgyHBeqmOVhMZXX3MZUTInkhkwpjlhfQUIQpnOncQCQsBd2rMgIf8DPRV3g7Y8zOsx9b
	 K1zzA7sg+ArDZGPvXT02xqOgK4+p/l+xTIs/sgiuD+eWudLMBDfupa8uUHjG0kApxqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789066006;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=mHwCvaTSDzjrP5hanrWNqqdUWOSPubtvhwbcaC1POzg=;
	b=eMeFLrMzL+6O+mYjJMEYFjVszgxAQmripbj8jQrpkb+h++6vtVukQqHrl6PPG7rI+Ut2
	 k3+WR6ZuJjZ/zOz0yrH+Rfv0J66bJXacnfRfWHLI36FMBFFjoIslVVSaKYNxtIYthp+Fh
	 vJ4Gvpv/4y28sS5UyjoRTR3IuX9YK5Ii6DQ5Cc/Pq6CYIJYZsfSDEoTiNqqRRZ/hdeNEd
	 qKo9M+Fkd68kcUkfvI0JQcjazCNnj0ls/fFxk85MsWAGzXR69cma0mx6+2AoioI+WTqD/
	 xMe1Q+qcgHLf6MZgtXfsM1AWr28dOr7xSiqZwu21AOPJGwp0QQU9jY/j+frnJGW1pkw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789066006;
	bh=mHwCvaTSDzjrP5hanrWNqqdUWOSPubtvhwbcaC1POzg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dZTPCY76J3jZcRuk7z6YONIsfFmR4b7+C2SGx/4XH1/11LJVgwCk5wk0WmaWlfVbc
	 jwj2YvUhN3wcJQPBM89W9ju60Cs42CIByUeKNaNRnuiwlS4gMEFWhPMhRhmjcr5uiS
	 Nzs3fvC25JblFzyC4xhtlI4DwK3Oi17Cpy9CpiDwzOOYov8Q7Q/ADa+6bqL2CEzbPC
	 9Q4Pb86SQR3O7YI0pbLVgkacKd40ILyQbifXL0nP1PSNZKyE580WkE3yWyyBuC3WHl
	 NtBVzDQPa3KHn0Q/bMtURmz0dD2vT1w4HzAOFJgRbYJ84YA3W1BRJ8Ba8I5EJJkunA
	 p2nT/6reamf3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED38540B78;
	Thu, 10 Sep 2026 18:46:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA38149D
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0D0D40B75
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8l-eOTxOvU1 for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 18:46:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6939C40B78
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789066003;
 b=kUWAA0iNXHnuAgnZtMn14M0Q6479rtMV2bI+xN4U7E7nN+zM7qNo1tjQeZczxMNgvF8j
 0BN4RSC1n7tBUEO9TmogSaWQQ+qosYnUEB+cYGq78aw9p1SQRh2lcNzV4AjKnyPnp37C5
 g+DRnd7Ds/JS1fwZPae5vbKEiQgYkxQPh+AkTLfTrgx+fj1xdrLVQbi+h6Ytx1RgTi5zj
 wgzbM0HBAruwwV68Ny7Icw0mRS5kazdd2bmwnyK3LO7ByBqHHTgwtANGFQEZJYXSkKvom
 WGXYgg6DrSSadn81tHddp++4EurOV2FTWt6M3Z8ymjoh66Oseg39cvo5t4EZxQi6vjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789066003;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=97q3ImgjOOm+6h6cEM9W7ozn/PCFSSLvV02amGfCt2c=;
 b=ptqH9T9e0WiXkcO9M9Ch8zUhIorLiGKswEtNfGPbzN50GPRlF7Es404vmulMJPV5QTMt
 zq1pB82cFy6OV+lmvX0i0+3fLa4p+wh4DJfTSZTACj/y5fLDCouLiPWcr6r6+75W7YJAK
 XPyVrdP8LnBkTyDTyV/cB7SnzZRgGs6X+Y+Id8vg+JWXfjIMb2M0QCj25QW2gERGP+PLD
 65TL35ll2AKEeP5ZcXcCfxlYbmYdC/nrK4fqKzTfEM2JfCQ1hzwUHvDb9lk8lbYAShOxo
 EhbB5ofVE7cyef1ak5peTutknD9fbdR/XmBh+PVz8ehKKoEnh78BK43vAbSlWREPyJQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HvccKqGN; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6939C40B78
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:46:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5D4A32003B4;
 Thu, 10 Sep 2026 20:46:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 10 Sep 2026 20:46:39 +0200
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 20:46:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260910073701.6776-1-bernd@kuhls.net>
References: <20260910073701.6776-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <1996b26b463e13eb1a31e8af4cceb79e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre2: security bump to version
 10.48
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/09/2026 09:37, Bernd Kuhls wrote:
> https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.48
> 
> Fixes the following security issues:
> 
> (Security fix for specific API usage, GHSA-2p8c-ff85-vh9x)
>  If pcre2_jit_compile() is called with options for some match modes, 
> and
>  then pcre2_match() is used to perform a match for a different match
>  mode, an out-of-bounds read can occur if the match is attempted 
> against
>  invalid UTF input.
> 
> (Security fix for pattern conversion, GHSA-q8g2-wprr-34m9)
>  If pcre2_convert() is called on untrusted input on platforms with
>  32-bit size_t, an out-of-bounds heap write can occur.
> 
> (Security fix, GHSA-3r4p-g7gg-ppmf) Fixed an out-of-bounds write in DFA
>  matching when using a heap limit; also fixed possible integer 
> overflows
>  which could cause under-allocation of the workspace.
> 
> (Security fix, GHSA-fmgr-6ggq-9859) Added bounds checks for several
>  integer overflows while compiling patterns on 32-bit CPUs, which could
>  cause under-allocation followed by out-of-bounds writes.
> 
> (Security fix, GHSA-9qww-pwc4-77qq) Applied lower buffer bound to
>  prevent two out-of-bounds reads while scanning backwards through
>  invalid UTF data with PCRE2_MATCH_INVALID_UTF.
> 
> (Security fix for specific API usage, #937) Fixed a leak and later
>  invalid free when calling the fast-path pcre2_jit_match() function 
> with
>  a match data object previously used with pcre2_match() and
>  PCRE2_COPY_MATCHED_SUBJECT.
> 
> (Low-severity security fix, GHSA-q7rw-r7qq-2hx6) Fixed exposure of two
>  uninitialised bytes from malloc() via pcre2_serialize_encode().
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
