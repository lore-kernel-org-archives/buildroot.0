Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AEFC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 20:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C12360836;
	Sat, 17 May 2025 20:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwPRGK0E1CO4; Sat, 17 May 2025 20:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DC8860B45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DC8860B45;
	Sat, 17 May 2025 20:10:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3934C201
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A19381D3D
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ae_uU4Ph6lYT for <buildroot@buildroot.org>;
 Sat, 17 May 2025 20:10:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B1C781D11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B1C781D11
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B1C781D11
 for <buildroot@buildroot.org>; Sat, 17 May 2025 20:10:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6335B19F5BE;
 Sat, 17 May 2025 22:10:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 17 May 2025 22:10:21 +0200
Date: Sat, 17 May 2025 22:10:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: buildroot@buildroot.org
Message-ID: <aCjtLQWO7iDws1Ta@landeda>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
 <200097a3e73767c60f2633b2f46fccb22c161698.1747241900.git.yann.morin.1998@free.fr>
 <0ed2c252-a279-4751-820d-eb11445eca9a@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ed2c252-a279-4751-820d-eb11445eca9a@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747512626;
 bh=ZSanScmfq5ZXpnU0iYsK8BZ/5+vVZLMM0zoLuALe4k8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lzJyhNZoPPWpreSyEAtyXa1EoV1zK4+VvHRnRuOandDOa198XVspMRF106S2h1iPS
 0XtYuWrr2u8b5igJuO6pU6hBJ//p4i32f3osl+jfzCiY+yeAP2uN9GYEwlnG+hNA03
 IaGynmBWfr1B/cqYbk5cVr+PIgWJ6Us+mDij8B5N/PSLfUZldXUAW+S65Fn6I3hZPG
 NESuN2NC4exkjA6eqvE3EWWHiuwfoBOJYVWhnANHz12lZ1LOF/vvRQygRfI2CIOuqf
 B5VdfoDsY2kZj7OkZy0fV/U2NcdAR//FR6qAJ/b0guakT2ytGrA3ta78sfRASOcpJ/
 2Oz7mLTwh1i8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lzJyhNZo
Subject: Re: [Buildroot] [PATCH 08/13] system: add support for merged
 /usr/sbin (aka merged-bin)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Edgar, All,

On 2025-05-17 18:52 +0200, Edgar Bonet spake thusly:
> On 14/05/2025 18:58, Yann E. MORIN wrote:
[--SNIP--]
> > +	using a merged structuren for the following directories: \
> Small typo: s/structuren/structure/

Good catch, thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
