Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC7FC71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 20:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0EDB60B5B;
	Wed, 18 Jun 2025 20:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-D1gtqfGIXQ; Wed, 18 Jun 2025 20:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB79760B55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB79760B55;
	Wed, 18 Jun 2025 20:15:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 479B316B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EA0E40175
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JYds7KkTeAC for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 20:15:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1FCAB4011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FCAB4011D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FCAB4011D
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 20:15:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C2F9213F8B8;
 Wed, 18 Jun 2025 22:15:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Jun 2025 22:15:31 +0200
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 22:15:31 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250617210306.1146468-1-bernd@kuhls.net>
References: <20250617210306.1146468-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <e8a78fc3a300e2b4438ae1c59adc09da@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750277732;
 bh=HMlESRYzXeXQRlmdJU39PgHerHUoAeFBp/LG9ifE/9A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EIpfER0M2L4rj5hVt9Pa+Ab3FQQKivjgF1aYJkz6k7Loph+ZIKiN1WAAlNjowUHZu
 56OMul/yEGp9BZTq3EMHvvnMzJKvYSgQHEKlUE6XgAVZDe4pfoba6UXwpNM8FrDz/h
 SMXTL4uO+KSTLebFJx1Aa5SUGVRdeI7/OIlJoRNIPUYKtyWXEcVaN4rZVO8kDTHNkW
 /2bb7ME6kP6zvPROl3uAIqJMhPVDCfnMi4nFLeVRTkAZSpwpP4EWoQ3KisBhbbJk1/
 fqRkunoQPfPvQJUjCg/3+B1/BFt92u3WYDioQLGSGq+8M1/WdJG6HWNoQHzk+9VbJ1
 h22Sf2qR82EBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EIpfER0M
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.11.3
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

On 17/06/2025 23:03, Bernd Kuhls wrote:
> Release notes: https://ccache.dev/releasenotes.html#_ccache_4_11_3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
