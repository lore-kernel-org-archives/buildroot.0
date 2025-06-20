Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E613C7115C
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 19:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 002A360698;
	Fri, 20 Jun 2025 19:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2s078mCrEkEA; Fri, 20 Jun 2025 19:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DF0B6074C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DF0B6074C;
	Fri, 20 Jun 2025 19:26:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACA61154
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 19:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9244B80CD5
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 19:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oslm8h1ml_y for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 19:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BDC480C9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BDC480C9E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BDC480C9E
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 19:26:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1063019F57E;
 Fri, 20 Jun 2025 21:26:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Jun 2025 21:26:06 +0200
MIME-Version: 1.0
Date: Fri, 20 Jun 2025 21:26:06 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20250615161957.2499823-1-bernd@kuhls.net>
References: <20250615161957.2499823-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7488e23526fedf0e899494d9f3c6b1c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750447569;
 bh=fcGgHXBbdPFJ8OMrpT2r5C8QxNpwNduJHa25j2P//VE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tskMZP3vSObFT/uIDwm3an/wCGYUgHq6we5wi1kf0sawPaOLvbsMj7BTeq/nXwzSz
 N9AXxyuNyGIV4S9dkku54VuSWOPXcd6S9M8zkQOve0Su0gzZ10HHLbnqOJodj83nUo
 fiLBVkJ/qOdjDqesrsmp9HvXD9mqYz5WsM5N3bx4SHk84SzeIhH+w1/x4px8STd0AS
 7v/i3JDmnztHSQ/SD+RpAntQno/S/M4fULu7MazGPxXR0vTHtIC32c4o0TCH7MW/jO
 fKa8LBDIT7Lvz+PY9LJ9z7q798YHUr89DcqfurfPslBEZuOi4y2p9JWVcIaZE0Z2dl
 2F4Mj5DclizFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tskMZP3v
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.8.2
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

On 15/06/2025 18:19, Bernd Kuhls wrote:
> Release notes:
> https://mesonbuild.com/Release-notes-for-1-8-0.html
> 
> Updated patch 0001 due to upstream commit
> https://github.com/mesonbuild/meson/commit/4fa52925459dac650bf053715987ee7beb3b23c1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
