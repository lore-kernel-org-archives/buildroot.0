Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114CDCD342F
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 16:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A810C611D9;
	Fri,  8 May 2026 16:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1H7qhq98bQT0; Fri,  8 May 2026 16:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3C1E61705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778258953;
	bh=jXL5MY2syK1oTvfB4f0nnJ5MFVTPDYChJdw478YJaEw=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BBNUCqAAMI+IZErAXB7hZrMZV6dBNP6hWU0Fjn2550Ej0ypr2Y0/QduwjYCKXyAfZ
	 uKklS6TXRmpIXP65mQI0J4OM4oIQ8KjHjoDPCeMtbKVff6jrtNU947ZpPZgwRJ5l+O
	 iOvcW5SawRZ7oNSC9AyhzNRVRcVdDCV08lgBgIC8BBSMG2p1u8bR8nr6ICy+7VEm5j
	 0G+iF5HL/cg1P/pPOLXne4fjme89Dbhl2QcIPaZNEvXcilgs2tuWFA6cAnTukkZPWo
	 B/4Sqfsz8TgToOrYoynKoC78UgKcQDartOqNxtyFnrWHCm9D3rzTE99dIgKlc4o4Tm
	 v+cQHe+Sh0EYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3C1E61705;
	Fri,  8 May 2026 16:49:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D920423F
 for <buildroot@buildroot.org>; Fri,  8 May 2026 16:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D682161705
 for <buildroot@buildroot.org>; Fri,  8 May 2026 16:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVedmEuLmOvG for <buildroot@buildroot.org>;
 Fri,  8 May 2026 16:49:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51682611D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51682611D9
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51682611D9
 for <buildroot@uclibc.org>; Fri,  8 May 2026 16:49:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wLONu-0001fa-UG
 for buildroot@uclibc.org; Fri, 08 May 2026 18:49:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 08 May 2026 18:48:07 +0200
Message-ID: <pan$566eb$c04d55bf$e95bd441$165ccc04@ID-313208.user.individual.net>
References: <20260508123054.12450-1-chakrabortyshubham66__24457.6430924766$1778243487$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH] package/libtool: bump to version 2.5.4
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

Am Fri,  8 May 2026 18:00:53 +0530 schrieb Shubham Chakraborty:

> -LIBTOOL_VERSION = 2.4.6
> +LIBTOOL_VERSION = 2.5.4

Hi,

duplicate of https://patchwork.ozlabs.org/project/buildroot/patch/
20260216071638.3456062-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
