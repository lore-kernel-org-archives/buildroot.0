Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B14C83F09
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 20:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80152607A4;
	Tue,  8 Jul 2025 20:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozmOf811c3zA; Tue,  8 Jul 2025 20:51:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0E2D60B25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0E2D60B25;
	Tue,  8 Jul 2025 20:51:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1986E1BF
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AE1640960
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tCYUz-2iHAl for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 20:51:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35C5B40888
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35C5B40888
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35C5B40888
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:51:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1C27B78035E;
 Tue,  8 Jul 2025 22:51:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 08 Jul 2025 22:51:46 +0200
MIME-Version: 1.0
Date: Tue, 08 Jul 2025 22:51:46 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250707163600.1332626-1-thomas.perale@mind.be>
References: <20250707163600.1332626-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <2e02522aabfde06e8b74bfe4a25212df@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752007908;
 bh=fojnxMv0eoCs37tqPcgzEr69EfRoyqJLROLZIdpPrDo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HtHmlDQ/ULT06z1PBH8QD47gRv31KS3enAoLoji+cw4gb5aYT2Gc0W3kvsikZpgEL
 68qGXkn2m+nlg7FTnJZw6bw1GAzv6TAlAnsgqRdH6wM2znAwWMEGgSdu1Ok29ADSzi
 M14gehA61oSpWVOLksjRAtFkF9j1TBbGyAcavggCzz+lYARmEYPnu2Yug3Rba7op+g
 shelLC9cQCFRjywfBp09EiYIZhb7HqKb1tvGi2o6H3X6m2cF37u4cl7bktLRKAFbFE
 JMaf4IEtFMVVMy0vfOLP3rxdYlO+dgGmPlQwURUXhVrWAKD08Pym7YoiIfo3EahLda
 eAHh1324djP9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HtHmlDQ/
Subject: Re: [Buildroot] [PATCH] package/libiec61850: fix build w/ mbedtls
 v3.6
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

On 07/07/2025 18:36, Thomas Perale via buildroot wrote:
> Since the mbedtls bump to v3.6 [1] the libiec61850 package is failling
> on the autobuilder with the following error:
> 
> ```
> [  2%] Building C object 
> hal/CMakeFiles/hal.dir/tls/mbedtls/tls_mbedtls.c.o
> /workdir/instance-0/output-1/build/libiec61850-1.6.0/hal/tls/mbedtls/tls_mbedtls.c: 
> In function 'compareCertificates':
> /workdir/instance-0/output-1/build/libiec61850-1.6.0/hal/tls/mbedtls/tls_mbedtls.c:122:17: 
> error: 'mbedtls_x509_crt' has no member named 'sig'
>   122 |         if (crt1->sig.len == crt2->sig.len)
>       |                 ^~
> /workdir/instance-0/output-1/build/libiec61850-1.6.0/hal/tls/mbedtls/tls_mbedtls.c:122:34: 
> error: 'mbedtls_x509_crt' has no member named 'sig'
>   122 |         if (crt1->sig.len == crt2->sig.len)
>       |                                  ^~
> ...
> ```
> 
> The logic to support mbedtls v3 is already present on the version
> present in buildroot.
> This patch ensures that the CMake build uses the mbedtls headers and
> libraries provided by buildroot rather than the bundled copy.
> 
> By setting the following variable the mbedtls v3.6 is correctly found
> during the configuration of the package.
> 
> ```
> Found mbedtls 3.6 -> can compile HAL with TLS 1.3 support
> ```
> 
> [1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
> 
> Fixes: 
> https://autobuild.buildroot.org/results/5fc/5fca384510d2fb9dd1d01736dee34b53339d62ff/build-end.log
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
