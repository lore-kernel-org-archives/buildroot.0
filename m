Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E714B60A2622
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 20:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y8PQOmR0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2BBB60754;
	Tue, 20 Oct 2026 20:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QSCVPSyK1EUP; Tue, 20 Oct 2026 20:59:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5771760730
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792529987;
	b=RjRjxCp4TLyd4Ry6ArLgbIvD3c5fldH8odg8VbbNW4LbtqdKCBSzp88R0OyElhJw1MCR
	 wSt8De6l2BzN+a9KvXTI2p+Mf72PeRnnzf7xPHsD9Z9zxHW++tZL/lEONGCdncNCC/M0u
	 Nk1tqa+7FBFLf3R+R0GHdQOv6ZU3XcgNLJpG8R8CZCSJRfASsVNupK8dYwdRzBKdL7QND
	 Wkja44o5GrbC7CzhRuO9HWq3UY9+S5S3JXKUwLDRnFg2GPmUuCkzZDgzk2WO70kKLYrAY
	 0B32QoafVZKQFSpkgaOLJIO3xxA3yVN4xKiol0FIS6hLXXajZtDEdWZEd3u55q7Ht/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792529987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nZleGylApunc5fuLIGZ1VWIN4bTZEwT7pEfh3glVvMQ=;
	b=NUS/HjYi1JmtuIKlTWWY/fyMNdqQp60+JOZoXZWwE1lWZcZ/x/TlPmTGHSCbzUAUdK0t
	 wvbgQsNfX84gsQpTKUoMs2gi9fQPajxTTOe9j5X91YL6JuTCYVqr6GnAb/wYmlfYb8WWd
	 meXhkuRAHLBkQ+f44d/6R2Jn+E365YNW6zR13YYdKqMa3UsDRgpg3PPNA6Dh+CZG/5sa6
	 f+DEzKK7Mmd1M5qg7ACmsqR8I4edKmdDeq3C32GSbh5hDm1VwWavF9cThHHZJ7n2ELb9k
	 yH8cytMVV6KrtHAl4fPTHXitAiZqzlSytNvVBb6MCcEr6ISvCeKEdKhSBfw/iMXa4jw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792529987;
	bh=nZleGylApunc5fuLIGZ1VWIN4bTZEwT7pEfh3glVvMQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y8PQOmR0DCZ0B72bDNrIVlkz+sn5Kx7bXzjDpq/AXZiZrvUaw3ns/SFAjnbgD9eR/
	 VxSCOeNKjcG3AIRZv9uAfZ3WkA+J6fuoK9eMd+eCq9GJEZF2lAg7QCj+FXRnkptTqL
	 JqlmX6B1dIdbtGQECdY7z4ovkrMLeOphEqMUWavRoRIdmNAxB9Vp8cRtpJ5qTNFfWD
	 oJYFE5hnrl6RZZB/g5k3RPNXrbEoVHAD/B1H5SjI8WOjPjoXrHAHkdVrq/OxL0lzyW
	 EtyapigYVplloOEFVoS8ZlzGM51FTt73jnFPv/ABFHR3NJVhEtgpkhhhb8Uz3lSiDN
	 0wpqslgalxX2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5771760730;
	Tue, 20 Oct 2026 20:59:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02AF2255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD0C640112
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kz7SAT7VsPcP for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 20:59:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3DAEF40116
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792529984;
 b=SD1Z162XrdeoA6hEJa1XYanxSuHhZzyFMzpD/+R5+bJ5VSIXXU8AwRXKvqZ4gy21Xq+B
 LLNyHX1WAA0C8pRwYijhl/1FfcM+0VXkQeaMn5MaPJOHaVh0b+HyjnF08SWHk1wb7V2g4
 4qytF5IS8unL0P6ZYG1lMN5T6tewB8IIZjL8HKJQofkewafpkRuN2isR0qT7AMTyDK/FK
 nOIkfBohNuBUX6KPR3MJpvPAzs3LyGZ4KNujbHsQhwGn7M6cZyfLtRe4d5gxJfclRMoBz
 IWbMHWC4KJLxNeY1YKS3KZYGb61vLRjtSDsN0rg5pNgP3veF55vn7v+6awaL07WcxJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792529984;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=VyeVxqtSN1PXX+sVHsV5f+Wt8NAygQs+ZSoKGyTcBns=;
 b=CAAhI/15zP1gigvmtwywBMlFvMGJslb+5me4P+zGXedp8mZ83rXEP+SykuH5LPqUoppV
 l/nUEdJfFooPl8lB6DC4OLxyUFxS1hD/FQuP4dhbQDh3etMSbAbJwSe7T0YwYosziwJ3o
 72F8Pd5+mTyeveV93SBGMIE0C+VO5O1VEu1VMGNE7cBlhAMlYmNeqpLQez9TevnsPWJH3
 ADWPxBnEmyH9rhHU23UGCI+g+P+cfsnh6+RCy8BPOGZBgdr7S3Q6JcN0tPV1q+3noQpKn
 mGZxmJ00PoV+RKtel6avkNu29X9/9m/GfvF4YlZArYU7sT8o9xfuQKQ/m5oIuCjXIJg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TQET017s; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DAEF40116
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:59:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8B708C5CD67;
 Tue, 20 Oct 2026 21:00:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E01B160393;
 Tue, 20 Oct 2026 20:59:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D1C7410328934; 
 Tue, 20 Oct 2026 22:59:35 +0200 (CEST)
