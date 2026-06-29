Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60756C43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 13:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1183560BDE;
	Mon, 29 Jun 2026 13:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVnqSolGWt-Q; Mon, 29 Jun 2026 13:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AD9860B92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782738195;
	bh=AniNWcyHGb5Bj52bKiX4tK/RQ89X3u34avT/of+2+5w=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sRqOnSOmERbPlzN7bFNOI/d0fJTYi2FLM4M6d3ovtpLsGmOkPGjZRkhhwWArA7hMW
	 TexpMA2zt1ajihy/XLnxfS0oVBCEWfu9W590x1Q7UjhGgbfuNy22uWcIOXfCK2Qof7
	 rVS+NwIEvT0v7haxtwlntBvmxh+0uCGF2rPDGhVu1m5ridQsqpcKYiNnFfbHi7bdh4
	 uHuXMT1pJ/3xhddUyQ1w14DHyD6Xk2GsVXAk+YD3w5E7Pk4ubUWhBBxd0gri3Bttzc
	 iMfnZh2KGcCFsIsRJlnlHR9Azw0rYa6gBJs0SFn1cqk3pJ9EqyiK/J5wGn3uzhCmfv
	 QvSe5Cpujak7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AD9860B92;
	Mon, 29 Jun 2026 13:03:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 502AC2D3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 13:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E2B340C4D
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 13:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lOeLGjkQx4e for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 13:03:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8CB140C34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8CB140C34
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8CB140C34
 for <buildroot@uclibc.org>; Mon, 29 Jun 2026 13:03:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1weBdl-0009KC-0y
 for buildroot@uclibc.org; Mon, 29 Jun 2026 15:03:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 29 Jun 2026 15:02:47 +0200
Message-ID: <pan$1e5ac$b7fc699a$3e8fac53$bef4b4c9@ID-313208.user.individual.net>
References: <20260629071429.4131207-2-buildroot__14354.4681415491$1782717305$gmane$org@heine.tech>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH] package/fmt: bump to version 12.2.0
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

Am Mon, 29 Jun 2026 09:14:18 +0200 schrieb Michael Nosthoff via buildroot:

> changelog:
> https://github.com/fmtlib/fmt/releases/tag/12.2.0

Hi Michael,

this bump will break the build of gerbera unless these patches are 
included into buildroot:

https://github.com/gerbera/gerbera/commit/
7caa9ae9ebf5c4cded5a292701528ff1d5c4946e

https://github.com/gerbera/gerbera/commit/
9507706136fde8c324d95d5c84c78bae1703bafc

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
