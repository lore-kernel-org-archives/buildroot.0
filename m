Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73F6C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 17:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AEC960720;
	Sun,  5 Jul 2026 17:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duUmQgS9zrTw; Sun,  5 Jul 2026 17:34:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 843CA6068D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783272845;
	bh=nY777N6kQRyOcq85KmTB+vzXYF95EwnaPB3iwdyxhxI=;
	h=To:From:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=s+B0WbXjtDh6pJLaek2MJkmdvwZIHlWrXFR36s53CdC10YoJg1bbRxX5UeSLR/Xvf
	 Kd7WeukKdCpgZR2MsCIeRIVti+PL3rnyEU/hmZ/vM3zFbb4l3N1dXDzyBO8NJo1G3k
	 dZGL4YR7adbVM3yXPrhpyk0BXutrPkqdUp/AYEVazOKbbVz0mLUe95oF+F79FHiDu2
	 MjeFkm1VS1wzXanOPCNbuzHEVqFO/P/DkobtGxKDP0XiFQUmtSAuUKLp6TYtu8OFVU
	 44gKkGRAp5wj+hDxmyJu081Q9JIEJtTk3e/oC45/91KNDq9nEgw53/0j6+q2thNdA/
	 D8iHROGlSCzbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 843CA6068D;
	Sun,  5 Jul 2026 17:34:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2049F2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 17:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 936CB80FC6
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 17:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgTITjMgZdv2 for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 17:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52E1780FBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52E1780FBC
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52E1780FBC
 for <buildroot@busybox.net>; Sun,  5 Jul 2026 17:34:02 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1wgQj9-0009SK-Mq
 for buildroot@busybox.net; Sun, 05 Jul 2026 19:33:59 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 05 Jul 2026 19:33:14 +0200
Message-ID: <pan$27394$5a9561a$c8874897$7817ee3f@ID-313208.user.individual.net>
References: <20260629071429.4131207-2-buildroot__14354.4681415491$1782717305$gmane$org@heine.tech>
 <pan$1e5ac$b7fc699a$3e8fac53$bef4b4c9@ID-313208.user.individual.net>
 <b5dd30852bde29c27b79e9d92f3a1c29@free.fr>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Cc: buildroot@uclibc.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
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

Hi Julien,

Am Sun, 05 Jul 2026 18:48:01 +0200 schrieb Julien Olivain via buildroot:

> For some reason, your message was not displayed in patchwork:
> https://patchwork.ozlabs.org/project/buildroot/patch/
20260629071429.4131207-2-buildroot@heine.tech/

I guess because the patchwork URLs contain mail addresses which are 
anonymized when posting through news.gmane.io:

References: <20260629071429.4131207-2-
buildroot__14354.4681415491$1782717305$gmane$org@heine.tech>

according to https://lists.buildroot.org/pipermail/buildroot/2026-
June.txt.gz

> So I missed it and applied the fmt bump. I guess we'll need the patches
> for fixing the gerbera package.

Done: https://patchwork.ozlabs.org/project/buildroot/patch/
20260705172616.3104270-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
