Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B92DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 15:08:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26BB16113A
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 15:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26BB16113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F25BC402E9;
	Mon,  8 Nov 2021 15:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-HjcoqS11Qn; Mon,  8 Nov 2021 15:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 633B2401BF;
	Mon,  8 Nov 2021 15:08:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C7771BF2BC
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 15:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D66580B7A
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 15:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Z3e58Cl57sf for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 15:08:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17B6B80C9D
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 15:08:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6E4BD1BF209;
 Mon,  8 Nov 2021 15:08:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mk6G9-0005jq-J6; Mon, 08 Nov 2021 16:08:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211104231210.2027405-1-fontaine.fabrice@gmail.com>
 <20211104231210.2027405-4-fontaine.fabrice@gmail.com>
Date: Mon, 08 Nov 2021 16:08:33 +0100
In-Reply-To: <20211104231210.2027405-4-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 5 Nov 2021 00:12:10 +0100")
Message-ID: <87mtme65xq.fsf@dell.be.48ers.dk>
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

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
