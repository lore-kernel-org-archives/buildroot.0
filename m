Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962B2C021BB
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 19:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28CE760704;
	Mon, 24 Feb 2025 19:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PQwEgHS8Fie; Mon, 24 Feb 2025 19:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 244E260787
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 244E260787;
	Mon, 24 Feb 2025 19:21:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2505694E
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F40F7408E7
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsm9lqRMjDwJ for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 19:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39BD5407F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39BD5407F2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39BD5407F2
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:21:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7277119F593;
 Mon, 24 Feb 2025 20:21:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 24 Feb 2025 20:21:01 +0100
Date: Mon, 24 Feb 2025 20:21:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
Message-ID: <Z7zGncTqYA6oGYpm@landeda>
References: <cover.1740345268.git.yann.morin.1998@free.fr>
 <0b81afc88de83cff85611098eb06873eed0b997e.1740345268.git.yann.morin.1998@free.fr>
 <997d02c49eeb32e2443f7226f92abd62@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <997d02c49eeb32e2443f7226f92abd62@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740424864;
 bh=YO+M5gobdrF0OCcgu7Wn5hLFFgIIYg5rP0kUcmQ5Uv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bWNhgmE9gTQ+9ho0XkPBiyTtU1c+P1NU0VqGdtjU4Ob2ujhrw1Zviu6/qLIYwHqVY
 SXfOKj6KW4ruz4DkEY693Im/3xcyX/7oND2eYxv07B+5NESPfvd0gzzH5UXcYnKqu9
 8Xfp1vbqgXWHhkfzooX6fLXBCMqoDzKJiBsqQnSMRHtriDy16jIm4kQk/osB295UBM
 KAm/a03/tWF0LY076+oOnC81f40b0qdw13M9RSO8qRwZ9GaT8AWv8yLCTD5OVPwTDE
 RtXLomwW6k76brugMcpYWp6Ah6eP6/NsN7a4S+wdwmGN52kyugQZmJPBXc00TCyqtK
 RtbQKIEpDkQ0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bWNhgmE9
Subject: Re: [Buildroot] [PATCH 8/8] package/podman: new package
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

Julien, All,

On 2025-02-24 00:02 +0100, Julien Olivain spake thusly:
> On 23/02/2025 22:14, Yann E. MORIN wrote:
> > Podman is a container manager not unlike Docker, but is daemon-less.
[--SNIP--]
> > +PODMAN_VERSION = v5.4.0
> > +PODMAN_SITE = https://github.com/containers/podman
> > +PODMAN_SITE_METHOD = git
> I have the same comment as for netavark:
> I noticed the license information are missing for this
> package. I'm thinking to _LICENSE, _LICENSE_FILES and
> license hash.

Ah, damn, I was looking at my series and wondering what I had missed,
but that completely eluded me...

> Could you add those info please?

Sure thing, thanks for spotting that!

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
