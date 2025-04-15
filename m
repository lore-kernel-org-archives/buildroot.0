Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33021C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 17:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DADFA835DF;
	Tue, 15 Apr 2025 17:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xi3WmCzeziGM; Tue, 15 Apr 2025 17:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CAB783640
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CAB783640;
	Tue, 15 Apr 2025 17:25:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1727F109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F06AB835A6
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNGvYUJiu6a3 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 17:25:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59CEC835DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59CEC835DF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59CEC835DF
 for <buildroot@busybox.net>; Tue, 15 Apr 2025 17:25:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7F2676013E;
 Tue, 15 Apr 2025 19:25:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 19:25:19 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 19:25:19 +0200
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20250415090638.319859-1-francois.perrad@gadz.org>
References: <20250415090638.319859-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <b95160d7aeac6b5f78875a37bd9322bf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744737920;
 bh=TbdnMuD2P9Q6EzGtF3DpI5vGgeKKjF9JsS9V0RSn32g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JFBuE0/VqlIZdfeKYPHcD3l3PRrsm50c5cTbhHOCA/etQBK7OmA/8csmeE6Ht2mM6
 NdBbAle7O2D8TQjmrnj+yEEBxZKExU+Hf5DSsGoX/jIuwHYGyGeearipFJYfieDsGi
 TF9jY9GoP+cGTOrsrwYpCvH3OUID//y+PaqS6JXsWOcoJG78qBKCh6j9Z6eJa0cgsp
 GBhANbxqkNtP3+rd0uVS1IalcuKicxBGvjR13wWCUxgfnleoCNsGqIA0hJURfl25qU
 Y9YWB9Bh5Srvrw0d9hWUS/Cigj0vsOnwR+zi025yBxBbLGfuKXXpX1Gnd77eJ+9NdT
 FO75sMuVg9eeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JFBuE0/V
Subject: Re: [Buildroot] [PATCH] package/perl: security bump to version
 5.40.2
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

On 15/04/2025 11:06, Francois Perrad via buildroot wrote:
> fix CVE-2024-56406: A heap buffer overflow vulnerability
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

For info, I also fixed a check-package error in the hash file.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
