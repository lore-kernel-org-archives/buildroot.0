Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D25C61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 12:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C63F56072E;
	Fri, 28 Aug 2026 12:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKG8cosxZ1X1; Fri, 28 Aug 2026 12:10:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787919059;
	bh=l45p0qLeLJNpQJ7aeVdfl60JbJLeSbPbzFCQVGLFqng=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HIBRmdf5WUQVNQpEYWVGsQvK9zV4GVKAYI5Wma30MPuw3gLTcDk+wRuWPjjTbJZUq
	 /sxl8Y1rl4XS/tSytFuWBh6ymWksk5gKRgijvndD0wjJBzZTBMRw+E1B9dzNrgBfGC
	 zuDu3RQAAjrJmWY9EtUagPOpzHgYa5EJBPO/v6V5ZnxzUbujbzEJkk4/lNkjRkVnyL
	 k/YeC+pmLkwchnqL5XOHZ6Fl94QQxiavw61bTL/UVplmxmsr/4X/yCUVS7GqjZu47X
	 GmDJwgefnpxxKrvkp2xgpYddbitf1POxTRyJaTbY26BkTSpBeW8l895IzEfvk7iR+/
	 fEh+Ijp9wR/cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E32A0606B0;
	Fri, 28 Aug 2026 12:10:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A77B355
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 12:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BD9D4082E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 12:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e15DLJs5kKN9 for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 12:10:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 451A74073D
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 12:10:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7FC1D5FFAA;
 Fri, 28 Aug 2026 14:10:51 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Aug 2026 14:10:51 +0200
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 14:10:51 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260828060500.58909-1-shirokovalexs@gmail.com>
References: <20260828060500.58909-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <bd28d0c854c8796d76a1dafafe45c67c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.59.0
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

On 28/08/2026 08:04, Alexander Shirokov wrote:
> Changelog: https://github.com/Canop/broot/blob/v1.59.0/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
