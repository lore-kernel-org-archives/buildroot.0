Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6877C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 16:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98A6084CAC;
	Sun, 12 Dec 2021 16:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ISpbn7yYW66Q; Sun, 12 Dec 2021 16:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3BDC84CA2;
	Sun, 12 Dec 2021 16:01:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 725A91BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 16:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F9E7429FB
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 16:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9uyd-iIHnDzP for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 16:01:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80C88429F9
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 16:01:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccde:e15f:6f40:89e5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3869C2003D0;
 Sun, 12 Dec 2021 17:01:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639324870;
 bh=fxhxCPFMiu8/55RoSE2kKLSjjzGEw7UkuBUG84/hM8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TtOTjszRKzyvaMLAlv5IbbUswNtcHjFeUnd3krrmAuA+Q1G4nKs4QfwTU72zIEur5
 bfIjllFZV8/jGlsY+YuUJTKYG+BCKrOEsrQw2ibkbLSfZUYGUHq+Y91Tdfl+/fTns9
 7+dimUP+6bWYE7gNRdkwi/ZOpTF1AiujxpjYYfDm/6AsFsrLdCCFuzLtD8N0D4r0vH
 bZwdD0eGbPp6KDxCNx1c1jGPfA8s/AbjrAjS17hKBMzUSLksbJxRsC8fw2IzGQOk6v
 5u6q4PhbMfZ0VzsL8mQxsyWzwmMXtytjQ901BQE4wf1Gp3FNf60wvMNisCbWArxnoX
 IbF6OBE0rfkoA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Dec 2021 17:01:03 +0100
Date: Sun, 12 Dec 2021 17:01:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211212160103.GZ2603@scaer>
References: <20211212090552.389346-1-bernd.kuhls@t-online.de>
 <d8c8ae3e-8cc2-b67a-f7b4-fcf3a267fd23@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8c8ae3e-8cc2-b67a-f7b4-fcf3a267fd23@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dtv-scan-tables: bump version
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2021-12-12 16:13 +0100, Arnout Vandecappelle spake thusly:
> 
> 
> On 12/12/2021 10:05, Bernd Kuhls wrote:
> >Changelog:
> >https://git.linuxtv.org/dtv-scan-tables.git/log/
> >
> >Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
>  Applied to master, thanks.

Arnout and I stepped on each other's toe when applying, and Arnout ran
away before he got the opportunity to push the patches he applied. So I
did.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> 
>  Regards,
>  Arnout
> 
> >---
> >  package/dtv-scan-tables/dtv-scan-tables.hash | 2 +-
> >  package/dtv-scan-tables/dtv-scan-tables.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
> >index a57409978f..8d4290fc53 100644
> >--- a/package/dtv-scan-tables/dtv-scan-tables.hash
> >+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
> >@@ -1,4 +1,4 @@
> >  # Locally computed
> >-sha256  fc65b1f85195ab3d877f7ce802dc62b8c70b3a1815fa6e6a69de19a9d354c19a  dtv-scan-tables-6d019038cd04e837d9dd58701202c15924c1c654-br1.tar.gz
> >+sha256  186a6fe1755d83d583590de3f83013c2e4df47b258c88180dffd1afb0d36d4d6  dtv-scan-tables-25ee9e0ce4bbacdb278d4cff306ceb6528c4f548-br1.tar.gz
> >  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> >  sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
> >diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
> >index 5fad615b6b..4150abd1a0 100644
> >--- a/package/dtv-scan-tables/dtv-scan-tables.mk
> >+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
> >@@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >-DTV_SCAN_TABLES_VERSION = 6d019038cd04e837d9dd58701202c15924c1c654
> >+DTV_SCAN_TABLES_VERSION = 25ee9e0ce4bbacdb278d4cff306ceb6528c4f548
> >  DTV_SCAN_TABLES_SITE = https://git.linuxtv.org/dtv-scan-tables.git
> >  DTV_SCAN_TABLES_SITE_METHOD = git
> >
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
