Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769CB606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gd57Frso
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45F92405A1;
	Sun, 25 Oct 2026 21:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsnMcRjpMFOz; Sun, 25 Oct 2026 21:34:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 511A7405A2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792964049;
	b=QcsAwIQln7FAzHfNWgGctkWRc4ryglYBMjDzVismbAs7QxQ8yAvYTuYYSR2exhF0JGUl
	 dMcBtrJrI0rbKxIkHPEK43UrGYKSvAvaJ1/ondfly0KRhmN/giMlWKZoogwIRMIS6EavA
	 jRFjZRpb+TPajVp1hsWXhumjxDvJskzIsOO2kbQawTWYy4n5vgnjqII43ZB5y7xmDG+On
	 AmShwETsUdhC100mRnpJV88BFXNg9IMIDZtDAXxWPAJ6cnCc0QKFUMUQozDjcePcjIFOD
	 ynwHYpvvehkrMzey7Ya64oNIqrI8bUMmzSHiwnUswhxs40I912vrjci9u1M9OXx1iaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792964049;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=dwpWwN20XCc/xtPb8E1qN0x9gBvXdf35KbD4GE89fgw=;
	b=XltflZcWRu9b9XKtWHmaJHB1m8Q0GD694wh2ABuC34HWtaat8LU1v65T8MlWGdrUfg/m
	 s3ZmAya5CKbZDXftIBSWd1dsrD0lIph0jhxA7bFYIz3v69mP4Ucu14QZPVdzN8YaARkCJ
	 VYiNIpKvy6tKVQSVInv4+gULEs5E43Aw/LO4zxZo92uNehWGMselnyxOl9mybTg89ag1K
	 +h2c9qu5UWt5L/BOqSJYAAR1TPSedLsk38S3mRu63SgmYV215Zf8BpVtAzwW5S55XzEKQ
	 r+ny889HGKfIxpqmUTESwBRkArQk8J3/2oYsQ67LzJjIj1R5e/dOGUTP71dvfrl3zPA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792964049;
	bh=dwpWwN20XCc/xtPb8E1qN0x9gBvXdf35KbD4GE89fgw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gd57FrsofQCFeMu0pDi987p5o59+ahFCIsJC8zG/lNh9LF9BudWqdMTdANbn6r8Gt
	 Nk3RBxWLizD8Bg0TZTNukcC/JZO9vK2foCRvgrGqQxNT3Thw6e4MDR6Y15hbGF9Ln0
	 7Ajfi1v74gktASptlgnq56jVe7RYGjE3j1XSBeimwcgo+x2nZ1LTaqhNBp1Ky1Z4Xd
	 B+YOy/U+2oVvZrL/ucmjXNRc5SW8ZaHrPXw7PE+0ozJEldeCT92aMWu+ZfRffBVFK5
	 FdlOpPbqRqd50xgXQiyUrm9GLfeaGe6f0O3gKHZRWwprHBfkj8FMl5uvjpF/FO1uvy
	 QhQNbOy/+Z5cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 511A7405A2;
	Sun, 25 Oct 2026 21:34:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FFF04D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D8886060B
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3DhyCda2_ID for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:34:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A325060607
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792964047;
 b=QiElQTMZ3fGVQk0Ll+p7FYR2jn0TfdtlbVlOSQwBVal30bcoTBFdAsrpnjGHS3XlJ9Ns
 cBtCgbFzfHr6LjgsabbuGR7xcR/GpTWgblN4l2zRiNg172lC4RExvUE3stcxsiOEBLpG4
 wHL2RY7rU4Oy4Bh4EMsK1Jcc/qeKyN5rVRfBex9iRteQgWmO6iYpaQ+2RNASdve4hMdaD
 SmhV3n4EDCf3A/qQXbAOSlD4rvMfu3WMNtMe3u1/bD3SE2b4WM6Trbp2UBpdTHXDenrAu
 TUMm8jmu7vOWrgscDPX+0oehdR/T6AIOWA/Hn4a+ugpwHQc7+ImZjp6OE36MW1IucXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792964047;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=cwC9dTJLloJwNsx8FoEBHZUqfg2BNWD4fe1jWhsypeQ=;
 b=OwekjZxcgfBihBf5y3ws16l8LGwxmnWFdnpRhGEok8yHR0gNrd4eOkelHm8IgNh+pHVV
 mLsORBejFZ6BMd+hsi7YUiRA3aDe2XEqmiroJbD+C+b1Yuq2zsIpwP9n2mTEa3lufjmBx
 Wr/eGKZS0WHyX6diD13hybURjrNde9xC1hPVJUQEAyH1z3/VABxYCVahSs+1mzGzPscd3
 u4lGbGgnhBVKiFRJOIsGiQtpB6pNkf2JNtQm39FPMf2CAj81pXVD2S3wqUmGLky+3xDT/
 LZapu4aEHDdasggbX1EZlIUSwYzYOtTgfcxJatOVE+smlUIz239nX7akZCNIn6Z1nRg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="Qsgl/ncW"; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A325060607
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:34:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mi2Jn-1whtDk33yL-00nvqj; Sun, 25
 Oct 2026 22:34:01 +0100
