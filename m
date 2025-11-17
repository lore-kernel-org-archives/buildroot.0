Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088E8CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE84A40784;
	Mon, 17 Nov 2025 20:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3smiU37C_DW; Mon, 17 Nov 2025 20:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D445340798
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D445340798;
	Mon, 17 Nov 2025 20:16:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2518158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3EE882907
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kv6VDSFREUo for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AE95828BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AE95828BA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AE95828BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:16:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5937719F72F;
 Mon, 17 Nov 2025 21:16:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Nov 2025 21:16:28 +0100
MIME-Version: 1.0
Date: Mon, 17 Nov 2025 21:16:28 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20251117171656.260404-3-titouan.christophe@mind.be>
References: <20251117171656.260404-1-titouan.christophe@mind.be>
 <20251117171656.260404-3-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <db4c4a63838bfcbf4c7d3b36c683573d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763410589;
 bh=58MdmH33oZyKXFiK9nQ0juNod7cbjdzXcMKhePUEnRg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AjL9njfcE2nFGjj8fNihVkHITxVXtnrwXPQrDScLo00Qgr8vTARNGuuZMQj3mv4aH
 qM3JAil5gG7B8Rvz2OBqnC0bi7q7rOIEa5WxbREpME+NmVgCCLXX4wtpHt/605vxKN
 e89q90BCNGefrkKZwDsqDn1zG2uxDzgyuF2ZyhbFFGC6c75s32Ah4WhTyjR1AwlsSE
 f35bosvbC4dfoI9VicJ+J0Ut7JwRHdRo07sB4wk7J8YV9nO/ovvjGgGyPBCmVo18Zc
 jzwWBOb7+SijaZR4HqUOA4vfhxZDyVqUhSt1YoZo0h+feD4d8ZSVMj9/GL/Tfhtu7L
 F/3OQiBway8yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AjL9njfc
Subject: Re: [Buildroot] [PATCH] package/redis: security bump to v8.2.3
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

On 17/11/2025 18:16, Titouan Christophe via buildroot wrote:
> See the release notes: 
> https://github.com/redis/redis/releases/tag/8.2.3
> 
> This fixes the following vulnerability:
> - CVE-2025-62507:
>     Redis is an open source, in-memory database that persists on disk. 
> In
>     versions 8.2.0 and above, a user can run the XACKDEL command with
>     multiple ID's and trigger a stack buffer overflow, which may
>     potentially lead to remote code execution. This issue is fixed in
>     version 8.2.3. To workaround this issue without patching the redis-
>     server executable is to prevent users from executing XACKDEL
>     operation. This can be done using ACL to restrict XACKDEL command.
>     https://www.cve.org/CVERecord?id=CVE-2025-62507
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
