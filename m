Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B400C369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38EB961224;
	Fri, 25 Apr 2025 16:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDGoiop1At7W; Fri, 25 Apr 2025 16:08:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F36A60FA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F36A60FA0;
	Fri, 25 Apr 2025 16:08:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8484C127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B69440C6B
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:08:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDij-FgDqOuE for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:08:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 95C5E40C48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95C5E40C48
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95C5E40C48
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:08:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4399BB005A9;
 Fri, 25 Apr 2025 18:08:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Apr 2025 18:08:32 +0200
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 18:08:32 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250424181706.3990060-1-vfazio@xes-inc.com>
References: <20250424181706.3990060-1-vfazio@xes-inc.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <edd4815bc34cf4051aea5476d1d51e30@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745597314;
 bh=6aWg7F7nZy0jvE001N++bTIFTQTV85xnx7ME5ngQzFk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Aoe++74U7tOjn9QtQwuGtZu7nA9hQfYI2GR7GfTaZrMsQ0n9ctAN5qZTs2BO8uZnU
 D9lahZ4BRYoE0cSrEp7ymkzk7DBcopTUyyxJFFrz9ms1YHLt89WVNld4VzqaMJBD9p
 BCYbgwtV7qiq7E+H9vxAaGHWOs0X4A7RsupbXve3rDxNu+WWUfr0RN0KW9xNyWR7ez
 6QrXHcTJaNV0us75Ekc5ycU2ReS8VgbsT8rN5ONRV/f8mgDg3oEDOIG7mcTfQyYzxz
 mbj43aW8l7PfGYc1RRYA0JVEfn5MpFZzmquKckqoJYhf/Lm1sZzolW/1iJMBoKKV49
 rHed5CIdAx6gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Aoe++74U
Subject: Re: [Buildroot] [PATCH] package/python-setuptools: bump to 79.0.1
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

On 24/04/2025 20:17, Vincent Fazio wrote:
> This version of setuptools includes an update to distutils [0] which
> fixes an issue with determining the linker command for C++ targets when
> a wrapper, such as ccache, is in the command.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/5f017fca3d708388c9f66afea39b090f0976d496/
> 
> [0]: 
> https://github.com/pypa/distutils/commit/b8c06fffe4b118f3c549fc23d196c2f3d41aa17c
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
