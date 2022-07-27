Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B7DC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 800958194C;
	Wed, 27 Jul 2022 07:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 800958194C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kq4OO0Fg-bb9; Wed, 27 Jul 2022 07:41:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB4A8817AD;
	Wed, 27 Jul 2022 07:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB4A8817AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0961BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1846160ACC
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1846160ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hzvcRzNTd7o for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:41:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 123F360AC0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 123F360AC0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:41:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D9CB1BF204;
 Wed, 27 Jul 2022 07:41:33 +0000 (UTC)
Date: Wed, 27 Jul 2022 09:41:32 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727094132.4311d70e@windsurf>
In-Reply-To: <20220727062731.4011-1-fontaine.fabrice@gmail.com>
References: <20220727062731.4011-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658907693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RAcdU6AqJXTy6Yys8UdhWXcDIehWCecMF+H4UiLirQ4=;
 b=RGmPTBPM0B+EUTL7DTwmfVySwc+ipqlRBazAnTW+1gRbQlxvxw2A7kcWF/D4cgbuOr/byd
 YG3Hq2krwNss5OPqpuSLyJ1sHlnwnrqEtmVI2jIX+72iDv4gGwkV+0FsYj4z879jVDuAmg
 Pq4FTDEce7rkKSXjDyV8Y9U21YrVU/8hfrXQSmQGzz0MUl75jjTRl4cLWFHMX9yrLGlSs5
 JX4bIZIGMjwurW587/piX8+KLWBYrIj9RJ+w0Hlm0qXT2kpoQ4VuBr+Nt6Lavh6DjYvgiH
 W3Mjr1hG2eZoY8PTIHtOlJ5RuE9KzGbH6I2mN/oN6FpWJdQafXincPR8JSLdXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RGmPTBPM
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: simplify alsa-lib
 feature selection
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 08:27:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Instead of having the user need to figure out that 2 alsa-lib features
> are needed for pipewire ALSA support, have the top-level pulseaudio
> option select the relevant alsa-lib features, when alsa-lib is enabled
> as already done for pulseaudio in commit
> 97cd3680a4cc4bc0c71bccccb1459eda4b880159
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pipewire/Config.in   | 2 ++
>  package/pipewire/pipewire.mk | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)

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
