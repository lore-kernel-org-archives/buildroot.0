Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D79C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 15:06:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFFE560EBC
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 15:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFFE560EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85D2F40793;
	Fri,  5 Nov 2021 15:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7JOoTD4UYl-J; Fri,  5 Nov 2021 15:06:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3F004078C;
	Fri,  5 Nov 2021 15:06:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91FE61BF5DA
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 15:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D09940446
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 15:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NwNix8Ni_vga for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 15:06:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A739401BE
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 15:06:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C701F20016;
 Fri,  5 Nov 2021 15:06:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mj0nH-00062X-Qz; Fri, 05 Nov 2021 16:06:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211104231210.2027405-1-fontaine.fabrice@gmail.com>
 <20211104231210.2027405-4-fontaine.fabrice@gmail.com>
Date: Fri, 05 Nov 2021 16:06:15 +0100
In-Reply-To: <20211104231210.2027405-4-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 5 Nov 2021 00:12:10 +0100")
Message-ID: <87mtmihcbc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] package/dahdi-linux: bump to
 5c840cf43838e0690873e73409491c392333b3b8
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix build with kernel >= 5.4 thanks to
 >   https://git.asterisk.org/gitweb/?p=dahdi/linux.git;a=commit;h=45ac6a30f922f4eef54c0120c2a537794b20cf5c
 > - Fix build with kernel >= 5.6 thanks to
 >   https://git.asterisk.org/gitweb/?p=dahdi/linux.git;a=commit;h=34b9c77c9ab2794d4e912461e4c1080c4b1f6184
 > - Fix typo in dahdi-linux.mk
 > - Remove deprecated note about kernel >= 4.0 in Config.in
 > - Add patch to fix build failure with 32-bits kernels raised since
 >   https://git.asterisk.org/gitweb/?p=dahdi/linux.git;a=commit;h=ffcd08205c71dcb0e060836359418bef20f07ffa
 > - Update indentation in hash file (two spaces)

 > Fixes:
 >  - https://bugs.buildroot.org/show_bug.cgi?id=14311

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
