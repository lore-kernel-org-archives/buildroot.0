Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAA0C36005
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 22:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F41D617A2;
	Tue, 25 Mar 2025 22:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l77IfUIg6-mc; Tue, 25 Mar 2025 22:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97DA961AB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97DA961AB0;
	Tue, 25 Mar 2025 22:12:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F4A61B8
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 22:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E5B41380
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 22:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9P-rUoVXj9FB for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 22:12:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E8ACC411C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8ACC411C3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8ACC411C3
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 22:12:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3C0A013F86A;
 Tue, 25 Mar 2025 23:12:22 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46216])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Mar 2025 23:12:22 +0100
MIME-Version: 1.0
Date: Tue, 25 Mar 2025 23:12:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250323190752.3336361-1-bernd@kuhls.net>
References: <20250323190752.3336361-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <2346ae0c85bcf8faf08cca4108854a9f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742940743;
 bh=gY/AznjD34nvSiqYLnMLAe1R94YMRgRVkYuL/X/Ja+k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fk3CC5/06bduwq1JIWbdBsTU7v9QZxo0puJSfMEWDsYyihyaGnFlfPGWMLLpXEZrN
 RMt/KdZ8B5Ubarhv+N8LtkbMvyNyoeTKxU8SmicmFOF0ydraZqCiIKvJyAFQgMJrpu
 kKhwqdu6fVyq973KWEXKZX6I1Bmiz++zUh2ZbHfjKff3sfzMIMLyCIQuMVKX245VLz
 rTLwvUwjm3vvWQFYFV+U8/WlCnNExUd5BbF72t2XMkbIiRnx3Ya9H0shZL9JIaS5+r
 5GKsLtxCLj2JqaW8KyubSE9G9pD9LzsikAEX5E8RE6ReAg5hsCk9OJqyGpdUfuYhi1
 CKAiuJtGtAB+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fk3CC5/0
Subject: Re: [Buildroot] [PATCH] package/tvheadend: bump version
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

On 23/03/2025 20:07, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
