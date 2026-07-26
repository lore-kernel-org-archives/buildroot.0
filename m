Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1F1C531C9
	for <buildroot@archiver.kernel.org>; Sun, 26 Jul 2026 16:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97429406D2;
	Sun, 26 Jul 2026 16:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gONkpmOiqaY8; Sun, 26 Jul 2026 16:13:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50EAE406CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785082392;
	bh=h8E9oLXX0utXk8IW9SRhQVebvPHZ2Xs4+OkjYIVC71o=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jHUdm5y3Zoyf+uAYLqmaZkWpBDB0YyL0gTnmXpPgLNRfNDI3CroJnSzkJ5dK5u2SC
	 po7n4GzuEblJ2y3NyCuTeoHbcX4jLxJJdw45xv3ErBewkdpb3GBtz9Wkzcpdnak78A
	 3/FCcKuBwnW7wZm3+tnkY72hm5BWt8+5i+htULb2jtjOkBtzIvOi9rGWtGXYu+J6u7
	 +mTDSHt/YLvT0WKJ7I+xdnNn3At9GZyxt+H+RQTRYSYMqbcfwhcJzzFqO/Nwpxpr4T
	 nt4p3O3bbD2ulfT4tuiuGEgpD5GjXaIcCvHhjT0TkIKueOeQFdKIsbJgazWXCYBo0l
	 +kED+51VWm+xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50EAE406CD;
	Sun, 26 Jul 2026 16:13:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 324B7357
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 16:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10459400B4
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 16:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYlVH32qesGh for <buildroot@buildroot.org>;
 Sun, 26 Jul 2026 16:13:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E797440068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E797440068
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E797440068
 for <buildroot@uclibc.org>; Sun, 26 Jul 2026 16:13:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wo1TP-0003q8-2f
 for buildroot@uclibc.org; Sun, 26 Jul 2026 18:13:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 26 Jul 2026 18:12:34 +0200
Message-ID: <pan$3e0d7$f791fb90$f70fbd44$216e8a96@ID-313208.user.individual.net>
References: <20260503144908.2807535-1-bernd@kuhls.net>
 <20260503144908.2807535-4-bernd@kuhls.net>
 <410696ed-2c91-4d32-bebe-d437e0a187b3__36894.8651057266$1780145198$gmane$org@rnout.be>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 4/4] package/gdb: hide version choice for
 14.x for gcc/host-gcc >= 10
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

Am Sat, 30 May 2026 12:34:55 +0200 schrieb Arnout Vandecappelle via
buildroot:

>   We don't want to keep on dragging this old stuff around. Just require
>   GCC 9
> for gdb entirely. That allows us to drop all of those somewhat brittle
> dependencies.

Hi Arnout,

done: https://patchwork.ozlabs.org/project/buildroot/patch/
20260726160724.3628271-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
