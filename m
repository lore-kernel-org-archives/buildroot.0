Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E880C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1071640291;
	Sun, 20 Mar 2022 17:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8DoYpQ6vCRA; Sun, 20 Mar 2022 17:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A7C040267;
	Sun, 20 Mar 2022 17:06:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B46B31BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F61781308
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oplkTXrUJpaj for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:06:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AE79812A0
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:06:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A68B6C0006;
 Sun, 20 Mar 2022 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647796003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4nHw3X+wIugigghQnIyFfFHSMDFGGgS7H2swE43JAOs=;
 b=mMMssbbyFhDGTm7bSIS7gSPMGQL0/Bg6O8VO/JUZCd73GxyRVGiclTeosv26j96wYAcNmh
 yeFBjFV4g2QFHuFU/B3Kz7hTx5AZB63J2+CMWHFJTkLznXbn/39a3U/QzwVJnCjTeU1B5C
 yKmuiNxDNLs7fyZEbXN8Z8c5p+MxPby3Gt8zsP1w+fXsBzz2W2kVTegRd1ly8hzLbeLvv0
 EiXFgAGS8MvkA3b5u+B9xuN6XNhgvWzxPPwiDr0dlp+Vjh4jAwmimbnObQGQNKxJC0Gvo6
 bEBLe/kL9vBWh0vz3zCHMr9rLfeZwC7gzoPJdF8N8fZ6DrLwEKB+3o+gG+xykw==
Date: Sun, 20 Mar 2022 18:06:41 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220320180641.47f18a53@windsurf>
In-Reply-To: <20220320163930.1566656-1-fontaine.fabrice@gmail.com>
References: <20220320163930.1566656-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/timescaledb: security bump to
 version 2.5.2
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 20 Mar 2022 17:39:30 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2022-24128: Timescale TimescaleDB 1.x and 2.x before 2.5.2 may
> allow privilege escalation during extension installation. The
> installation process uses commands such as CREATE x IF NOT EXIST that
> allow an unprivileged user to precreate objects. These objects will be
> used by the installer (which executes as Superuser), leading to
> privilege escalation. In order to be able to take advantage of this, an
> unprivileged user would need to be able to create objects in a database
> and then get a Superuser to install TimescaleDB into their database. (In
> the fixed versions, the installation aborts when it finds that an object
> already exists.)
> 
> "This release contains bug fixes since the 2.5.1 release.
> This release is high priority for upgrade. We strongly recommend that
> you upgrade as soon as possible."
> 
> https://github.com/timescale/timescaledb/releases/tag/2.5.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/timescaledb/timescaledb.hash | 2 +-
>  package/timescaledb/timescaledb.mk   | 2 +-
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
