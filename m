Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD5F606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 22:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IMXQYG4M
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6464815D2;
	Thu, 19 Nov 2026 22:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPxKzqgv9Xni; Thu, 19 Nov 2026 22:31:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B471E815CA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795127503;
	b=B7Iwagxv+04ach6p+bzGjRHRezL3mC03WAtAfj+/dhhB6viARCNdX0dd4/lE4hIC0EMt
	 pWuezB/c2sz9Bs++O3nKqWLpxizXDxgeyrH4gBUnxpbpzsgX3JrwWLt0yxi1Xv7I8jv0g
	 LNbdaL6i21OKx8OJijuVCrJleJY9bEuOVN0ySTZZPL4RuTIAIuRyS0LNgQMiLO/JPDbah
	 /W0y6CwzGuUZL7txg6BaKULtbJJ+VIR0YnLXXpr2zpYsSWXtQtDn9jIJwh8SC5+ItxDHb
	 kT9hi0PNBU386jJro4DABxEOn6ObLnOSGoXUgmIXfdMDC3f1I3sQtsjK+g1tmHQDfnQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795127503;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=gRJ7j1fYVDKApOStZNCeAx/IbWIqy+xFXUiD65yJvnY=;
	b=heXcG0mQrrf878WGzvR9ThEbtGTmXW8KJYy3/W0URbhvna+u8GlhI5Va5F9s9AhCtkmK
	 0PQnZK9U4NimSAv/RHtALoPMDTggR7L7wAlJ7gEzSNd24abfvVt+39QgUBVBv+/Yx4qfV
	 nd8jXPkSuxpw9VztjyK48opbLe2dDLdUiQmhIC45SdBdQV5+EYuNgAr8thMutSeihoESi
	 9H2NmXGntje/x6kfd7+xKGxvpyX/EyD1eqHthNKFm4yV3vMppSrIdNn8+Jy3ybQe76NyW
	 cbAHOYeqCaFBVLJlNUSAER/dT/6myKL7ET9MVF+ws9umVHPIHw5+aUJe+K+5pRCHN0w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795127503;
	bh=gRJ7j1fYVDKApOStZNCeAx/IbWIqy+xFXUiD65yJvnY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=IMXQYG4Mf7e4V3JyWrg/skJaS/HrvtdmFBo2Krfn0gvV9CIF9h0mM4QkfnBnn4zqz
	 XyMCyhFUGxY26K2Sh31UrNhxaVIXsYbZmGGGNmag69/AEDHKfq6vhfx2SIAq3vMbdF
	 fcmanSiLMlodWmjDH038eSazsqKWAatvjRaXCsYcj1oKOHGR2qAmlfdg6gXI7PvKZW
	 etaG5HQWtOLLlhIu8LRsiZjiJOObgREDuvtEq2kR6MB5iqYAASOaiflr7Lu1wLDnHD
	 Wfpuh38c/nJpy2o+G+RWLCHBqQTMTy1sULxFR2L78w0dvDLrxiZjQV93lMZUZDnpTa
	 pVpNaYvqryHog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B471E815CA;
	Thu, 19 Nov 2026 22:31:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A44211E7
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 22:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9643860E24
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 22:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnzWWLDc4JVT for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 22:31:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 60AD26072A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60AD26072A
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 22:31:39 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C4AE92C81CD8;
 Thu, 19 Nov 2026 23:31:37 +0100 (CET)
Message-ID: <3ebcdfa3-6ae0-4e41-9a68-005eeaab9385@bubu1.eu>
Date: Thu, 19 Nov 2026 23:31:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org,
 Julien Olivain <ju.o@free.fr>
References: <20261119160005.628790-1-peter@korsgaard.com>
Content-Language: en-US
In-Reply-To: <20261119160005.628790-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/ruby: security bump to version
 4.0.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peter, Julien,

I'm a bit late here as Julien already applied this, but there's a few 
inaccuracies in the commit message.

On 11/19/26 17:00, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2026-89078: Double Free issue in Regular Expression Parser
> CVE-2026-93577: Integer Overflow issue in Regular Expression Compiler
> CVE-2026-97229: Integer Overflow issue in CI/CD Regular Expression Compiler
> CVE-2026-110264: Integer Overflow issue in Regular Expression Compiler

I believe these are technically gitlab (the product) CVEs and do not 
apply to ruby, even though the cause and fixes live in ruby.

Ruby so far only seems to have GHSA's (I don't exactly know how the 
github CNA works with CVEs and if there's CVE assignment pending or not 
here.)
So 4.0.8 fixed CVE-2026-93577 / CVE-2026-97229 via GHSA-22mf-ggw7-pxfx
and 4.0.9 fixed CVE-2026-110264 via GHSA-qm4g-8pfh-6996

CVE-2026-89078 is not applicable because the underlying problem for that 
was fixed in ruby 4.0 already.

> 
> https://www.ruby-lang.org/en/news/2026/10/23/regexp-fixes-for-gitlab-cves/
> 
> Heap buffer overflow in case conversion of strings
> https://github.com/ruby/ruby/security/advisories/GHSA-34m4-m9fh-gqp5
> 
> Double free in regular expression compilation
> https://github.com/ruby/ruby/security/advisories/GHSA-7x2q-68qv-6p8x
> 
> Integer overflow in case conversion of strings
> https://github.com/ruby/ruby/security/advisories/GHSA-87fm-7w84-j2px
> 
> Out-of-bounds read in case-insensitive regular expression matching
> https://github.com/ruby/ruby/security/advisories/GHSA-wpqw-5qxg-m68r
> 
> Heap buffer overflow in regular expression compilation
> https://github.com/ruby/ruby/security/advisories/GHSA-7whj-cfh7-xgm4

Typo. Should be 
https://github.com/ruby/ruby/security/advisories/GHSA-3p8q-wmhx-vm2w 
instead here.

> 
> Heap buffer overflow in Regexp#to_s
> https://github.com/ruby/ruby/security/advisories/GHSA-7whj-cfh7-xgm4
 > > Out-of-bounds read in case-insensitive backreference matching
> https://github.com/ruby/ruby/security/advisories/GHSA-pvgc-g7gj-pv6h
> 
> https://www.ruby-lang.org/en/news/2026/11/18/multiple-vulnerabilities-in-regexp-and-string/
> 
> Release notes:
> https://www.ruby-lang.org/en/news/2026/09/15/ruby-4-0-7-released/
> https://www.ruby-lang.org/en/news/2026/10/22/ruby-4-0-8-released/
> https://www.ruby-lang.org/en/news/2026/10/23/ruby-4-0-9-released/
> https://www.ruby-lang.org/en/news/2026/11/18/ruby-4-0-10-released/

Additionally the github release notes for 4.0.10 call out:

   Update the default gem json from 2.18.0 to 2.18.3, which includes the 
fix for CVE-2026-33210.

And then (as far as I can tell) there's another CVE hidden in the ruby 
4.0.7 release which bumps the embedded ERB gem from 6.0.1.1 to 6.0.7 
(https://github.com/ruby/ruby/pull/18282) which fixes 
https://github.com/ruby/erb/security/advisories/GHSA-q339-8rmv-2mhv / 
CVE-2026-41316.

For these last two we don't actually have any good way to track this in 
buildroot in general I think. :-/

[...]

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
