Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2452BC369BA
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 17:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE0583B93;
	Tue, 15 Apr 2025 17:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xk7gw0qHE0Uo; Tue, 15 Apr 2025 17:27:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C4DE80FA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C4DE80FA6;
	Tue, 15 Apr 2025 17:27:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94B60200
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A506814B1
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOgpLRfZQdbY for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 17:27:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BBED80E4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BBED80E4C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BBED80E4C
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:27:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3E5225FFAF;
 Tue, 15 Apr 2025 19:27:01 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 19:27:01 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 19:27:01 +0200
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Titouan Christophe <titouanchristophe@gmail.com>
In-Reply-To: <20250415035805.643946-1-fancp2007@gmail.com>
References: <20250414060233.3292625-1-fancp2007@gmail.com>
 <20250415035805.643946-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <00b5507b0515f12ebe872c1a139a51f7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744738023;
 bh=SJCTYFVGZqTtU8KUANO11wmK2uKojEVOMaCLboertdY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YyEaO9f3+fPr4YaMObct2yACIWbZXgkNmrzNyi6qOcHuoY+83/AfGItdWrCD+0qqW
 JbwgfJMR5AqaTxMFt3a9icyVLxUeaVzh2/iDNNUcAHUwNXgl4sBvEg4wZZ+crR74LM
 kOH6ciCL7vnggDB0GdDFqTip0l1NcG55PivNNS1QroGfvPPU+4XwcSqg6hk6KnLeGZ
 dXl1pAqy45dtLVbenc6zEOZOr7TuTmju1pqROVKwdMv+sQzVn7wJG2u9qDvw40L7Sr
 62nZ1CtctB/wQWOgpg52u+jTEwiE/DIybXRrClWkYXHXj2xiAE2ayERc6ZNY94cOnW
 1Bp1qxvyYvdzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YyEaO9f3
Subject: Re: [Buildroot] [PATCH v2] package/mosquitto: security bump to
 version 2.0.21
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

On 15/04/2025 05:58, Scott Fan wrote:
> Fixes the following security issues:
> 
> - Fix leak on malicious SUBSCRIBE by authenticated client.
>   Closes eclipse #248.
> - Further fix for CVE-2023-28366.
> 
> Also drop the patch that was fixed in the v2.0.21, see the closed 
> issues:
> https://github.com/eclipse-mosquitto/mosquitto/issues/3183
> https://github.com/eclipse-mosquitto/mosquitto/issues/3193
> 
> However, the new version introduced a new issue, when WITH_TLS is off, 
> the
> compilation will fail. It is already reported upstream with the issue:
> https://github.com/eclipse-mosquitto/mosquitto/issues/3246
> 
> However, the upstream received two identical PRs, we quote the patch 
> file
> of the earlier PR (#3227) here.
> https://github.com/eclipse-mosquitto/mosquitto/pull/3227
> https://github.com/eclipse-mosquitto/mosquitto/pull/3252
> 
> For more details of v2.0.21, see the changelog:
> https://github.com/eclipse-mosquitto/mosquitto/blob/v2.0.21/ChangeLog.txt
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.

For info, I also fixed a check-package error by adding the
"Signed-off-by:" tags in the patch you added.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