Message-ID: <e091b4f0-2d85-4ab8-a8e3-ced01ced3268@gmx.de>
Date: Sun, 25 Oct 2026 22:34:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20261025211113.561701-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261025211113.561701-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:IIyYFM2AHBMnfEJdug6nEEISR8Oyu99p95J1QkYDNGFZYfUqkaY
 sZhW0mPxog6bnUArHO79KLSrDI4dh9w69AzfU5mbKPYic68g3AxctdZCO/Sgmx8x37B+DZ7
 AqmWOfVhlN87/ek88d9sjpEpcbvE8r7sDr/Knv6jy3b6kbn4M9xA4UC16KuplakYjyOrwzW
 NhTyiExNqhxe4VIqQYV1g==
UI-OutboundReport: notjunk:1;M01:P0:tr/kvKzBqOA=;ju5saAgHYW2LDHxDhkUXS0uQFIq
 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
 Eg/Bppta/+XvoHp/T6rqtwsE
Subject: Re: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: fix
 build with setuptools 84.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 25.10.26 um 22:11 schrieb Bernd Kuhls:
> Buildroot commit 2027954db7f5f42ed976ea2f4655e0cd224c7ee7 bumped
> python-setuptools from 80.9.0 to 84.2.1 causing a build error with this
> package:
> 
> ERROR Unmet dependencies
>   (checked against /home/autobuild/autobuild/instance-38/output-1/host/bin/python3):
>      setuptools<84.1,>=68
>          wanted: <84.1,>=68
>          found: 84.2.1
> 
> Fixes:
> https://autobuild.buildroot.net/results/036/03644dd6955f4f8ccee2b0fe14f4500f0332c2bd/
> 
> Fixes: 2027954db7f5f42ed976ea2f4655e0cd224c7ee7
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   ...1-chore-allow-setuptools-84.2-builds.patch | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
>   create mode 100644 package/python-charset-normalizer/0001-chore-allow-setuptools-84.2-builds.patch
> 
> diff --git a/package/python-charset-normalizer/0001-chore-allow-setuptools-84.2-builds.patch b/package/python-charset-normalizer/0001-chore-allow-setuptools-84.2-builds.patch
> new file mode 100644
> index 0000000000..67969bf499
> --- /dev/null
> +++ b/package/python-charset-normalizer/0001-chore-allow-setuptools-84.2-builds.patch
> @@ -0,0 +1,26 @@
> +From e836793ecb0bb79b87a14e369370591e87a8bc97 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sun, 25 Oct 2026 22:07:00 +0100
> +Subject: [PATCH] chore: allow setuptools 84.2 builds
> +
> +Upstream: https://github.com/jawah/charset_normalizer/pull/828
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + pyproject.toml | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pyproject.toml b/pyproject.toml
> +index b80909b..aae3185 100644
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -1,5 +1,5 @@
> + [build-system]
> +-requires = ["setuptools>=68,<84.1"]
> ++requires = ["setuptools>=68,<84.3"]

I've just sent an alternative Buildroot patch to disable the dependency 
check. Increasing the limit only makes it likely we'll get the same 
problem with the next setuptools update. Having that arbitrary upper 
bound is the real problem, but I have my doubts a patch to remove it 
would be accepted upstream. :-(

Best regards,
Fiona

> + build-backend = "backend"
> + backend-path = ["_build_hook"]
> +
> +--
> +2.47.3
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
