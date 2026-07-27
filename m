Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626C3C531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 05:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D06C040553;
	Mon, 27 Jul 2026 05:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRvC2nHQP1XF; Mon, 27 Jul 2026 05:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F7C403A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785129373;
	bh=MtUST3WucmTRfllfqoWztQCP1TydvUyJMuNmgLjEfyQ=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Y/DZtUgZpA59x6fvPNV2/mOfBjkzY5h+yD2l0eGiBc2riMVPQczzte8R2DOjU0moG
	 oEjJDuObt0Fq5V4vx3f818EXvYkxRDPwMOZW93oVkv4Xv23XxHCjJ8wwCUN4fUgAuf
	 LZLDnSnPJiDS5UwDGFHGtTfqVHoLWTlexM9HxTI8V6rm0Gyt/fNPkPejYcox502CiK
	 GCkbkzKBAA0cQlCdLgzN15oDRovJo6ll3bhUWIsNedJHguGoyH04oURKw+BU6/SFfW
	 PZxeFw60XRhmuRMg5K30t76cHg0Y1sBxLMuNde9+vPy4No5DeMUz+x3L9WDSt+DU4H
	 VCgiHXDZJBu6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F7C403A1;
	Mon, 27 Jul 2026 05:16:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A8382E5
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 05:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BB5A40101
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 05:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bi3tvD_C65jH for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 05:16:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 904F84059C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 904F84059C
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 904F84059C
 for <buildroot@uclibc.org>; Mon, 27 Jul 2026 05:16:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1woDh8-0002P5-RD
 for buildroot@uclibc.org; Mon, 27 Jul 2026 07:16:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 27 Jul 2026 07:15:41 +0200
Message-ID: <pan$26558$6c1a5442$d5bbb276$a08eafbb@ID-313208.user.individual.net>
References: <amaCxq1lFi8rsIyJ__7967.02165841765$1785105510$gmane$org@arcana.i.gnudd.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH] package/jpeg-turbo: fix aarch64 build using
 an upstream patch
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

Am Sun, 26 Jul 2026 23:57:26 +0200 schrieb Alessandro Rubini:

> This patch is 3.2.0-8-g0da22762 in the original jpeg-turbo package,
> where the committer claims they can't reproduce the problem. Buildroot
> is currently using version 3.2.0 of the package.

Hi Alessandro,

duplicate of https://patchwork.ozlabs.org/project/buildroot/patch/
20260726212249.155140-2-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
