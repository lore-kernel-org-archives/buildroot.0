Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B704C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1302B41498;
	Mon,  1 Aug 2022 17:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1302B41498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oUS7FWJeabVq; Mon,  1 Aug 2022 17:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF943410E5;
	Mon,  1 Aug 2022 17:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF943410E5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 945891BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CDBF40556
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CDBF40556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TAJEPDv7jbJb for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:57:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C16204055E
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C16204055E
 for <buildroot@uclibc.org>; Mon,  1 Aug 2022 17:57:08 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1oIZf8-0000so-GX
 for buildroot@uclibc.org; Mon, 01 Aug 2022 19:57:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 01 Aug 2022 19:56:19 +0200
Message-ID: <pan$e5707$29931ad5$956a380b$791006aa@ID-313208.user.individual.net>
References: <20210810120134.3972324-1-fontaine.fabrice@gmail.com>
 <20210812234247.3618da82__12747.8516822279$1628804602$gmane$org@windsurf>
 <pan$781e4$7f830434$f8b8178c$4f096736@ID-313208.user.individual.net>
 <7bf9f809-a7cd-653c-4948-b3c9ea5f7488@mind.be>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/flatbuffers: fix locale
 independent on musl
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

Am Mon, 1 Aug 2022 19:46:18 +0200 schrieb Arnout Vandecappelle:

>   I don't understand... We have the patch in Buildroot, so the corrected
>   header
> should be installed to staging, right?

Yes, but uClibc defines __GLIBC__ so the patch does not fix the problem.

>   Or does your build somehow use the bundled flatbuffers instead of the
> staging-installed one?

No, kodi uses flatbuffers from staging.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
