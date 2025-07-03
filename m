Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F70C77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 17:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50D7540D02;
	Thu,  3 Jul 2025 17:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9e3XeS0W1phQ; Thu,  3 Jul 2025 17:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FDF340D60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FDF340D60;
	Thu,  3 Jul 2025 17:42:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94337193
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8568480BEC
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JJmHC48u4KZ for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 17:42:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E461B80CBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E461B80CBF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E461B80CBF
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:42:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B0BA72003DA;
 Thu,  3 Jul 2025 19:42:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Jul 2025 19:42:32 +0200
MIME-Version: 1.0
Date: Thu, 03 Jul 2025 19:42:32 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 thomas.perale@mind.be
In-Reply-To: <20250703091134.1716980-1-titouan.christophe@mind.be>
References: <20250703091134.1716980-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <fbf29b740b826cc07bc16dea04ed41d9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751564556;
 bh=j2my7WWbSF4aXYmj1JN9zwy8gPyOWSAlRWvuv3kVKQ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U1u3hm9ON5NQ1xB6vAIHJCaJ8iDrDmyiMhcnSVoTWm0D/LpBTisy9/6rZvgBKFPa2
 sXo1KnDnBp8P7+FeREIzoo6f7d7vYWUy1xBVRhBrnyfiwni39/U9PX7ObiKXl9yOZV
 LFcew//eZYcqSnT6G3Mx6N0cB7Y1udi51jtKOlQZ6A4DcWO2nP3ANLGHD9Q7M7+E0p
 SWxKy5aHcGaeOMSvU2rm7zBQHe7Fja0toNCGlRmJ9bftbUCo7r/rLazsZIdoZiC35r
 qriQYyuGiXNapViH37O4rQUJ9uMVcajT6Q/EmpRab4mQmYILOF92lhKZLaxRmL7Vvz
 L2QxFmX00r0Iw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U1u3hm9O
Subject: Re: [Buildroot] [PATCH] package/php: ignore CVE-2024-3566 that only
 affects Windows
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

On 03/07/2025 11:11, Titouan Christophe via buildroot wrote:
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
