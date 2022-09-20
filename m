Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93394ECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 06:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 171BC8197D;
	Tue, 20 Sep 2022 06:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 171BC8197D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8yHjM7Jr1ev; Tue, 20 Sep 2022 06:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E0D28196E;
	Tue, 20 Sep 2022 06:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E0D28196E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2F71BF9CB
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F232A404DA
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 06:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F232A404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iXuRXabx9nxS for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 06:38:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F1F404CF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7F1F404CF
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 06:38:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9D32824000C;
 Tue, 20 Sep 2022 06:38:07 +0000 (UTC)
Date: Tue, 20 Sep 2022 08:38:06 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220920083806.2d553c6e@windsurf>
In-Reply-To: <20220826135503.20612-19-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-19-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663655887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GpwxmCSOaLTaB5cOSVKdCnO2Pfl7c39WkBCyfzy/1ew=;
 b=M1re78U5HEAQbnQD85KJLj6VUclheFleEv+gnfn0VNqY73Qu1ictjfDwSmojjv4junzgCy
 S6QIuGyxeHOibHogmV/q+SmL4rBBKXTQzkWfhWyipyxMAjoRswj/DKRWHm8zVt9W+MUAyS
 ik5WiCR4ZpnmTKPulIu0OlIqJ7/buFCB+PGLBhC53E9bEhfXanytuKESlvxjeHKGCqXAiJ
 HJ5KghvbWfrlCM7JyuTAQElyT7iKbbjbUoXGFbxwqauZ5H3P+7w52+ELG/79EUOPBhy20r
 FK8xeOOKX68Rfb9J9YaV2qvJ6V5EhaSaQbIS/wTOAvqVAzMtDEI5uYfadMDqcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M1re78U5
Subject: Re: [Buildroot] [PATCH v4 18/29] package/qt6/qt6base: add support
 for sql module w/ mysql
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jesse,

On Fri, 26 Aug 2022 15:54:52 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> +if BR2_PACKAGE_QT6BASE_SQL
> +config BR2_PACKAGE_QT6BASE_MYSQL
> +	bool "MySQL Plugin"
> +	depends on BR2_USE_MMU # mysql

I have replicated all dependencies of mysql for the sake of
completeness.

> +	select BR2_PACKAGE_MYSQL
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_READLINE

ncurses and readline don't seem to be needed. They were not even
build-time dependencies anyway, so I dropped these lines.

> +	help
> +	  Build MySQL plugin
> +	  If unsure, say n.

The "If unsure, say n" is a bit useless, so I dropped it.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
