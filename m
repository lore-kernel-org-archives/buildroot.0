Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54525C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 06:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BC9160EC4;
	Sun,  6 Jul 2025 06:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODSuaamwWFVv; Sun,  6 Jul 2025 06:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3606160A67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3606160A67;
	Sun,  6 Jul 2025 06:59:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 149DD19C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 06:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 060EF40238
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 06:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQkPOQvac_Uo for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 06:59:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1546040151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1546040151
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1546040151
 for <buildroot@uclibc.org>; Sun,  6 Jul 2025 06:59:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1uYJL8-00034W-Hu
 for buildroot@uclibc.org; Sun, 06 Jul 2025 08:59:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 06 Jul 2025 08:58:51 +0200
Message-ID: <pan$3d761$e9537387$9edb4735$c07a0026@ID-313208.user.individual.net>
References: <20250704165336.3647761-1-bernd@kuhls.net>
 <251c5a756b1b4ae37027f7e199536516__8401.43701513938$1751650296$gmane$org@free.fr>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.20.1
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

Am Fri, 04 Jul 2025 19:31:17 +0200 schrieb Julien Olivain via buildroot:

> Have you considered the comment from Thomas, in:
> https://patchwork.ozlabs.org/project/buildroot/patch/
20250518174058.2148313-1-bernd@kuhls.net/
#3521954
> 
> Do you think those CVE fixes could be back-ported first,
> prior the bump?

Hi Julien,

the current version of libheif in buildroot is 1.18.2.

The first CVE https://github.com/advisories/GHSA-7g9v-7vc7-pmrw
fixes libheif/image-items/iden.cc which was added in version 1.19.0.

The second CVE https://github.com/advisories/GHSA-c48q-x6xw-g5h8 does not 
apply cleanly to 1.18.2 even after renaming "/image-items/" to "/codecs/".

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
