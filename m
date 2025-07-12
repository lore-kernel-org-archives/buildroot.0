Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA5AC83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 11:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A34D981F06;
	Sat, 12 Jul 2025 11:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43Tm8A8Q-zTv; Sat, 12 Jul 2025 11:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F230381F14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F230381F14;
	Sat, 12 Jul 2025 11:01:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B1B81CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0182181F14
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fDsVJGcmt3y for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 11:01:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 561A081F06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 561A081F06
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 561A081F06
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:01:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2C96519F593;
 Sat, 12 Jul 2025 13:01:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Jul 2025 13:01:25 +0200
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 13:01:25 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>
In-Reply-To: <20250711173633.20222-1-fl@n621.de>
References: <20250711173633.20222-1-fl@n621.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <1375430846b28265670ac97b0415743a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752318088;
 bh=+nnfBB/IMGqpzgKzjpyCbai83IR/2BoaC0Q0Bjv43q0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NPWxCFwf0HUj+pQo2XuKutj1Z++d1oG0B9DjOnXhiL2Pg5T84lcJX+CD3LMOUMkfm
 tqaObtnSYold/VqfmRSlGG5gXGlQMygZ5bn7ntK6J+J+N5Cy7uYoN/bxqyHfx1oZxY
 ZsbG22YzEoeHHL9QsCJ2iQk+QW3dLyNKOE6Yo9wnKvLneN2evzix1rOJi/cKQGnxrc
 BHiCHhfUaKqHq0fN9bj+8f2oVxW/+pH3dpbwgobwzfPMMbxuRSNlsUUrDqJtZWnJ+c
 nHoeE0dKqHseIv3n47/+lpFGVVP5JEyANrdDX5XlauPt1M21rHtC0JLI1nsE87vq2L
 PBfnWaiaawMPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NPWxCFwf
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: add support for
 pulseaudio
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

On 11/07/2025 19:36, Florian Larysch wrote:
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
