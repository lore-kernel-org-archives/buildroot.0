Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA276606A31C
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 21:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m5KS2Sff
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B3FA60657;
	Sat, 31 Oct 2026 21:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSFTM78_aB8m; Sat, 31 Oct 2026 21:02:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5891960639
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793480545;
	b=cr6qlv7Ki7elqbxq3tatvbZa85mFu7BL0EnBVK8aC/XdWTLDytN8SnzznlNuufc5Ktuk
	 q+0/MGYwdV6VcXXbrc7CiNu0O9V5Q5Y57oUX9IkEBxw4KYe9Xng0ZwvbCTKVOujLgjjEL
	 fhqIB77w9/NNeUUVz2bYPKIOP5/0C+zhdjETj+XTYiQj8Nq4MUGQ6l9KFhvSQ5quvzJZL
	 79bPOXH5YGcg0F994tfaMJ89vZ92U1P0Pxzm/dAktBmCPmUcvnxO+8cZoKCGK2cbvNk2D
	 ds/1FmgRSN0iA3zsKNe7B4BRr+u0N8f/8Nah7NGN7JedxgvSZBMaU0zfZh9WTATkTWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793480545;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=EwMJXPRBE4H3+ZvWqSwfAtM3AD3yXE6OW6H3Noww2jc=;
	b=GrpD8XkWs8QNgzeNQiVLpGRa5dYqgsvMYGKYYiXRCIanYBlA0K8B4EHKOFLjDgw531Wp
	 sgZu5koHHrjkr0NpGagjKvRgGu/EjKPmsFTHyBMZvKSoKiyPaqDyH8oMrwsCEP1Ie4s8H
	 cnBSw6R/sI20t2D5xargmS1Oba/ct6WirZjJU1+RD8a/DhffjaUZMLmu7nqHWJXXdzO+n
	 TQojKxec4hvI8V2eBHx1jsspbI/1oTu74jZrECVB4p87dhe1yyRvHEO+ZeWHIJv6sZTGw
	 3ftzLqu5sWCb3wxuelRdnXp9TaMUAHd4qPhoWsKeZqsXl7qdpi/sbgQP4JjVw7D2PAQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793480545;
	bh=EwMJXPRBE4H3+ZvWqSwfAtM3AD3yXE6OW6H3Noww2jc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m5KS2SffbTSIYfl5WqK+d9feUiTH7jDhfnSva1uO9ZL1dwYx0JSvznZfQdA7tY4Y2
	 QKQp06E+AttspZ6mPfDOnTI7GKk3cQh/rWLiAzZBV0kg5TCNEC+6Lgi/YgQrCKdRGn
	 uVcP1lCIhe5lEaWsI+aTZol8vg7hTobQetdX9piQPxFNO9GVuC45kC6zRZEXj7Ig+G
	 C4jIoHbLh+5JUVmyke+tkDrW13ja/pFnpJcxeE9MaUL9Mr9zPSGcghAkai3zB4Gq+r
	 3yeflC/ZGakJRQ9MsyQHrYJBq9hCHEYi6wY3ZkSlacWGPkZiUQne1ORbedUkgjlNfW
	 wVitXRNGSeQrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5891960639;
	Sat, 31 Oct 2026 21:02:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0A58411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 21:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8535D401EC
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 21:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waan8We41MlN for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 21:02:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A3D1940070
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793480542;
 b=cJ3AN+HeTZqVNULWVsro0Fk/Zjp4YD4MDrwr+BQ3CX8xOTtPZkH344AZ5SXN1XrSPNZZ
 xF4Mv5f3AE0ncNoS1yWfFCVh+t8L16Hxbc0Dty9IPtghu0+dsMMrelqS9dI66VInN3lR6
 WdB+wd04JV9vlVzYeuKU8/RXS/vYVumlmDDwDj3oRTu5O5TNrWFamDfpdJN0qwFSvV6K9
 112oUtbOxVgO7eekh455duefoMqsi+fnYKA9Pc5Dq9joskSPGFFQX3HeKe8tXPyw+Kfx+
 bCtk1Y27btak/kW6pj15V+oB2NjboVVv/0VlG7FkBbEig3F7XwYJVUyYu/wHgdkUoQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793480542;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=2g+70ttchflnygzEtaEdwzQRzy3vjJJqzhu9dId7bEM=;
 b=LNWyJpvyp7JLXy6zAg0p1C4WOT5FKqfNLVEJzeR3OHnCrNhtMbCltJELnHT1L4ShTH9l
 Kb4Gf1v2rDTKTBXcvPe7R8+wR2FJwo5MsJYBwbD6lgw/vkOg/QbFQ4XkFdJXSHXCuUCuS
 vp5jg0YqKP6cTPL0XymR5eOPfOr5pIUcah5HBUeCs2hFBgQTFrwEYVWdhQQ1oq20sIYZn
 JALDghv+WjxDWS8a60YsAJ0do/zS3LRYS7BwjMqNkkRQYIaSyY38wgFZr2P3zACNbjzBq
 Ur/pzf5XVWKbGOH2gTghkO1BSoG+IfC1bjWTGm6NHUtxf2xjLXyiRt4NXZ7ez/Io8/Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iX82DT8n; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3D1940070
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 21:02:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C9B4819F59C;
 Sat, 31 Oct 2026 22:02:14 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 31 Oct 2026 22:02:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 31 Oct 2026 22:02:14 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, Sen
 Hastings <sen@hastings.org>
