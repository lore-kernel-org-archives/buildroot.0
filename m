Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B4EF436A9
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 14:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F62A40DAF;
	Fri, 17 Apr 2026 14:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFHCpxfAHj2o; Fri, 17 Apr 2026 14:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0AC140DA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776435856;
	bh=tT71FJxUqu+ycOmh+JqOR+bMqyk4lzzSU2deR2ChmbE=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=N4oZrDSXctWpDMGzPTVUQ7xxpG2CD4jxAf3FO0oT7QtTxYHFHkz9J7arYRNITc+AA
	 F00orUPY8zYPBLryCXUhHW5nT51QqShiLXjp5Rvt64d4XP5gUW15BnZrRd2wCcuOKs
	 7IcsUCJ/qKBjYGHg5FkpNUsqYZwDr6R5epKrmJFoxL/eK3peGKyIAM15MKc8BMSG3p
	 0eplYbO0N5ZSeZxEmRCRZhty2jE2xtcxGiUPC3StANO3uKu1LbsoclNVLbMZP+5NCK
	 W0wpySXAduazKfvhcTtp6vhMmMlzFL6iQ5oF/LwyogMzzyRj+ZcKeHKHleOEAJZAZM
	 h9ipYXt8RaFMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0AC140DA7;
	Fri, 17 Apr 2026 14:24:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39B01396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 14:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FCC340DA7
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 14:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKioN-TMVMlE for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 14:24:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AC6540DA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AC6540DA6
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AC6540DA6
 for <buildroot@uclibc.org>; Fri, 17 Apr 2026 14:24:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wDk76-0005uS-OR
 for buildroot@uclibc.org; Fri, 17 Apr 2026 16:24:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 17 Apr 2026 16:23:13 +0200
Message-ID: <pan$e5c1c$f6ea9e55$8fb3420f$7ab0e74e@ID-313208.user.individual.net>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
 <20260417085936.200528-18-dowan.gullient__23313.2156588667$1776416437$gmane$org@smile.fr>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH v1 17/21] support/testing : test_openjdk :
 Bump kernel version to last LTS (6.18)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Fri, 17 Apr 2026 10:59:32 +0200 schrieb Dowan Gullient via buildroot:

>  ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
>  OPENJDK_VERSION_MAJOR = 21
> -OPENJDK_VERSION_MINOR = 0.4
> -OPENJDK_VERSION_BUILD = 7
> +OPENJDK_VERSION_MINOR = 0.9
> +OPENJDK_VERSION_BUILD = 8

Hi Dowan,

this patch already bumps OpenJDK:
https://patchwork.ozlabs.org/project/buildroot/patch/
20260313195744.991927-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
