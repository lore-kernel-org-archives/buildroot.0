Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC68C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B41D61051;
	Thu,  3 Nov 2022 22:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B41D61051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7w-U7D2TDj9; Thu,  3 Nov 2022 22:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4058761042;
	Thu,  3 Nov 2022 22:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4058761042
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C40AB1BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F40640520
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F40640520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vurorD0l_pu for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:06:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A34540519
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A34540519
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:06:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 25DBD40004;
 Thu,  3 Nov 2022 22:06:20 +0000 (UTC)
Date: Thu, 3 Nov 2022 23:06:19 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221103230619.35364d9c@windsurf>
In-Reply-To: <20221103143414.2624696-1-peter@korsgaard.com>
References: <20221103143414.2624696-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667513181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h22suqukYSD43jQC1hPLqCrYeeaou6dHSi4gusbLXhM=;
 b=XuOyRFLz4lWF8kLwPgLO4+v/75PsD1n59izQpl1PKDzQ+sDZgu8+j9P8SixYzS/akrWfkJ
 KhH7accbPVGVjc50YYbzkBqt7w73saVynBNH2RAOq0XwCWGN5byk5RxS+N6GePQiLPRy6a
 VDvyeiMuP0mh/ejm390N4/FDlNvGti3+Tjop1DinM8F6NID6MpMfyFTqJUT1o6RzZC8nUJ
 Awa5ErQnZloDSp0+UmQV3/Z6bGqErBb8/i9UOcFQWMGwgR1dT6QRGz6nquWXdg+FvMSQHv
 BwPloT3tRKSkv2/q0AnQmKKSCQlhgDLWY8esMHl/GV0nOkNisVpzY/oNuiguPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XuOyRFLz
Subject: Re: [Buildroot] [PATCH] package/multipath-tools: security bump to
 version 0.9.3
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  3 Nov 2022 15:34:13 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2022-41974: Authorization bypass
> - CVE-2022-41973: Symlink attack
> 
> For more details, see the writeup:
> https://blog.qualys.com/vulnerabilities-threat-research/2022/10/25/leeloo-multipath-authorization-bypass-and-symlink-attack-in-multipathd-cve-2022-41974-and-cve-2022-41973
> 
> Update README.md hash after license-unrelated changes:
> 
> git shortlog 0.9.0..0.9.3 -- README.md
> Konstantin Kharlamov (1):
>       README.md: mention libreadline and libedit optional deps
> 
> Xose Vazquez Perez (4):
>       multipath-tools: update devel repo info in README.md
>       multipath-tools: add ALUA info to README.md
>       multipath-tools: add basic info on how to use multipath-tools with NVMe devices
>       multipath-tools: add more info for NetApp RDAC arrays
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/multipath-tools/multipath-tools.hash | 4 ++--
>  package/multipath-tools/multipath-tools.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
