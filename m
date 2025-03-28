Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8A2C36010
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD63860A43;
	Fri, 28 Mar 2025 18:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gxd3bpH0Xt36; Fri, 28 Mar 2025 18:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3210660A90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3210660A90;
	Fri, 28 Mar 2025 18:53:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4FA71B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7134405F8
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AqDESX4Ek34 for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:53:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3D64405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3D64405A1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3D64405A1
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:53:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A9C00780502;
 Fri, 28 Mar 2025 19:53:44 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35780])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Mar 2025 19:53:44 +0100
MIME-Version: 1.0
Date: Fri, 28 Mar 2025 19:53:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250326201652.3058963-1-peter@korsgaard.com>
References: <20250326201652.3058963-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <35709dbfd72606bfa19d93e12bb4e859@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743188026;
 bh=Q1WbrF9pnQvrmVI1i9WtE/QSkJ/VwGli07UdS3Zq1rI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aYOtZlACsXXOziXS4FtguPCxLICZ/dVxldSc+8uWENSZnoCaWh40rzYzHZefcmmmH
 FjLZxTHyd642n9UY4sbSuTInCtfZCYwrDqyzUKb4UurL4tAAWhmZnue44Mp7vDHfiq
 bAJw8U2ZxRqblEt/rnzXjoLU8hixsKKQXpYAllpQriN0oeeP1L0WQvTdK+4Xb3Sjfm
 kIvO+h5J24JPANveBSwoaN/AhiLxCsTGlQkaAdX/rtvjd+0YnZyo1msIoIhc4KGpUc
 jw+KhIImnY0MzvB7QWmQtAcWNaZ+1amubGCzXLjHMBUlI1fD7Sd/wnpahp6AyI7Mf6
 kdNCoag6bAlKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aYOtZlAC
Subject: Re: [Buildroot] [PATCH] package/mbedtls: security bump to version
 2.8.10
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 26/03/2025 21:16, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2025-27809: Note that TLS clients should generally call
>   mbedtls_ssl_set_hostname() if they use certificate authentication 
> (i.e.
>   not pre-shared keys).  Otherwise, in many scenarios, the server could 
> be
>   impersonated.  The library will now prevent the handshake and return
>   MBEDTLS_ERR_SSL_CERTIFICATE_VERIFICATION_WITHOUT_HOSTNAME if
>   mbedtls_ssl_set_hostname() has not been called.
> 
>   
> https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-03-1/
> 
> - CVE-2025-27810: Zeroize temporary heap buffers used in PSA 
> operations.
>   Fix a vulnerability in the TLS 1.2 handshake.  If memory allocation
>   failed or there was a cryptographic hardware failure when calculating 
> the
>   Finished message, it could be calculated incorrectly.  This would 
> break
>   the security guarantees of the TLS handshake.
> 
>   
> https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-03-2/
> 
> For more details, see the release notes:
> https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-2.28.10
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
