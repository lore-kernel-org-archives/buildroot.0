Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE1F606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ej80tBTr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF76540663;
	Mon, 26 Oct 2026 20:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRH32b9vPHFl; Mon, 26 Oct 2026 20:23:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DEB2B40647
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793046207;
	b=YkEE4Le3VO6faYCAJANy8jxHk26WHaAxuvknE37zqO8p4qychbU+5F+fvePA2mDVu+OJ
	 1nlSJg17tjK12zgxffZfBNPV6J8pU/E1xMfYXoKy0C8m5MU5ICA9DNn0RuqMNWeYFhbqR
	 ZkvweyrBI848/deAJdfAOVofa4mJcilo9YuNdav0mvNyrFHt08fhUhy2rBGXb5z8qIOVK
	 pM6vqY+RF1lScIKyV+peOyjeFCYU4qc7M4E4zr2fpX9UBWRNchekZoc2rZdVO0WpjnL9x
	 uwUJ4TXr2UJXe8+zes4N4fHxCVl4oIHCCAYKyyL0yCLn/0ZlbegtphV9aLfNRbDf+RQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793046207;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=6T4A4d3T+3myOiVFI3yG5y0p+vvqyOMiZTWfdIswuTc=;
	b=UOz+WZkWnTIUx36atShowITJSHE5w0N+celkDUKerNX78bSP0kQJk41AX9fCtxup08st
	 2ae2RcmjqIxEDDiof4DqekYlB0t3IbBPK0ZQc7WiJTRa/+E+EAiBucaLFzgoyoWTq23GA
	 FKISs+YZZixtbUR7kHTFoEjuX0xAh49XsgvySokweqZ3kLA0/MAc/eDEJOA/VQ0UbE6Ap
	 AfWhO35156l/ILM3aObxJTQ83nuldQGpqBx879cHyHyuwXzJ0DwIuc6l89ufE52Z7e+4H
	 EDuGltEWIfIVn4AAFA3ddRLQkLzMWwYj5Y6Rw/rcjQWAJ7sQNWCDY60PSO/vnjHELMQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793046207;
	bh=6T4A4d3T+3myOiVFI3yG5y0p+vvqyOMiZTWfdIswuTc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ej80tBTrEOIk7utxuCbytj9vsEYUpEVxnPvFRLa3PO+xyH5vpNZLgVA5BUJVbcdVy
	 F64T53i8Bx1fidH0nGNjPn1J8hwfc89AB5F6lgYresFdWdvEHcDhGQiQEGWh6jlCJZ
	 xsLyA/98Zdz90qCxCjUtgKFoCu5+eLng6Eet58bD/11NfdFtaW2OUrGvzJhnB/BYFC
	 NzWrExmGn4E0gJcduPlATlB79PpVXjO2Kz/LmYWFPHwoBRpVJdoiwBNv6DaK6ZxWRc
	 og/g3EOzhfWDPpIxGRdYHYZEwJRkuS8Z424/8Fqj8Vl267ISNRyc2f1aZf8Bi2uN5f
	 lh+GQoZpaRsLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB2B40647;
	Mon, 26 Oct 2026 20:23:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AEADD4BC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC40C80C1C
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gk8Y0-cCX0t3 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:23:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AF1BB80BE9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793046204;
 b=LDWUpqQVZesm/hdWsLqUN6eef+CCchIbu/8HuJl9ouTTx1iWsnwREmFBZrx+Zuywo4Vg
 oz/CEoa7Ol2vF/RWTmeSPYJyyy+sOY/8HCaWlH1ONb5AR1FALvm5beszqSRWeOkBuQ/zP
 7IiqQU9bjfxzI7y2p2rtCQ+z+supq48DO1NZHkzr69A2n4a6mBfZ8DTEMzBW6dC8AnlPH
 IMykoKtgzH7pvXlUPD/QeGaR/awtJMATWPac/PjtHA9+vCx7KypdIsm70NRjvtA5YTYjE
 3i+rDrXsI0kHKpcJfviIwLoT1wWYJthRG28tyzDj0J2QdPM0HF5K25DTf22pZGN3uYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793046204;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=1NHJ/fhZocEodvYq+jQb/Qd4GoZ4+DvLFG8f0Bn3iGU=;
 b=WMrulU+HwpQsB4BSK5AcEH+OsUT0DP484v6Y/c5j2UqbhZgZDVyeBbhmPFCBW7qoBEDF
 japV2ONR8yOkstuXYAhtcyKajel2475EGi0+wNDYrqlpaJpWX367XyiENiSe68rx5Uevv
 Fa3/giQnXKIdnt6YfQroMoiow2PA+Z6VO9XJSttdqnemcC2VgYt4My6JbWXwO2gDWIJvS
 gy/jI86iD4CxRUXASo/wsvZCZdIFn8nF5kklCyD2KkcEfTn0PEjyqCLndol1NU0YbnSOr
 /3yVmvAazXYRJqrpUGbOwSdnHDjYlwbgscf9DpLC7yEd15X1ijb9VsvKI4rGloZHdRw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CKN+uWL6; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF1BB80BE9
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:23:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 00E0D780331;
 Mon, 26 Oct 2026 21:23:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 26 Oct 2026 21:23:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 21:23:20 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261026120511.1293278-1-yegorslists@googlemail.com>
References: <20261026120511.1293278-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <4a57bc2ca462c4b5740cbe2b21453e54@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/tcpreplay: bump to version 4.6.2
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/2026 13:05, Yegor Yefremov via buildroot wrote:
> Release notes:
> https://github.com/appneta/tcpreplay/releases/tag/v4.6.2
> 
> This release fixes six issues found by OSS-Fuzz in fragroute, a --pps
> regression with -T select, and the build on musl, uClibc and when
> cross compiling.
> 
> Drop all patches, as they are included in this release:
> - 0001-cmake-fix-tcpdump-detection-when-cross-compiling.patch, upstream
>   commit d7e8593b515e53f6f6b7e2df496955568146ecdd, which was then
>   reworked to also accept -DWITH_TCPDUMP=OFF/0/FALSE
> - 0002-build-look-for-fts_read-in-libfts.patch, upstream commit
>   a829c8a247cfb688f6c2103d750f72a1f0fc348a
> - 0003-txring.h-fix-build-with-musl.patch, upstream commit
>   da763d37b2b275ef977e5a9bf4424bbe1fb2b22d
> 
> LICENSE moved from docs/ to the top level, and no longer starts with a
> note about files distributed under other licenses. The license is
> unchanged.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