In-Reply-To: <20261030200552.779306-6-fiona.klute@gmx.de>
References: <20261030200552.779306-1-fiona.klute@gmx.de>
 <20261030200552.779306-6-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.20
Message-ID: <9e3795a0f96a4354dc7603a9f6a125bc@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 5/5] package/systemd: bump version to 262.1
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

Hi Fiona,

Thanks for this series!

On 30/10/2026 21:05, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> Changes relevant for packaging:
> * Systemd now requires binutils >= 2.35 to build. All versions
>   packaged in Buildroot meet this requirement, but external toolchains
>   with very old binutils might not work any more.
> * Meson options for static/multicall builds have changed. Buildroot
>   does not support static builds of systemd, so the options are
>   disabled.
> * systemd-tmpfiles now rejects lines with non-empty arguments if the
>   type does not use any
>   argument. package/skeleton-init-systemd/legacy.conf follows the
>   requirement.
> 
> New/changed options:
> * "build-static" is disabled, see above
> * "dlopen-tests" is disabled
> * "fallback-default-target" set to default
> * "hostname-wordlist" set to false to disable installing word lists
>   for autogenerated hostnames
> * "standalone-binaries" changed from boolean to string (list of
>   binaries), set to empty
> * "systemd-multicall-binary" is disabled, see above
> * "var-log-mode" (permissions for /var/log) set to default
> 
> Please see the upstream NEWS file for other changes [1].
> 
> [1] https://github.com/systemd/systemd/blob/v262.1/NEWS
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> ---
>  package/systemd/systemd.hash |  2 +-
>  package/systemd/systemd.mk   | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/systemd.hash 
> b/package/systemd/systemd.hash
> index 495d32c2a3..176d67cc9a 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  
> 2f78c37c6592dd34b95cca86793f1b8c5b073db35681ef80ea16a73c0c297a9e  
> systemd-261.4.tar.gz
> +sha256  
> 100fc873b848b9b0297d8a705e8e2ed326256c8483d9960ee1ffe264c8a5c3e3  
> systemd-262.1.tar.gz

Running "make systemd-legal-info" produces the error:

ERROR: while checking hashes from package/systemd/systemd.hash
ERROR: LICENSES/README.md has wrong sha256 hash:
ERROR: expected: 
bce1d2e9bad517b493168b37604c5d02a7fb638b4d1b9fc730adafa06c603456
ERROR: got     : 
a817486a61df66ef79f96032763c861abd0edf4199cf39a7b1515a7e29f6e6d0

The LICENSES/README.md file was updated several time, so the bumps
to 260.6, 261.4 and 262.1 needs to update this license file hashes.

See:
https://github.com/systemd/systemd/commits/main/LICENSES/README.md

>  sha256  
> ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  
> LICENSE.GPL2
>  sha256  
> 6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  
> LICENSE.LGPL2.1
>  sha256  
> c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  
> LICENSES/alg-sha1-public-domain.txt

Could you send an updated patch fixing those hashes, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
