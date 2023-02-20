Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C88C678D5
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1076822BE;
	Mon, 20 Feb 2023 20:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1076822BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AUjBd9_E8ETl; Mon, 20 Feb 2023 20:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0348E822D1;
	Mon, 20 Feb 2023 20:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0348E822D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 144271BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0F9A4192D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F9A4192D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oPp49mdSJh4l for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:46:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AB05418A7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AB05418A7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:46:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A8F9EC0006;
 Mon, 20 Feb 2023 20:46:53 +0000 (UTC)
Date: Mon, 20 Feb 2023 21:46:52 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220214652.029e413b@windsurf>
In-Reply-To: <20230220092516.17774-1-fontaine.fabrice@gmail.com>
References: <20230220092516.17774-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676926014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AnlbpT35tv6E0zrbPEAsvjPi9x66UzQL+eZoEVfHeic=;
 b=SYf5p/TH1XqPBTrtUmuFtY7msxDr76jmo8dv3hZx4Dpl0yJgFndPurTEcUjwfWRvG0pjqy
 55ZtEd2T8dKwDohmapRu+QfArW7wJ3LN2bxOdRt/EXtFwySHEIQeYErsFMP1c2IWk+GHjw
 bLfU0kp1/V6MONY4KzXTg6peBOBRbFO7I6ev9kRTKH4bo878M73cGYbhUQJbXxGyha9wTB
 rp6JKrhDCwsM177VtxGupdx0FzsNMALkbPRQQatvkXi1jQTeTD8XgOt6NE2cX0gp3JaE9O
 DSLS9QeVXAF3OfeoNDy0aMjPsUNjfXdzETMo/8QTE2EtuUbHPxkkReF7C2B+kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SYf5p/TH
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/modem-manager: needs dynamic library
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
Cc: Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Feb 2023 10:25:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit d769cfc13f6c2544f8bc5b6339d23763319a2383 was incomplete as
> plugins/meson.build still unconditionally calls shared_module. So add a
> dependency to dynamic library to avoid the following static build
> failure raised since bump to version 1.20.2 in commit
> b95334b71fbdde0f7621b58ed35fa98df9e0966d:
> 
> [238/417] Linking target plugins/libmm-shared-telit.so
> FAILED: plugins/libmm-shared-telit.so
> 
> Building statically could be enabled back through builtin_plugins as
> soon as
> https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/commit/1c4da332ee6e0d948f85a63f74cb27e89075c011
> lands in a stable release
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/deb2a752accb021392bb9dc3d06b2b1bf151535c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Aleksander Morgado):
>  - Disable building statically instead of disabling all plugins

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
