Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97309C5AD49
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 19:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41E2D60B5A;
	Fri,  6 Jun 2025 19:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hh0K3xkD-yUI; Fri,  6 Jun 2025 19:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82BC060B86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82BC060B86;
	Fri,  6 Jun 2025 19:56:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 434FF1F2
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 19:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 349274093D
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 19:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XjoLDrFrGas for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 19:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A2FE40932
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A2FE40932
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A2FE40932
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 19:55:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CBD9760137;
 Fri,  6 Jun 2025 21:55:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Jun 2025 21:55:54 +0200
MIME-Version: 1.0
Date: Fri, 06 Jun 2025 21:55:54 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250603195828.1189582-1-thomas@devoogdt.com>
References: <20250603195828.1189582-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <54c91c1054ef8a3d32bfa29b8d542817@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749239756;
 bh=Y5E5kbfDz0wbhEf0/6MMIh2x2saziNmJMvlgmh426SE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=he8MVUEz07t4dDxnaI7pEFOH0v1QWXdg122cj3ZgFsiYaCiEbyTbypKlQyJqTJw8J
 xZA/OiOVUZfJVzN6V1fsTfUgSviv9KEP7FcWEp3G8AxmWUatRBLhST6Avq6RkQkGS2
 CBmZsCzDt8UtlgMQFV1pc124knwEVFKGDyG6icEkHfpu+utAlxKO8TgTcBAMbxKk/E
 OrtICX2gdx6+51NyjFUip2JFcp1cTuzFlfft2YYJv9uBt7NhcLqYmSpLmApz7IxIbm
 h2ykfjv0KKDX0NMUd62QogpRzMsOGP3EkX1Az6C6dwm5vEh+FEux3Tvz7smN/aw1Yw
 r9/iRp7VXC+kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=he8MVUEz
Subject: Re: [Buildroot] [PATCH 1/2] package/msgpack-c: add new package
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

On 03/06/2025 21:58, Thomas Devoogdt wrote:
> MessagePack ships both in a C++ and a C variant. Add the latter to 
> Buildroot.
> This will be used by fluent-bit.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Series applied to next, thanks.
For info, I added a note to clarify the C/C++ variants in Config.in. 
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/110cd929322727d31351d2f4b8e5bbe81b000bf3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
