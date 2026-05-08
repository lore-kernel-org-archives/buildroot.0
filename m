Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F63CD3436
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 09:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55D78615B5;
	Fri,  8 May 2026 09:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKNUVL8BZg4l; Fri,  8 May 2026 09:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28AFD61350
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778231972;
	bh=2ZLckdHdwrN+yvem7NeQgjYSYZHnpXMQaSl5gRILiNQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rPqeiFPUXl0hkh5MGrSfUcmwoLPwjlJPS7n80xY9qIoir33v+1mXu8Sjy3scQEF8R
	 U1NgLe9F4uR6rhKKwnhRKiT3O9+vek0uhjdktpT2qUvwValFz7hINmcLHHdruBI+qX
	 ssCXZ7kOyPPY67esAE+kxb0YWqjkNiZ1+Zo2ji70IGOyVzzbo5fQ4orsBvWOuG3gtx
	 1TuFoUJaZdshMUqCA1OQKFgi17MsDheavrnpAko8gXHx3+v8LKyVpqXNEFxpokldIi
	 FvWaUPhImR9Pow5gxA0kqUL9ve7Il1xaeuEko01wpNyRcFXnZBpTcAR4aGK6Ddxqhm
	 RICkvY4OjHniQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28AFD61350;
	Fri,  8 May 2026 09:19:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C19B272
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3999761350
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqodC6q6ho9O for <buildroot@buildroot.org>;
 Fri,  8 May 2026 09:19:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57360610F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57360610F6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57360610F6
 for <buildroot@buildroot.org>; Fri,  8 May 2026 09:19:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0A71513F8AD;
 Fri,  8 May 2026 11:19:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 May 2026 11:19:24 +0200
MIME-Version: 1.0
Date: Fri, 08 May 2026 11:19:24 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
In-Reply-To: <20260507195049.1002469-1-peter@korsgaard.com>
References: <20260507195049.1002469-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <b303329ab2d2fa8be368e5756980d366@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778231968;
 bh=BjxpZoYUSvkbty8ms2VqhGuysRCPC5FLcZ3YF1qpJM0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u+Iy1aDHVsNo+Vc9qN5tGa+f4p1wx+reHScnAxHO0gvRsppM2H2J2iUfAuP2Q7Eb7
 s+yiHUEmkula5wwt8XetcE+wvjda9Cti59OI3SJIAMKxQV6mQDmppZV/iDzX4245aC
 ULPdGpA9SVymXP4mzf4v48ZSVguMvf/AQORoxZVd55WyF6WSMSgFRmfWgWNSF2v+in
 Mh2RAMXzPWgk2if4v8vwH+ACrsqhlxDVGjOT5XN6CzZ/bb8A1Q658AropCSCrASoc/
 KoE8Ta+6MHrlPEtaBSY+G+9gC/7mIYRkosWyuT2Z4A6zrHm5eoBMNMoUR5q50l5mlf
 zT8hfJi/d9phA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u+Iy1aDH
Subject: Re: [Buildroot] [PATCH 1/2] package/go: security bump to version
 1.26.3
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

On 07/05/2026 21:50, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2026-33811: net: crash when handling long CNAME response
> CVE-2026-33814: net/http: infinite loop in HTTP/2 transport when given 
> bad
>                 SETTINGS_MAX_FRAME_SIZE
> CVE-2026-39817: cmd/go: "go tool pack" does not sanitize output paths
> CVE-2026-39819: md/go: "go bug" follows symlinks in predictable 
> temporary
>                 filenames
> CVE-2026-39820: net/mail: quadratic string concatenation in 
> consumeComment
> CVE-2026-39823: html/template: bypass of meta content URL escaping 
> causes
>                 XSS
> CVE-2026-39825: net/http/httputil: ReverseProxy forwards queries with 
> more
>                 than urlmaxqueryparams parameters
> CVE-2026-39826: html/template: escaper bypass leads to XSS
> CVE-2026-39836: net: panic in Dial and LookupPort when handling NUL 
> byte on
>                 Windows
> CVE-2026-42499: net/mail: quadratic string concatenation in 
> consumePhrase
> CVE-2026-42501: cmd/go: malicious module proxy can bypass checksum 
> database
> 
> go1.26.3 (released 2026-05-07) includes security fixes to the go 
> command,
> the pack tool, and the html/template, net, net/http, net/http/httputil,
> net/mail, and syscall packages, as well as bug fixes to the go command, 
> the
> go fix command, the compiler, the linker, the runtime, and the
> crypto/fips140, crypto/tls, go/types, and os packages.
> 
> https://go.dev/doc/devel/release#go1.26.3
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