Date: Tue, 20 Oct 2026 22:59:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <atfV3uwCqo4u7Hhq@windsurf>
References: <20260912202448.1673161-1-bernd@kuhls.net>
 <20260912202448.1673161-2-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260912202448.1673161-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/libressl: security bump version
 to 4.3.2
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

On Sat, Sep 12, 2026 at 10:24:47PM +0200, Bernd Kuhls wrote:
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.0.0-relnotes.txt
> "- The mips32 platform is no longer actively supported."
> 
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.0.1-relnotes.txt
> Fixes CVE-2025-9230.
> 
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.1.0-relnotes.txt
> "- Fixed compilation for mips32 and reenable CI."
> 
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.1.1-relnotes.txt
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.1.2-relnotes.txt
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.2.0-relnotes.txt
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.3.0-relnotes.txt
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.3.1-relnotes.txt
> 
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.3.2-relnotes.txt
> "This is the first stable release of the 4.3.x branch"
> 
> Rebased patch 0001.
> Removed patch 0002 which is included in this release.
> 
> Updated license hash due to upstream commit
> https://github.com/libressl/portable/commit/30598098a5df3059332327fa0c2bb5877740ac5d
> 
> Force OpenSSL for sscep due to the usage of NCONF_default()[1] which
> was removed from LibreSSL 4.0.0:
> https://github.com/libressl/openbsd/commit/646547a8a28c7b6931751a2ab064fd70d5d8cf92
> 
> and will cause build errors with this bump.
> 
> [1] https://github.com/certnanny/sscep/blob/v0.10.0/src/configuration.c#L37
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, applied!

> Series passed Gitlab pipelines:
> https://gitlab.com/bkuhls/buildroot/-/commits/834ad4accb3fc6eaef48724509c893431e9d0c67
> 
> with the exception of bootlin-aarch64-glibc-old:
> https://gitlab.com/bkuhls/buildroot/-/jobs/16464936859
> 
>   ./.libs/libfreeswitch.so: undefined reference to `getentropy'
> 
> Freeswitch added the usage of getentropy in version 1.11.0:
> https://github.com/signalwire/freeswitch/commit/7f9dd270b492907ddd063be18003e18719bdb80b
> 
> getentropy was added in glibc 2.25
> https://sourceware.org/git/?p=glibc.git;a=blob;f=NEWS;h=ec15dde7613306cfa574149f61ea38ab3fbba76d;hb=db0242e3023436757bbc7c488a779e6e3343db04#l116
> 
> causing a build error with bootlin-aarch64-glibc-old which is based on
> glibc 2.24. I found no way to disable freeswitch for this toolchain.

The logical way would be to add a configure.ac test checking for the
availability of getentropy(), and not use it if not available. But
upstream might complain that glibc 2.25 is already quite old and that
it doesn't make sense to use toolchains that use glibc versions older
than 2.25. In that case, we could essentially update a bit our
bootlin-aarch64-glibc-old toolchain to something slightly more recent.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
