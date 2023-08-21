Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E59EE4996
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 05:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 749D9600CC;
	Mon, 21 Aug 2023 05:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 749D9600CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UfiSnGRXBgwg; Mon, 21 Aug 2023 05:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E85C860674;
	Mon, 21 Aug 2023 05:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E85C860674
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 173BA1BF337
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 05:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E45E581EB0
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 05:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E45E581EB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJK6CXb5VkLt for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 05:27:12 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A05881EAF
 for <buildroot@uclibc.org>; Mon, 21 Aug 2023 05:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A05881EAF
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qXxRV-0007yw-Jl
 for buildroot@uclibc.org; Mon, 21 Aug 2023 07:27:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 21 Aug 2023 07:26:05 +0200
Message-ID: <pan$680f2$168f5fdf$791c2861$5ae46bb8@ID-313208.user.individual.net>
References: <20230820152639.3867011-1-bernd@kuhls.net>
 <20230820234204.75b4af22__33285.4256777623$1692567752$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: fix linking with libargp
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sun, 20 Aug 2023 23:42:04 +0200 schrieb Thomas Petazzoni via buildroot:

> This looks extremely strange. TARGET_NLS_LIBS is either empty, or
> contains -lintl. How is that related to argp-standalone, and how can it
> resolve the argp-standalone issue?

Hi Thomas,

argp-standalone has an optional dependency to libintl:
https://git.buildroot.net/buildroot/tree/package/argp-standalone/argp-
standalone.mk#n19

and installs only an .a file causing an error during configure in crun:

/home/autobuild/autobuild/instance-7/output-1/build/argp-standalone-1.4.1/
argp-parse.c:181: undefined reference to `libintl_dgettext'

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
