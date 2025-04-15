Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBF3C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 17:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D4EC80EC9;
	Tue, 15 Apr 2025 17:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCgf8_0BOS4R; Tue, 15 Apr 2025 17:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF0F980F44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF0F980F44;
	Tue, 15 Apr 2025 17:27:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7720200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B875160BBA
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PL2iPu6u-bFu for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 17:27:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5280608F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5280608F0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5280608F0
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:27:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B345D2003C8;
 Tue, 15 Apr 2025 19:27:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 19:27:31 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 19:27:31 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250414121925.1955131-1-thomas.petazzoni@bootlin.com>
References: <20250414121925.1955131-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ac7de3f40ebc611ef5b88a7f4a5cc6e1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744738053;
 bh=pvUDtsHBcMrOnTMVFUwnMnVd+3kW+glQZizJ9sgDnkA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KV+3Vnz6MhzGGZ5SZvXthZ5EdE5hA1tZjqhES3FaIJyQXavn/XidcQgVoLtVa/qvi
 8UyA+IALj1PPdTyx2O4lTz6WcfuCYfNEteA8w11jhjHv3Y2ocpS3IZX/u1vpBY7NkW
 senZE0gUvj+IBAKkwX25A2kKGxv9sF6bgnGKirz9RQzf09caXkr0D5BoIEChyUdV2O
 DJwzg5g+AAnmbi+/jCH+baPlELLPiDqsG7CboqqP3tRr49vM4BdmPYsvF9PfpedeFA
 sdJHs/kiofLQJ62a8N52ajBO3Yh78Ta/9qrPpmYdZY+46bJnvhB1IjeeW3tMEAazvG
 zHE5rv9hHwgCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KV+3Vnz6
Subject: Re: [Buildroot] [PATCH 1/2] package/libv4l: backport upstream patch
 to fix time_t issue
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

On 14/04/2025 14:19, Thomas Petazzoni via buildroot wrote:
> libv4l has some really special code that is built explicitly with
> _FILE_OFFSET_BITS=32, which doesn't work with _TIME_BITS=64, causing
> build failures when BR2_TIME_BITS_64=y. This build issue has been
> fixed upstream. While how the upstream patch exactly works is unclear,
> it's the patch that upstream has decided to implement to resolve the
> build issue, so we simply backport it.
> 
> The issue exists since at least upstream commit
> 99f245f5e2826c7ae3ac8de530bc2fbd906eb62b, which was merged in
> v4l-utils 1.26.0.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/616608ef2a44efff67fa21b3263b341da82744c4/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
