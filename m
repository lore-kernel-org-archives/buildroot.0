Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E966ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C5D812C3;
	Sun, 30 Oct 2022 14:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5C5D812C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ZuKjUuVCUf6; Sun, 30 Oct 2022 14:03:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D78C781292;
	Sun, 30 Oct 2022 14:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D78C781292
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2106A1BF489
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F149060034
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F149060034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rf5X87AiQf8T for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:03:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D18160ABA
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D18160ABA
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:03:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3EEB8240002;
 Sun, 30 Oct 2022 14:03:19 +0000 (UTC)
Date: Sun, 30 Oct 2022 15:03:18 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030150318.45f4f1af@windsurf>
In-Reply-To: <20221030125358.387628-1-fontaine.fabrice@gmail.com>
References: <20221030125358.387628-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667138600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+uCLYIMUuhJgFuam+EVaJUmBhCgU2AzkzdgzF9zdDg=;
 b=EBUhIAl/vDm2ghmrzAFY0RU3nLjZupLmLJfkTJLgBqZdgtB29qxoWlYMmb93K/9A8OLUED
 UdstKvM+a0ZTEmJUZNu+4hhPvsYtVoClqqfK39H+gJvG+Orc03fEYBAQAL2U+5l6Y0ofiD
 Sv2Cd1eDtBwVYHubt+Qznml5iyL5UuVGftwZUlcofBdPwNOFErJFGq3mHRujin0LfWNnXG
 JXq/gRkBPs8YyYOmiIlAmYHFkXr4/grcXvNesP5ydMXFu0r17mbvVxcoqPsl0g0xhjYeU2
 imckJQdfLrbr3K1lUDQwDHpWHBcdXXKp0GZwgrrdZE4OpM/wH/ADQIWdmc6UbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EBUhIAl/
Subject: Re: [Buildroot] [PATCH 1/1] package/kmemd: needs headers >= 5.14
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
Cc: Tobias Waldekranz <tobias@waldekranz.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Oct 2022 13:53:58 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> kmemd unconditionally uses BPF_PSEUDO_MAP_IDX_VALUE which is only
> available since kernel 5.14 and
> https://github.com/torvalds/linux/commit/387544bfa291a22383d60b40f887360e2b931ec6
> resulting in the following build failure since the addition of the
> package in commit b3f915c6561bcb2f7952faca3bedf1766f299538:
> 
> kmem.c:36:17: error: 'BPF_PSEUDO_MAP_IDX_VALUE' undeclared here (not in a function); did you mean 'BPF_PSEUDO_MAP_VALUE'?
>    36 |                 BPF_PSEUDO_MAP_IDX_VALUE, 0, _idx       \
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/dcd7e6321d64746b8b867fa3f32095d1180a40fc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/kmemd/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
