Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EFBC79F99
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 18:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8844660688;
	Mon,  7 Sep 2026 18:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLS8YxIbEBby; Mon,  7 Sep 2026 18:38:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A13B660662
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788806333;
	b=ABfCXSNO1VuAdHesoaWGf5hqgv1TJ/0IGy0+IC5KulbVbb82dqOjc4XiKa2AKJOsU7WI
	 JmeXUxcmOgg0KUM2aegqkErY+EYdR9zpsPru+RP0v0KLqvZlM4tKhBGkNZvVsKPyl29jd
	 FC44PvUeJqAaM+akOHQSTl+SiecOmPdH7e2Nxjs1yNZJ+rlL781us3k4nTQ30FUxvWPL+
	 oyYtFlCapARbZYzbgJ6xUgJ8gCkah981kS+RwO4KtGeY7QG/IeFVLLFowxe2YNOgVWZcr
	 IPniFrUIXMARyBZCwEGxqb9CsQtT0gUPXHvUqLUUdspuzmE6qoAs1sMTTVKdwreTreQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788806333;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=fI6IYZksfX/an+Ly+R07c8QFdnZDw8hkQPtyWyZxUbI=;
	b=o2mENarf6F9kg4/HFKwC7k8P/J386wuEeXrQ2B4Zjm75FIOsyGz3TQIjKCCFvTFvqCYt
	 qAmyG6FbePYthKllgug0HW0hDxdSyP1GlonISmXoG8HOSJ70P28djG9dUUR8aPAYs+Zua
	 7ZDbPa/+JRD4Lwl3uSvH8a///MDRDpjdEjuQqVarBXlImxFsR0QuDEqFZPGlxQf28Dh9/
	 eTiiDMIyjoZ70aacV9AkbvkoFfBNXAg26yAaAiln6DTOU6EdViruglpbo88YxMMu8Enir
	 ob/Wz+CelzStPHDGkCH4w3JKvpJuh5xEAQy9U+ksqvasx2g8GMSjwlwhmTXo1UWxCrg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788806333;
	bh=fI6IYZksfX/an+Ly+R07c8QFdnZDw8hkQPtyWyZxUbI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qZ82HQvmwenRRNr5PGlC/U4gwXFwvpuupdO3XiqFKMhLYrZcIUsQy2cPio+CnSkHe
	 D1IXjj6QA9ymF860D8Z/DZ9rcLDKAU2P2sAYxWpcaU3Uj29yAaVIYhoiYS13sAGHJI
	 DkPJ7TDrpuXhbnICd14Nox6SLJLvyUIJsM3gEyjzhZZDQoDKQsjBPziNGbjDR9EikX
	 bLSb4v7fVt60+OXIzNbrAIyMXIIc26Lt1LVzTGCA2bdBpHSvkWvTYe3w1q2TT/tYSG
	 +yW+xmfRpIzro0b7ro5KMd/S57kI3BRCc8eAceOQm6JP7n/jR0vUgHarrfYRuSddtQ
	 5QkqxKssPCWqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A13B660662;
	Mon,  7 Sep 2026 18:38:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD9499CF
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB31D60662
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHL-SdBZMH0M for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 18:38:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9B4D6605F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788806331;
 b=n93g7RZYiZsS6bn6mnM8ABgKSpHHqEDe9GRr2TZR9GHWCvYM+xxmspyT94NAOJo4Yr5A
 FnQ+3+/05OTUbRs6/P4k3/v1u+ELEhmCYWMNQYaGOcWjfpBlNCTIiGrR6faxbQ9PNCN4w
 peG8ejgTBlifbzZStdBhdJd1EZZq/BGzinGtITE5EzBhx9W9t6MUixiU4I4BD81jKA8iz
 hQMW4Fhmcjagkg5Yl95m8/nLLACG5y3eyBdAWmvMUeYn9nj6BvRyICgD89fApdGvzFZLI
 xbvZQA+ZSR495e66fWDhx67nQy7GWjv0PDamD8h+CtCJOKfoCMzTI+qLGT123l9Vqvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788806331;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Cmp9c87OpzANh5Ec9pBlmNil9hJtUt8B5lYXkQQbx4Y=;
 b=cH5SvJZsDSgF6bg13pZtHBPcoIORe7jxtZGrBfJcQWOw3RNOHoxs1S3FD00dU1RgAGQ0
 A/wF7WYTLGK6pt6Ye5DPr8VWWGadEo653oRNQ3AJtFrJxLzo92T4rBJj94JHKMykELo26
 gnujIuaR9R6GLvDjjHMJCaJQEAW5wvs+6MvqGwFEiNz/xN6m+2KRCLQk3zK4sIVKIo0jm
 lcEGPacMBPbIEUbKKMbrHodG1Teodae96mmWYwsKJJ+j2oKo/lW+FOiWAjhKqLyKNRJ2C
 vJs3hUui7Z64lL04HDmWUAleNgftz3YxBwrhrdIBh4aUn1Gl+N9XFdXfrAlGfMVSJ0g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CzuRcCfW; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B4D6605F5
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:38:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B38F52003D0;
 Mon,  7 Sep 2026 20:38:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Sep 2026 20:38:46 +0200
MIME-Version: 1.0
Date: Mon, 07 Sep 2026 20:38:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260907173925.3802484-1-bernd@kuhls.net>
References: <20260907173925.3802484-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <372e8db913300e6828ee1dee107f20a8@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 6.18.x, 7.2.x series
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

On 07/09/2026 19:39, Bernd Kuhls wrote:
> Update the latest kernel releases to:
>  - 6.12.108 -> 6.12.109
>  - 6.18.49 -> 6.18.50
>  - 7.2.3 -> 7.2.4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
