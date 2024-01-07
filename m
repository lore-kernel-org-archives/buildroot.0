Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F67C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 22:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D09D760EA0;
	Sun,  7 Jan 2024 22:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D09D760EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOWGhxsXodky; Sun,  7 Jan 2024 22:27:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C77260E91;
	Sun,  7 Jan 2024 22:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C77260E91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0772D1BF33F
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E259A83103
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E259A83103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNn_pqB_Lli7 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 22:27:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1F48830D7
 for <buildroot@busybox.net>; Sun,  7 Jan 2024 22:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F48830D7
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3BED240003;
 Sun,  7 Jan 2024 22:27:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rMbbr-006m9Q-0I;
 Sun, 07 Jan 2024 23:27:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <bbe9d77a3248044af15eb27f127466e0e672723d.1703223960.git.baruch@tkos.co.il>
Date: Sun, 07 Jan 2024 23:27:11 +0100
In-Reply-To: <bbe9d77a3248044af15eb27f127466e0e672723d.1703223960.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Fri, 22 Dec 2023 07:46:00
 +0200")
Message-ID: <874jfozsn4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/libcurl: fix build with GnuTLS
 and no verbose
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

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > A change of data logging introduced in version 8.5.0 broke the build.
 > Add a patch to fix that.

 > Fixes:
 > http://autobuild.buildroot.net/results/c5b996696333c4ff1392dbb8e6b0edc9c5322ee4/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: Take upstream patch

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
