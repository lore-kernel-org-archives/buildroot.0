Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA50AC43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D22F82690;
	Mon, 27 Jun 2022 22:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D22F82690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pt2hCI7E_6ly; Mon, 27 Jun 2022 22:20:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57BBF82628;
	Mon, 27 Jun 2022 22:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57BBF82628
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DFE91BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66BE882628
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66BE882628
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5csl0g5tY_SX for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:20:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F3482611
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70F3482611
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:20:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4A0EBE0004;
 Mon, 27 Jun 2022 22:20:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o5x63-00D59Y-EV; Tue, 28 Jun 2022 00:20:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220627213612.2104825-1-fontaine.fabrice@gmail.com>
Date: Tue, 28 Jun 2022 00:20:43 +0200
In-Reply-To: <20220627213612.2104825-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 27 Jun 2022 23:36:12 +0200")
Message-ID: <874k05vjd0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to
 version 0.9.0
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Renumber patch
 > - Update hash of README.md (changes not related to license)
 > - FPIN support is fixed by setting LINUX_HEADERS_INCDIR and
 >   https://github.com/opensvc/multipath-tools/commit/63aa47d0327de2beacf86f6a8e2fd7575d62dadf
 >   FPIN support is (wrongly) enabled if ELS_DTAG_LNK_INTEGRITY is defined
 >   in /usr/include/scsi/fc/fc_els.h since bump to version 0.8.9 in commit
 >   b790ff27d5461df4de22732611a1eb4beee68f91 and
 >   https://github.com/opensvc/multipath-tools/commit/cfff03efbca753ef485ad717087464dced9c721a
 >   resulting in the following build failure:

 >   In file included from /nvmedata/autobuild/instance-7/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/include/scsi/scsi_netlink_fc.h:25,
 >                    from fpin_handlers.c:6:
 >   /nvmedata/autobuild/instance-7/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/include/scsi/scsi_netlink.h:44:2: error: unknown type name 'uint8_t'
 >      44 |  uint8_t version;
 >         |  ^~~~~~~

 > https://github.com/opensvc/multipath-tools/compare/0.8.9...0.9.0

 > Fixes:
 >  - http://autobuild.buildroot.org/results/32f4ada6c49261924ca78f62dee43241bda379a3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
