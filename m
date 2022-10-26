Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DBAC433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 11:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58128404C3;
	Wed, 26 Oct 2022 11:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58128404C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nYNYaslQ33rN; Wed, 26 Oct 2022 11:58:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BFD1404B2;
	Wed, 26 Oct 2022 11:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BFD1404B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53EB81BF59A
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 11:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F75060BFD
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 11:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F75060BFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6k2yQcZpAqwD for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 11:58:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECE0E605A1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECE0E605A1
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 11:58:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA7622000E;
 Wed, 26 Oct 2022 11:58:15 +0000 (UTC)
Date: Wed, 26 Oct 2022 13:58:14 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221026135814.1272a014@windsurf>
In-Reply-To: <20221025223804.583594-1-fontaine.fabrice@gmail.com>
References: <20221025223804.583594-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666785496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+oUcbwY+ExXvbCwSinOugkwGN9MvXrGsJ8cipyAx+0=;
 b=nH+b8WyCumApuQjbBZKrSCBdhtcNPX9zWGqVZFZsa56sweAbA2mDXNHtc3eK1rxsqpc1G+
 oSpehPGzglyteOGIRC6Ig+08mu4FWmu1QDk1nNcCCUA/NHHtoygogT98J0n8dS9ZqTvWUV
 xDcHwbkjPjhM6UOhH18wet7oBpsvCHh4x4NXBrFfnZYIezDH9zeWocx1hoxyTljY3QPnZl
 oyjme7UT480qlE5B9ovq3Ld+V5GoTU36Lpqn3+7YeYdtnKT9+mw//5aztGWmoOsHPuE1Ap
 9a02zOhyOarDQutgLB2GKvb7sFxjN6mfa5RBC/DKjLrEeOBK+FByPueOl9J2hA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nH+b8WyC
Subject: Re: [Buildroot] [PATCH 1/1] package/file: fix uclibc build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Oct 2022 00:38:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following uclibc build failure raised since bump to version 5.43
> in commit f17b56f1aa43361eff4a81538a61e34c509ebb70 and
> https://github.com/file/file/commit/c80065fe6900be5e794941e29b32440e9969b1c3:
> 
> file.c: In function 'fname_print':
> file.c:605:10: error: macro "putc" requires 2 arguments, but only 1 given
>   605 |    putc(c);
>       |          ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7ff1dd9f79408d2e6286c005302b6f3c505ab259
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ile.c-fix-build-without-wide-support.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/file/0001-src-file.c-fix-build-without-wide-support.patch

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
