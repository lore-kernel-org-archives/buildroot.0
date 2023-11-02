Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C391DC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 18:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 609DF4F050;
	Thu,  2 Nov 2023 18:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 609DF4F050
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbNWxYr0VeU2; Thu,  2 Nov 2023 18:05:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D226B4F051;
	Thu,  2 Nov 2023 18:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D226B4F051
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 715481BF861
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49C914F051
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C914F051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQlYMQCMzIF6 for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 18:05:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F8474F050
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 18:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F8474F050
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CC8660009;
 Thu,  2 Nov 2023 18:05:41 +0000 (UTC)
Date: Thu, 2 Nov 2023 19:05:40 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231102190540.5e8114ad@windsurf>
In-Reply-To: <20231015212242.1600362-1-fontaine.fabrice@gmail.com>
References: <20231015212242.1600362-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698948341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z0a/kVYlnde/DrwAORk2mg/oazjqAOgvubR0T81bgjg=;
 b=EWX7XJ+8lmmKBpgSmto/myqeWSxmjH+d3ETGAZDb7pC1CRp+akALvHaw+6EeUMHTzzMmEM
 vjgw4vm6t+gWbWPy/FlAiMc6TANeelms/V4h+XWj6rgnPIxSoPGK0xDsdZOWdPUCHcvpzw
 6Mgx7rFg82lpgr4wSyJXcyLbix/OquY484y5HawIMdMkNqQNDoRglrS9OpwUiHwRIChWqx
 ubg+66PJPm+zqyWtcTLcop3cBNJ4owzPyBccaPzMrY/4N7t1o9lyV54YgS3QoMXilCHPZn
 jyb64uniI54Ynm7/o+Xkch+teVcaHHyhskKew6oTIEMxI+IzYqn0Xv9pTUVRgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EWX7XJ+8
Subject: Re: [Buildroot] [PATCH 1/1] package/zabbix: add missing
 BR2_OPTIMIZE_FAST
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Oct 2023 23:22:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add missing BR2_OPTIMIZE_FAST dependency to BR2_PACKAGE_ZABBIX_SERVER
> to avoid the following build failure raised since commit
> e702a05d8998a1f2416225eb62b43b6585738fe9:
> 
> checking for Zabbix server/proxy database selection... error
> configure: error: No database selected for Zabbix server/proxy. Use --with-mysql or --with-oracle or --with-postgresql or --with-sqlite3.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ab403b45761c82f49a9380564bf10d3e7ae935f2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zabbix/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Good catch, applied to master. I must say I really hate the fact that
these dependencies must be duplicated between the main
BR2_PACKAGE_ZABBIX_SERVER option and the sub-options to select
mysql/postgresql backends.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
