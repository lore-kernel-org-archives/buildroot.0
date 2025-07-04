Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5135C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 17:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8F2360D92;
	Fri,  4 Jul 2025 17:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxZpxvK7_rOj; Fri,  4 Jul 2025 17:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 003436162C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 003436162C;
	Fri,  4 Jul 2025 17:02:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEB917AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C33B940880
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEHeg46k9u22 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 17:02:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CA7D400B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CA7D400B3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CA7D400B3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:02:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 13A3F2003BE;
 Fri,  4 Jul 2025 19:02:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Jul 2025 19:02:46 +0200
MIME-Version: 1.0
Date: Fri, 04 Jul 2025 19:02:46 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 thomas.perale@mind.be
In-Reply-To: <20250704092142.1885856-1-titouan.christophe@mind.be>
References: <20250702151228.1641390-1-titouan.christophe@mind.be>
 <20250704092142.1885856-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <65c67a53be84ac80cad1b880a956e73a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751648570;
 bh=dafVAXYAAcYXYLF+Z2li8GuMoh+P4Jw0pXWJ0SpFoZ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hofpuTMT0bYmorQdunKXQ43MBKWyh6f6XfPnowGN5qzK/ZF5G1Y17z8yhZWXWhOSr
 m7Fxh+/m3jJDCHHb7bu7BZSVe7cEQ8OfqJbE3sGbuUlMe/aNpyMa97bQbHOkKAvBx+
 OF77OZ9a0QY5XmB3sUyAP+eF62+ZzkyaU3TOLtumxFMqsNe2jJuPbmf1qfvooxizO5
 WmTKSWS4YQ+ZZqAfPETVW6bo0wE20S8xUOIEJ29wnhPNXlpYJU1WQ2hgPyimWD6Go8
 FXb5GRtYnpI5hEfnJhYTQZZG0QTOgxBRSdIaVfTdmCzZFF5UXMcjQnVbXvhx0T85xQ
 or3LUEkPPxSRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hofpuTMT
Subject: Re: [Buildroot] [PATCH v2] package/libsoup: add many security
 patches
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

On 04/07/2025 11:21, Titouan Christophe via buildroot wrote:
> Import all security patches from OpenEmbedded for libsoup.
> This fixes the following 18 known vulnerabilities:
[...]
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.

I saw that the last package using this libsoup (v2) package is
gstd. So maybe it would be nice to update it to use libsoup3.
We will avoid piling up those CVE fixes and could even remove
this old libsoup package.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
