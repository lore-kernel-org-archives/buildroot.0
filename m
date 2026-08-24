Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D805C5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 21:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B11640611;
	Mon, 24 Aug 2026 21:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7JwrD83XVge; Mon, 24 Aug 2026 21:46:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787607969;
	bh=f47eXU3eRYh2KQcNg0ckaf9EUWygl3rwRYgbWEgT3cI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qvdc74yaiybu51A5Aw4hQ9eHcyQdNtRWBl8kkLYxDQG3HkmxT1LC+ayTNJ/SR7OSH
	 MYAe6jUtm1PBn47woHpGcjy1amGo1jQelAKek+BNsSFHPojQj43qIVHKl7hZR5qGFv
	 mmTJP3viTrw38wg6LRG5GFxo7FG3HxSL1ijCXP9KiGqlDbw6PEYX4p2xmhdAR0oQbt
	 qAw401dYlsyEKTWJHfQlqxz5Kj+GStE/+ZUjd7e/8vk1zRlbNtHRV82W5bJLpi25xZ
	 YXnNyxECUlGZc2Czqap2c+T1kVg9yuHO0inMIBdTXnTOZ2SKga2Tt6Hrxbq591TCKe
	 YPLQ0X67q6yEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 358CA40475;
	Mon, 24 Aug 2026 21:46:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA430279
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D08BF80C74
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nex9i5CDo-ej for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 21:46:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E043280C9C
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 21:46:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3F71A13F861;
 Mon, 24 Aug 2026 23:46:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Aug 2026 23:46:02 +0200
MIME-Version: 1.0
Date: Mon, 24 Aug 2026 23:46:02 +0200
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260824084631.26721-1-shirokovalexs@gmail.com>
References: <20260824084631.26721-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <7e03125f1f069ce8772a9a792f3b3658@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/zellij: bump to version 0.45.0
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

On 24/08/2026 10:46, Alexander Shirokov wrote:
> Changelog: 
> https://github.com/zellij-org/zellij/blob/v0.45.0/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
