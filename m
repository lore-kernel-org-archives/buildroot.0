Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6930C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DA7A81CEF;
	Sun, 12 Mar 2023 09:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA7A81CEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eC1CXxrzCfXE; Sun, 12 Mar 2023 09:58:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0DD081D68;
	Sun, 12 Mar 2023 09:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0DD081D68
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A63A1BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2527413D3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2527413D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCTPkXCjOp8d for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:58:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83F10410E3
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83F10410E3
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:58:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 44ECA100005;
 Sun, 12 Mar 2023 09:58:45 +0000 (UTC)
Date: Sun, 12 Mar 2023 10:58:44 +0100
To: Luca Pesce via buildroot <buildroot@buildroot.org>
Message-ID: <20230312105844.2238d7dd@windsurf>
In-Reply-To: <1678456111-30786-1-git-send-email-luca.pesce@vimar.com>
References: <1678456111-30786-1-git-send-email-luca.pesce@vimar.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678615126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9Bq+ky1iDEh/kNkZAEFomK0SKJisHfBjALp4PtxaYI=;
 b=LQVJovwkyyEqlqtyVQwS/plmQ0fStKGHYvyYAbG8joi/9YZsgMadO4Vqe1i1IoAArVppDO
 QjFTLviqguFlybLuyF73ogk7vqSffwbP5CCgkU8w168D0ARTS1iS/HyXUQhQ3To1Ezpc3V
 qXwYI+D6PO3+K3l/k+5M13YZ7V9irgIDf9su1D211kRjGzTspIa9EiQ1sUJWciiBDwkxWL
 rcY6/5YN71SxVXlzH/zTPsZqU6jCad0EX0gTHwJmMSdN/54tgknI3B9rKwNmyDYHvhnt+M
 YoVrlL2a0Vp/K/KaRQBDPkCq9MHDWLMz32ygUVwm3QjFwkDz1bbernomQO2Rhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LQVJovwk
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: enable libev and
 libevent support indipendently
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Luca Pesce <luca.pesce@vimar.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 10 Mar 2023 14:48:31 +0100
Luca Pesce via buildroot <buildroot@buildroot.org> wrote:

> libev and libevent can be enabled at the same time since version 4.1.0,
> thanks to the event lib support refactoring into plugins, which is enabled by
> default for unix platform builds (LWS_WITH_EVLIB_PLUGINS=ON):
> https://github.com/warmcat/libwebsockets/commit/c6c7ab2b4498c62bf9461b36395d8466e023575d
> 
> In this way, libwebsockets can be compiled with both libev and libevent
> support, which is then user-selectable at runtime.
> 
> This basically restores the behavior changed by previous commit 27f257e.
> 
> Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
> ---
>  package/libwebsockets/libwebsockets.mk | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
