Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D19C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 18:13:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C2261107
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 18:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58C2261107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C0E9404B4;
	Tue, 14 Sep 2021 18:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_N8AhWrMtSb; Tue, 14 Sep 2021 18:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0602940492;
	Tue, 14 Sep 2021 18:13:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E79D1BF990
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 18:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D81360AD0
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 18:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RzNYC6tC_vmf for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 18:09:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 366C4605C4
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 18:09:51 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 9B40F200005
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 18:09:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mQCsQ-0007Rg-5G
 for buildroot@buildroot.org; Tue, 14 Sep 2021 20:09:50 +0200
Resent-To: buildroot@buildroot.org
Resent-From: Peter Korsgaard <peter@korsgaard.com>
Resent-Date: Tue, 14 Sep 2021 20:09:50 +0200
Resent-Message-ID: <87y27zyqoh.fsf@dell.be.48ers.dk>
X-From-Line: nobody Mon Sep 13 19:28:47 2021
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210831195812.1095065-1-fontaine.fabrice@gmail.com>
Date: Mon, 13 Sep 2021 19:28:47 +0200
In-Reply-To: <20210831195812.1095065-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 31 Aug 2021 21:58:12 +0200")
Message-ID: <875yv4z8og.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/zip: fix musl static build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Jan Pedersen <jp@jp-embedded.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following static build failure on musl which is raised because
 > the "Check for directory libraries" in configure wrongly adds -DNO_DIR
 > when no directory library is needed:

 > /tmp/instance-0/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -c -D_FILE_OFFSET_BITS=64 -O2 -g0 -static -I. -DUNIX -DUIDGID_NOT_16BIT -DBZIP2_SUPPORT -DLARGE_FILE_SUPPORT -DUNICODE_SUPPORT -DNO_MKTIME -DNO_DIR -DHAVE_DIRENT_H -DHAVE_TERMIOS_H unix/unix.c
 > unix/unix.c:70:14: error: conflicting types for 'DIR'
 >    70 | typedef FILE DIR;
 >       |              ^~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/83a6e0c8c4ad026cb0261246e3b1a80d754454bd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
