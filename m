Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0932AE748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B84F481E1E;
	Sun,  1 Oct 2023 16:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B84F481E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zz9AxIMhX3T; Sun,  1 Oct 2023 16:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F185981E08;
	Sun,  1 Oct 2023 16:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F185981E08
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5C061BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB59640291
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:40:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB59640291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ggC1raiY6GM8 for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:40:27 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FC1140290
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FC1140290
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1568060003;
 Sun,  1 Oct 2023 16:40:23 +0000 (UTC)
Date: Sun, 1 Oct 2023 18:40:23 +0200
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20231001184023.166b3941@windsurf>
In-Reply-To: <20230725173102.543874-3-sebastian.weyer@smile.fr>
References: <20230725173102.543874-1-sebastian.weyer@smile.fr>
 <20230725173102.543874-3-sebastian.weyer@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696178424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7AI0LuWFhjetTxyldgGVxm81/0mezqU8gbd6V/lamdM=;
 b=OkJEn4Q5GJEoZYkE8lFsx/biH1S4v2E3+SM1q2VpnTfDjvpBXIx55H9uN20BJkdjhJiG5U
 yxXorksa87uHn0+q0GSWm8CGF4RyMClxuAJKg0mP5iGkTIXs/NXfprCM/1/PsCkxH5/q3Y
 FJF8xO4oBeGNbs4pAQtfTIDWn952nwGxcpQKtgG5al9rrb+j2yBJhXd/o9DSn9h+N+96jE
 njcd8dLTPd7c+5ab8STSzIPq0siGLNx0dGJGmNlX/n0ZeU8rM0pD6gpQoqC0xYYM5EOVch
 ZR8cFBcz3Jg6wi8PrPTzCE2LWMyMqyDIFoxAuvDs7cf1eXBVTfifN4TB3iD6VQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OkJEn4Q5
Subject: Re: [Buildroot] [PATCH v2 2/9] package/llvm-project/llvm: add llvm
 dump support
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Daniel Lang <dalang@gmx.at>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 25 Jul 2023 19:30:54 +0200
Sebastian Weyer <sebastian.weyer@smile.fr> wrote:

> From: Romain Naour <romain.naour@smile.fr>
> 
> LLVM_ENABLE_DUMP required by mesa3d rusticl:
> 
> https://docs.mesa3d.org/rusticl.html
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/llvm-project/llvm/Config.in | 6 ++++++
>  package/llvm-project/llvm/llvm.mk   | 7 +++++++
>  2 files changed, 13 insertions(+)

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
