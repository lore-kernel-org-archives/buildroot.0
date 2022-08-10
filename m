Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C81BC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 15:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2F8161098;
	Wed, 10 Aug 2022 15:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2F8161098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0t5K1I38KGe; Wed, 10 Aug 2022 15:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF0C96106A;
	Wed, 10 Aug 2022 15:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF0C96106A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 905FD1BF488
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69116610AC
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69116610AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUd9unVFej16 for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 15:04:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D60760BB3
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D60760BB3
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 15:04:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F30691C0002;
 Wed, 10 Aug 2022 15:04:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oLnFZ-002XHV-2s; Wed, 10 Aug 2022 17:04:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220717214132.2715220-1-fontaine.fabrice@gmail.com>
Date: Wed, 10 Aug 2022 17:04:01 +0200
In-Reply-To: <20220717214132.2715220-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Jul 2022 23:41:32 +0200")
Message-ID: <87bkssp2ce.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/perl: bump perl-cross to
 version 1.4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump will fix the following static build failure with berkeleydb
 > thanks to
 > https://github.com/arsv/perl-cross/commit/31dac3e264a7f1f53dbf49570771123ebd514055:

 > /nvmedata/autobuild/instance-6/output-1/host/lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld:
 > lib/auto/DB_File/DB_File.a(DB_File.o): in function `ParseOpenInfo':
 > DB_File.c:(.text+0x7d30): undefined reference to `db_create'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e01a042185b2221bee815bb9096c4419eeb6e558

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
