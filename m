Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F56C4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C995C41903;
	Tue, 22 Nov 2022 22:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C995C41903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aEDKUgQSAIEQ; Tue, 22 Nov 2022 22:12:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C339441901;
	Tue, 22 Nov 2022 22:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C339441901
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4A331BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFD3060ADA
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFD3060ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMofVtAvo8Pz for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:12:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B26E60A79
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B26E60A79
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:12:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5FEA4240007;
 Tue, 22 Nov 2022 22:12:38 +0000 (UTC)
Date: Tue, 22 Nov 2022 23:12:37 +0100
To: Jerry Kooyman via buildroot <buildroot@buildroot.org>
Message-ID: <20221122231237.016cc716@windsurf>
In-Reply-To: <20221108144308.1795042-1-jerry.kooyman@entrust.com>
References: <20221108144308.1795042-1-jerry.kooyman@entrust.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669155158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFRRHfi0git9pXsMINBs2CZNni1lTIu3qQ2r3QNqRVQ=;
 b=ZqQpwJ5at7pxUmbUY9AINxoxFcrv0fhRH+TsQ0rxNJAWO9OjCF8Hf5qAY6MJCxJAgfi1RC
 WCJ/Iy1FsXdwcq8Tb5+AkMKmMCXxWSmBlrYqQNC9Po9RHKhDfEdEPEznrmEtMhcgb4FuZH
 bX4QYwUilgcU6azxhwViH5EKgAmfHirr4CGRyf1MrYS8nPQ8RcdQ6oJtPmijfdrUeheo28
 lFHv4rrvj9dKfd0lEc4MuKKNXgHOIsWfvt/VTrCHCsRTIcgxJYfMi1S+QmweYL8ds5Aku4
 MOkoQhtgPDX4ewnwPhD/Rv9NwsqRJY5DLO5f5oc55HHjIb3IH8puE2Kj9P4HuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZqQpwJ5a
Subject: Re: [Buildroot] [PATCH] boot/uboot: add BR2_TARGET_UBOOT_NEEDS_VIM
 option
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
Cc: jerry.kooyman@entrust.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jerry,

On Tue, 8 Nov 2022 08:43:07 -0600
Jerry Kooyman via buildroot <buildroot@buildroot.org> wrote:

> From: Jerry Kooyman <jerry.kooyman@entrust.com>
> 
> A host dependency to vim is required if the
> U-Boot board configuration has CONFIG_USE_DEFAULT_ENV_FILE enabled. So
> introduce a new BR U-Boot config option BR2_TARGET_UBOOT_NEEDS_VIM
> to solve this problem.

Thanks for the patch! First of all, in order for your patch to be
merged, we need it to carry a Signed-off-by line with your name and
email, like this:

Signed-off-by: Your Name <your.email@domain.com>

as the last line of your commit log.

> +config BR2_TARGET_UBOOT_NEEDS_VIM
> +	bool "U-Boot needs vim"

I am wondering if we shouldn't make this:

config BR2_TARGET_UBOOT_NEEDS_XXD
	bool "U-Boot needs xxd"

because really what U-Boot needs is xxd... which happens to be provided
by host-vim.

Indeed, if I see U-Boot failing to build because xxd is missing, if I'm
not familiar with this, I will have hard time realizing that what is
needed is this BR2_TARGET_UBOOT_NEEDS_VIM option.

In order to avoid building host-vim, which needs host-ncurses, we could
also package a standalone version of xxd, such as
https://github.com/ckormanyos/xxd. But that clearly isn't a
requirement, I will be happy to take a modified patch from you that has
the option renamed to BR2_TARGET_UBOOT_NEEDS_XXD.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
