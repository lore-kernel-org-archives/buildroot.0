Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38974C7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F14141E9C;
	Wed, 25 Jun 2025 17:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKZLIgUloyGI; Wed, 25 Jun 2025 17:19:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5598A41EF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5598A41EF1;
	Wed, 25 Jun 2025 17:19:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0E63154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE7EE41E9C
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azKs9MD0LaEj for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:19:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3185B41F24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3185B41F24
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3185B41F24
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:19:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4AB0C19F749;
 Wed, 25 Jun 2025 19:19:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Jun 2025 19:19:22 +0200
MIME-Version: 1.0
Date: Wed, 25 Jun 2025 19:19:22 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250624112047.1715407-1-buildroot@bubu1.eu>
References: <20250624112047.1715407-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <c65ee282effdf306d90ccf3e64e9ce92@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750871964;
 bh=7tovawAhZVWyaA1ng2yLVxvlstz79UEtFiYtD2M6aLY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X5oP0t5b8bAIZukgIRiXe8gLll0+WkJNFpkGuB4pfv09fYlM5D34kOcgfbg2rWS0i
 uztm4QH8/uNJY0yf2bzzi6MiDIlNMsawv/iar0YCJKmrt2s6L2YvGxENVi2dyrSE2o
 KFHOmYKQ0AgbYt5ytcqYha0y2kq4FYZbLf72P9e84ojw6u0AmepfEzCM8J9/uUYZZK
 p4UsDQ4dMrfZHiKUoFwmHisg2NvglO7d62MZ08OlkVFHMlv/60G8mX+eY8YdYnILO7
 YqYc+UJf/YrDhqzhJWhFk5qwqQhGVakk+qkhKD3G58g32PM97WkDYQ7Rk1IZSI2lAo
 4TSbmdFI5IVhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X5oP0t5b
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: bump to 0.115.13
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

On 24/06/2025 13:20, Marcus Hoffmann via buildroot wrote:
> Release Notes:
> https://github.com/fastapi/fastapi/releases/tag/0.115.13
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
