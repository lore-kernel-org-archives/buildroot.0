Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4BFC28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 13:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09B42605D4;
	Sat, 15 Mar 2025 13:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQeq52Koiu4o; Sat, 15 Mar 2025 13:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15EA1606C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15EA1606C0;
	Sat, 15 Mar 2025 13:53:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2945EA
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 13:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF5B040947
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 13:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TkAIvyaE3PgJ for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 13:53:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F29140B97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F29140B97
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F29140B97
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 13:53:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4669313F86E;
 Sat, 15 Mar 2025 14:53:40 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Mar 2025 14:53:40 +0100
MIME-Version: 1.0
Date: Sat, 15 Mar 2025 14:53:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: Andreas Ziegler <br015@umbiko.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250315103547.1083333-1-br015@umbiko.net>
References: <20250315103547.1083333-1-br015@umbiko.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <08a08980c182a0ba4ad445382eab1105@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742046821;
 bh=pSdyGEl1PWNCoVrVkXkttUkN+GCOKuFJHgszRFeb/QM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qk3TyKFg4OYr3QtQtaGLXtBO4Naiw4OrgQObUttXOxHQiu8FJ6Q6zZslazzDJVlYz
 RKaZ8i1udwL7Mh5ks0rLGUrSwColGcfDMUGdZbLOUHoyAbrYPf5EcOHq3Ews1XFCoc
 +5gV9nQumgN1x5+CSvIuoMie2TSxvaYvyDvpmEXJFrXGr4X24njMB+lbCFkEOA0sem
 MXLtYpLwA4Si+IkQfCqec3f+Qz3LMnw3F56Xx15TefX4m4b8UpOQ5xGi6a88IS3XyZ
 R0tZqwEppFV1Nfusa5E6ekj9R5w5P/yornFXp+oCLnnfgmgYWRlDw9JkQxc2wCQUxB
 cJg6VuRrhjUXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qk3TyKFg
Subject: Re: [Buildroot] [PATCH 1/2] package/mpd: remove spurious host-gcc
 dependency
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

Hi Andreas,

Thanks for the patch!

On 15/03/2025 11:35, Andreas Ziegler wrote:
> mpd is not intended to be configured as a host package, none of either 
> the
> direct or the optional dependencies of mpd have a dependency on 
> host-gcc, so
> drop the dependency on BR2_HOST_GCC_AT_LEAST_8.

This host-gcc dependency was introduced in Buildroot commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/6ed7036464541e06b241a5a71d3e39d932410ddc

It seems during the mpd build, this host C++ 17 string_view is still 
used:
https://github.com/MusicPlayerDaemon/MPD/blob/v0.24/src/tag/GenParseName.cxx#L8
https://github.com/MusicPlayerDaemon/MPD/blob/v0.24/src/tag/meson.build#L12

It's also still used in v0.23.17. We can see the invocation in the log
when compiling with "make V=1 mpd".

So I think this host dependencies should be kept. Can you confirm?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
