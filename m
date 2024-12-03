Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60649E69EBD
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 22:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 239916115C;
	Tue,  3 Dec 2024 22:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYgc-q3_Zgev; Tue,  3 Dec 2024 22:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E54961155
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E54961155;
	Tue,  3 Dec 2024 22:13:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 472B8236E
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 22:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41F084316C
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 22:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gx_GmzzsQumN for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 22:13:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C6DB403B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C6DB403B4
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C6DB403B4
 for <buildroot@uclibc.org>; Tue,  3 Dec 2024 22:13:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1tIb8m-0006Ia-Sa
 for buildroot@uclibc.org; Tue, 03 Dec 2024 23:13:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 03 Dec 2024 23:12:51 +0100
Message-ID: <pan$c6b5b$95487e35$2a481473$a94d875a@ID-313208.user.individual.net>
References: <20241202174008.1134667-1-bernd@kuhls.net>
 <20241202174008.1134667-6-bernd@kuhls.net>
 <00da17b37c509a32a98aadfe3cb74566__20303.3354760677$1733262723$gmane$org@free.fr>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 6/7] package/{mesa3d,
 mesa3d-headers}: bump version to 24.3.0
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

Am Tue, 03 Dec 2024 22:51:28 +0100 schrieb Julien Olivain:

> I think this patch should also handle the runtime tests. If _SOFTPIPE is
> really an equivalent of _SWRAST, it could changed with:
> 
>      sed -i 's/SWRAST/SOFTPIPE/g'
>      support/testing/tests/package/test_*.py

Hi Julien,

done: https://patchwork.ozlabs.org/project/buildroot/list/?series=435155

Due to time constraints on my part I removed the vkmark patch for now from 
this series to not block the review process.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
