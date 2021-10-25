Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F35C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:33:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E47F060F22
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E47F060F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C88040098;
	Mon, 25 Oct 2021 11:33:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uydYiggpoBej; Mon, 25 Oct 2021 11:33:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA4F140141;
	Mon, 25 Oct 2021 11:33:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD7E71BF37A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBDDA402EB
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqHcDnxOi_Cf for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 11:33:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BF6A40012
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 11:33:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 746942000C;
 Mon, 25 Oct 2021 11:33:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1meyEd-0008Ej-S5; Mon, 25 Oct 2021 13:33:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20211017200341.20867-1-ps.report@gmx.net>
Date: Mon, 25 Oct 2021 13:33:47 +0200
In-Reply-To: <20211017200341.20867-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 17 Oct 2021 22:03:41 +0200")
Message-ID: <871r49xrs4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/gnupg2: bump version to 2.2.32
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

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - removed 0001-dirmngr-Fix-build-with--disable-ldap.patch
 >   (from upstream [1])

 > - fix/update signature check key hash

 > For details (since 2.2.28) see [2], [3], [4] and [5].

 > [1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=c6900f5723b4edc899aaea267ed599b5ad724142
 > [2] https://lists.gnupg.org/pipermail/gnupg-announce/2021q3/000461.html
 > [3] https://lists.gnupg.org/pipermail/gnupg-announce/2021q3/000463.html
 > [4] https://lists.gnupg.org/pipermail/gnupg-announce/2021q3/000464.html
 > [5] https://lists.gnupg.org/pipermail/gnupg-announce/2021q4/000465.html

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x and 2021.08.x given the (letsencrypt) fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
