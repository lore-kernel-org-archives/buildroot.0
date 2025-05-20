Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28326C3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE82610A6;
	Tue, 20 May 2025 17:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YvHRcfvcFJkZ; Tue, 20 May 2025 17:39:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1151761038
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1151761038;
	Tue, 20 May 2025 17:39:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61697DE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4842640195
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzGYhNs7BqG6 for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:39:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A3974015F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A3974015F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A3974015F
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:39:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EA273780502;
 Tue, 20 May 2025 19:39:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 May 2025 19:39:19 +0200
MIME-Version: 1.0
Date: Tue, 20 May 2025 19:39:19 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Cc: buildroot@buildroot.org
In-Reply-To: <20250520114227.9435-1-flavio.tapajos@newtesc.com.br>
References: <20250520114227.9435-1-flavio.tapajos@newtesc.com.br>
User-Agent: Webmail Free/1.6.10
Message-ID: <71cd686c52b48d874effa37f2819dea5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747762761;
 bh=kzsAxNJl2Cf9Qyevn/cyf1lG12NeJ78+wiA0DzKb+Ps=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nKt17dU2/2gqcclVfQw/7pSSLjdQDhN8YbxsUt9Tf2fhjGxi3MxDuS47LPXA/O3K4
 bQIllMteHTVIkZxjBJgTWtXYmbG3tNnmznp7BHBW9Yb3W5Q8FS9DstcHyb/L2w3r6P
 /DxNYLGuNIr//HJrJutzfNyjbTIVrK2Ap9jJJIg9IIJMg9NovgjdELJ8Ja8a9fHz5Y
 cT+MEnFw+jTdc3YaZ/criwIky914qMZHDjpvqi7L1c2HchtGo44UrzRUIgzTgDRRfJ
 Fe/3dFOD3SUkChkD2Gk+oQ/Cc+mHqzjdIK7K017v+PT7Bxne0UYryg4HR/4vvDU489
 sfmzxT8YTM3lA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nKt17dU2
Subject: Re: [Buildroot] [PATCH 1/1] package/rsyslog: bump version to
 8.2504.0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjAvMDUvMjAyNSAxMzo0MiwgRmzDoXZpbyBUYXBhasOzcyB3cm90ZToKPiBTaWduZWQtb2Zm
LWJ5OiBGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4KCkFw
cGxpZWQgdG8gbmV4dCwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
