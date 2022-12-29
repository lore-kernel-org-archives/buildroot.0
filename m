Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DD4C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 17:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E2FE60758;
	Thu, 29 Dec 2022 17:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E2FE60758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wph2R-yjzuUF; Thu, 29 Dec 2022 17:54:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 670146066D;
	Thu, 29 Dec 2022 17:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 670146066D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42E791BF389
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 17:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EDAA817A4
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 17:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EDAA817A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgThDDf620Lo for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 17:54:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DAD381773
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3DAD381773
 for <buildroot@uclibc.org>; Thu, 29 Dec 2022 17:54:52 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1pAx7B-0005Uv-J8
 for buildroot@uclibc.org; Thu, 29 Dec 2022 18:54:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 29 Dec 2022 18:53:40 +0100
Message-ID: <pan$aaf4e$5422814b$c7c50bb1$109f6e8e@ID-313208.user.individual.net>
References: <20221218130225.353325-1-fontaine.fabrice__19944.8251792759$1671368580$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: do not add iconv
 for Requires.private
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

Am Sun, 18 Dec 2022 14:02:25 +0100 schrieb Fabrice Fontaine:

> Fix the following build failure with fwup raised since bump to version
> 3.6.2 in commit 380341b249175382691f268de4b41d3843ff0acc and
> https://github.com/libarchive/libarchive/commit/
a83f3d327aefe8d628230f326621b014d82f55b4:
> 
> checking for pkg-config... /tmp/instance-19/output-1/host/bin/pkg-config
> checking pkg-config is at least version 0.9.0... yes checking for
> ARCHIVE... no configure: error: Requires libarchive. Libarchive must be
> built with zlib support.

Hi,

upstream committed a different fix:
http://patchwork.ozlabs.org/project/buildroot/patch/
20221229175254.224876-1-bernd.kuhls@t-online.de/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
