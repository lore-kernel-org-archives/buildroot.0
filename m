Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE46607033A
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=od/2W39M
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00537606F7;
	Wed,  4 Nov 2026 21:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAwalyuQPqNN; Wed,  4 Nov 2026 21:52:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CF24C6078E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793829148;
	b=ei6/PozNQi9hzvqDRQsl4nNj1+fOGzDi9D6uQGiCvQ5B5ifGECpa8xPG/Ylwqrf1wYtB
	 Gx0ob/c0y6RfdAJinNQuNrdupdvL9Dkgdjc++s8zoJxQ3aDhb1W+Pa2odkJFb3ir9jMld
	 ph86iiyozYk6A9y3/kJ5ao0EHeCvRi6yoR70OA8skgcgBc8V9hQCVrT5/EcRgz83v8tDB
	 U4qSZRgaCVTirmml2cvD5JUG8ioWhSH+Vu66Q4dumImZc78InEZltsDGPE42z9KX3KuAg
	 4idSO/c4VydThVwBfzuBIlFjOxmJvh7K+VxDi67pZSKoIxDCuiB2ndcuQE1ACUKBfWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793829148;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cZ8n1PZieNXKFTJaYnx8HVJk/txUtPZXSekEt+Hy1QA=;
	b=epXHH+pUqOEA9r8+W10HjjX0GeSHth3/CWJtqDINzd4lNbWdtOxRHC5m+NZxdQBOpZEc
	 N53jm493VTknjq6/NDi20xliDW7iRVkbqCZXOeHW+mEq3OIxPisxgimjTjL83fS8LTEL3
	 IY0eZGgq2F9XvIzq1Tcfve9zkHPRaG6Mzy4lVZnrdV3oV71DgG4jd0z7VAYLz1Tr4lIwg
	 5HiHqc3jlTkB+56+0JwYpR97tClQcAAOKy36/oY+lxzYeEVn1y7rwpmAcNviCjxX2q4I0
	 WTzBdgUdntdU5OMuyplaaCS2I6+5m3A5C2Pqq+6/vu2s19OXHAbRV59ij3lZJE0IF/w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793829147;
	bh=cZ8n1PZieNXKFTJaYnx8HVJk/txUtPZXSekEt+Hy1QA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=od/2W39M5hLK8Bl8+rM31WjtJZ1fcisLcl5Sh0WPSSA8ZdtMQgP/S/p/4J4bJGFkG
	 ez60vrkcnxDci8hJ+bzMd1Euix6Do6xGN4SEAKs39K/FcqZ9AWw0KjB73XoDKCkAom
	 KZmGjLkKT7Hk7hR3qLblkQ2XwyEuiH2IGHbFK+dwCEsQ5REYZ4ePfrJ2AFCRhNRZ4r
	 jWCqgRWYAg2xsdVfigx0y3gaWgw0fDGBvaf8QwZpukd7f6yMxhyyXNu6v50GqD7q7X
	 6ES3FIV2gPNawd7wwU10wenEqs9/4pmAtmISJ5NwyUhFLSdqDB05SkHjlRZa+23fgl
	 KBDx3LgCgNgSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF24C6078E;
	Wed,  4 Nov 2026 21:52:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34661B6C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31B0A40786
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPmQT9VYPEpI for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4C02340735
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C02340735
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:52:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 006F54E40597
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:52:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C53D65FAEB;
 Wed,  4 Nov 2026 21:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E4B221032925B; Wed,  4 Nov 2026 22:52:21 +0100 (CET)
Date: Wed, 4 Nov 2026 22:52:21 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Danomi Manchego <danomimanchego123@gmail.com>
Message-ID: <auupEdYsZV6OzwPP@windsurf>
References: <20261102150640.3120874-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102150640.3120874-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libwebsockets: bump to version 5.1.0
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 04:06:40PM +0100, Yegor Yefremov via buildroot wrote:
> There are no release notes for the 5.x series; the git history is at
> https://github.com/warmcat/libwebsockets/compare/v4.5.8...v5.1.0
> 
> Version 5.0.0 added mbedtls 4 support, and 5.1.0 brings the mbedtls 4
> fixes on top of it, so libwebsockets now builds and works with
> mbedtls 4.1.
> 
> Drop patch 0001, which was applied upstream in a reworked form as
> commit 8a0dbfba1 ("cmake: only use libatomic if it provides the 64-bit
> atomics").
> 
> HTTP/3 (QUIC) is now enabled by default. With OpenSSL, it forces the
> new GnuTLS backend on, and with mbedtls it requires an mbedtls carrying
> the libwebsockets QUIC patches, so the configure step fails either way:
> 
>   LWS_ROLE_QUIC (HTTP/3) requires mbedtls to be patched with QUIC
>   support.
> 
> Disable HTTP/3 and QUIC, which version 4.5.8 did not have either.
> 
> LWS_PRE, the headroom required before buffers passed to lws_write(),
> grew on 64-bit builds, and the soname changed from
> libwebsockets.so.21 to libwebsockets.so.23.
> 
> The LICENSE file lists two more files that are already MIT licensed
> (lib/misc/dht and lib/misc/qrcodegen.c), hence the hash change.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
