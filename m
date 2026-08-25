Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8040AC61DB9
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 21:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3671F40639;
	Tue, 25 Aug 2026 21:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25mNNZGBusC3; Tue, 25 Aug 2026 21:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787691881;
	bh=piVNiwUpj6Tm18+nL968GROH+/J/2mu7RAVhGtH8efw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ahjpM4SYShCgo0RzqA3PZRVZ/rs7nrjcr7yl1/Fi+VNbBsdad3KmLoEZdEQHaZphQ
	 bMGwjiZ+fz4wLt8O2kDWBUIFzT99X0S5e43H9aGlNZn/1IEAUEdVkykCqWay2CCXSz
	 zGk/ldaVJb3yruPmW5gCsKfelAFB9byKUJKjPHO7hA5Z/keYfTs4V6KGVuzPJheeP5
	 tTNj0IhKQnyzD5bkGCkrJ8HklOwcZXJEqrCIJ8v8y43p9fP+UrMS2UTl2stW10PBCP
	 TdrkSPxHhHqPAH+vQDSbor7/EfwjKvBAO3lqZaoxf3yOQcSAiTq4QRKHxQkc+qHLxF
	 xsbpRt1RuLKeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4386740640;
	Tue, 25 Aug 2026 21:04:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12F20230
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECFAB80CCE
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:04:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0uVmKzCFMTao for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 21:04:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5FD880C94
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:04:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CEBFDB00571;
 Tue, 25 Aug 2026 23:04:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Aug 2026 23:04:35 +0200
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 23:04:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260825202833.3005742-1-bernd@kuhls.net>
References: <20260825202833.3005742-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <56b0544e18fdc8a948156fc381bf2c36@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 3.6.4
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

On 25/08/2026 22:28, Bernd Kuhls wrote:
> https://github.com/openssl/openssl/releases/tag/openssl-3.6.4
> 
> This release incorporates the following bug fixes and mitigations:
> 
> Fixed QUIC server being able to trigger double free when processing
> INITIAL packet.
> (CVE-2026-18798)
> 
> Fixed heap buffer overflow in CMS key unwrapping.
> (CVE-2026-63072)
> 
> Fixed invalid pointer dereference in CMP server via crafted 
> protectionAlg.
> (CVE-2026-63076)
> 
> Fixed unbounded memory growth in QUIC server incoming channel queue.
> (CVE-2026-14456)
> 
> Fixed RPK server signature algorithm selection being able to 
> dereference
> a missing certificate.
> (CVE-2026-14457)
> 
> Fixed excessive memory use buffering DTLS records for a future epoch.
> (CVE-2026-54874)
> 
> Fixed client-side memory leak in OCSP response checking.
> (CVE-2026-54876)
> 
> Fixed untrusted Sender DN being used as a format string in CMP response
> validation.
> (CVE-2026-63073)
> 
> Fixed CMP indefinite cache growth of extraCerts.
> (CVE-2026-63074)
> 
> Fixed QUIC ACK-only packet retention being able to cause memory 
> exhaustion.
> (CVE-2026-63075)
> 
> Fixed possibility of AEAD forgeries with empty ciphertext when using
> EVP_Cipher().
> (CVE-2026-75803)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
