Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F95EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0733983EF0;
	Mon, 30 May 2022 20:27:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltcBtlezKaMJ; Mon, 30 May 2022 20:27:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C65B83EE7;
	Mon, 30 May 2022 20:27:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC5FE1BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99DD641B4B
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfhII7thhsy9 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:27:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36D8A41B42
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:27:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5BA1FE0004;
 Mon, 30 May 2022 20:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653942448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugHPX3ri48lqX7fBsLnR7sX0+VgzYlhzmmk8TbJeM0Y=;
 b=bj2KzDAq5qyfh4scWqcKgFL5Cx962M8fSDG2JoDVGeF1wTOghpqEo2t4sVdBLYF9L4y/1P
 py6xPJZX4mbeiUxX53uvYxmUE6l5IUvEO1LX9rvJaaX9GE8z50IkLPVzu5gtQJVaeAVGhI
 6MKi3+CGXQktMmBTeFHF8uj9lhrcPU1++wGzckFVBxPcSFMxGy6vkkesxNqXag7su2Ri7v
 GgK5L1i3NIdjyKVSPQo8YjM7lcH3Iu4E0LzwLLo8vRJJrcmjDKD1Q+u9pJKhiaEZDTr5BN
 LM3CG5d+XHUNxFnNR+CvmaJfU6QyA+BkI01m1M0IM8IxZj89WQzT1pHIMnxYGw==
Date: Mon, 30 May 2022 22:27:27 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220530222727.0c5fa991@windsurf>
In-Reply-To: <20220521152824.894631-1-fontaine.fabrice@gmail.com>
References: <20220521152824.894631-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rsyslog: security bump to
 version 8.2204.1
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 21 May 2022 17:28:24 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2022-24903: Modules for TCP syslog reception have a heap buffer
> overflow when octet-counted framing is used. The attacker can corrupt
> heap values, leading to data integrity issues and availability impact.
> Remote code execution is unlikely to happen but not impossible.
> 
> https://github.com/rsyslog/rsyslog/security/advisories/GHSA-ggw7-xr6h-mmr8#advisory-comment-72243
> https://github.com/rsyslog/rsyslog/blob/v8.2204.1/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rsyslog/rsyslog.hash | 2 +-
>  package/rsyslog/rsyslog.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
