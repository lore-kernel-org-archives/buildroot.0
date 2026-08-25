Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D42C61DB9
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 20:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A35F080C9D;
	Tue, 25 Aug 2026 20:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Io05PAKT-BuV; Tue, 25 Aug 2026 20:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787688867;
	bh=Rqrrh0UAw/dV8xWHqS7nzwYsdI9vJzPgqMEOFy3umvc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GdzsD982PHhs3WXl7nbLeAhRt2jG2zCmdjd/I5AfGftNtsNPV8DXEMEL8ybhKRPu+
	 BmjkKTEpGkq4Q3GqX7onsNi251gWK4zmmTsmTDWg3VD/D9Youop6uSUetWWUVa6bL+
	 Dzdae8Os0cSySMsDV80tqXWV/w8IdSFJoeQjEuSj3yYCxfSH+PA3ouS5KqWBbhzqSC
	 ixpxxnZXGajg149NKceChy75Q+U/+vT8pD7ZToWnUXCOjGqtTYcKTCwULA8nyyDNBS
	 xnRvoC01/BrWtdVj+g9yvyVpX1hCHe0OYtxhAMXnJRmitbDfs+XTyLMj3R5tWieLyx
	 Ux7MQpgacdmFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA73380CCE;
	Tue, 25 Aug 2026 20:14:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D533E2FD
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB78F60736
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEU14P4PW4Wy for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 20:14:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76A2B606F6
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:14:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 237505FFAA;
 Tue, 25 Aug 2026 22:14:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Aug 2026 22:14:22 +0200
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 22:14:22 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <ao09nrk6sTpYtRUY@waldemar-brodkorb.de>
References: <ao09nrk6sTpYtRUY@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.18
Message-ID: <d7ceed393fc0592c32e4a59adea2c11a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix m68000 toolchain builds
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

On 25/08/2026 09:00, Waldemar Brodkorb wrote:
> Add a patch from Upstream to fix building of a m68000
> toolchain.
> 
> Fixes:
>  - 
> https://autobuild.buildroot.net/results/4cc/4cc0de3d33339bd50792ca224f10dfd18a636b00/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
