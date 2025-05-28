Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156B7C3ABB2
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 20:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E42E40D4A;
	Wed, 28 May 2025 20:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9Rdl9UJSyU2; Wed, 28 May 2025 20:24:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF3F340D4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF3F340D4B;
	Wed, 28 May 2025 20:24:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9265CB66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7927260EF3
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXrhWnZQ4J9Y for <buildroot@buildroot.org>;
 Wed, 28 May 2025 20:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A69E160EBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A69E160EBC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A69E160EBC
 for <buildroot@buildroot.org>; Wed, 28 May 2025 20:24:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A4FEC78034E;
 Wed, 28 May 2025 22:23:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 28 May 2025 22:23:57 +0200
MIME-Version: 1.0
Date: Wed, 28 May 2025 22:23:57 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250527192109.371731-1-kadambini.nema@gmail.com>
References: <20250527192109.371731-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <45ea6003bd7bd3ac28ec3009b0618702@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748463839;
 bh=2AjAGFzxuSgYQ37AJiPcBok403vVFkUaN7pLnHljCbc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pZAcLY9oMZeuen6gGHCbbsKAQNQFVswQU+vvOy+xPLl0lmFkIVI7+MGS50UBtzpMH
 K0o4XwzCUB22aLEg2Bf3FiZRcsXnogyOCDkcHWT0ig8fAsaILWlcvzN4rnQnOQdCGL
 oMJSXQmQgtlXGFngpxl+wcq7UC8fvRCe40sTRGxDKawW7biSdaq3Chzc9MfWHEWT/m
 /+CkhmumKekMZWCAXgBNYMmDpvl9tsC5VJvOdCZefsdotYBvdLHpQo4v9JRPERS6eq
 kHHXOZ1EKOcaSKesSz8H2ZkeM9b6Ay6l1lIJvlgbSl6cNLkniczu4NaD93Pz5RgNEH
 fLZ362NAfLJWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pZAcLY9o
Subject: Re: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.37
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

On 27/05/2025 21:21, Kadambini Nema wrote:
> Changelog:
> https://github.com/pikvm/ustreamer/compare/v6.36...v6.37
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
