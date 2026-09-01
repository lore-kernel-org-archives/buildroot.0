Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BB1C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 22:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3A574079A;
	Tue,  1 Sep 2026 22:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84nfTawdicrS; Tue,  1 Sep 2026 22:00:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788300058;
	bh=ObjHi3g7xV8WINOoU5OCzF6Bm/eQCY+b7loZsiRmDaQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WfOwzkX0uknOUy+KiS4ng70MAgw0CUbNWOZC7FpxKa+FZYwJZEoMpNCmKadjs/wf9
	 K3PKssClBffaoSSKAiFcDoF/IZLmY2Xtd+JYXGqobtpOyQwLy0ZotLMXI9f5kvRpfG
	 vuxk9rmg8EeyXJ9W8RErfiHCPNRAc3H1OVpamxcFyhOzOYCCtVGAVw94oNHAPDeze3
	 ghcfjMMShz9M9ZpjjfhuEpjHV7zBoUSZZQQx6HphQApIZ+ENnvLeyrBhkbFZV9lqWq
	 9Z0ZfXJm/MC05PrWHPx6xrjpf5e+3HlvSnHZj2T55u8sPcO2yUWOIgKqtjGEF0ZB0o
	 QmWGjYmJnzCNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB3DC40793;
	Tue,  1 Sep 2026 22:00:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9880D498
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 22:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EA6660649
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 22:00:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chiRg9BOqxlS for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 22:00:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90414607BB
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 22:00:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A864913F899;
 Wed,  2 Sep 2026 00:00:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Sep 2026 00:00:52 +0200
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 00:00:52 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260827212125.1988552-3-romain.naour@smile.fr>
References: <20260827212125.1988552-1-romain.naour@smile.fr>
 <20260827212125.1988552-3-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.18
Message-ID: <f9a5e16856c560ec8b1152cac8952ac4@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] board/qemu: add xtensa kernel patch
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

On 27/08/2026 23:21, Romain Naour via buildroot wrote:
> -fno-stack-protector must be passed to avoid linking errors related to
> undefined references to '__stack_chk_guard' and '__stack_chk_fail' if
> toolchain enforces -fstack-protector.
> 
> Fixes:
> https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/15876432953
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
