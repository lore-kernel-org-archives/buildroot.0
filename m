Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A87CCA48B
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 10:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A3E4610B5;
	Sat, 23 Jul 2022 10:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A3E4610B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Gj6meRlVB6B; Sat, 23 Jul 2022 10:26:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24FA060FCB;
	Sat, 23 Jul 2022 10:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24FA060FCB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDCBA1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 10:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A652D84B56
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 10:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A652D84B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHjmxXw5TW2b for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 10:26:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65F7B84B41
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65F7B84B41
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 10:26:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D8A13240002;
 Sat, 23 Jul 2022 10:26:45 +0000 (UTC)
Date: Sat, 23 Jul 2022 12:26:44 +0200
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20220723122644.18d005d0@windsurf>
In-Reply-To: <20220723095436.4467-1-pevik@seznam.cz>
References: <20220723095436.4467-1-pevik@seznam.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658572006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZk1Z6E6yudAATIDsdDtK9pHlu/wEgxrKaNoQ+hxjis=;
 b=me1Kle+AIxFM2cmT4GA1SMDJC9Ez5ANQB7NE31zXXzgXXgj1SW9MoSd35RHWakzSiReRZu
 azh349cMoiRfk56HpK2nE5aQzfoaX0Nb9pDa0V2yUC/uz6PNynDQZHgiuF5TgARGVNRvTF
 KzP9T0NW+PgDiEG2bewVxU4yJKS/X312kdZM79rNyogJCaQ9JmpEp2Z3XrNC3owQzF+a2O
 kpXhMiTIc31+F/623/Po5vRvZCrFA0mhp/3TK8umR/C6eMQAGYkWvtVS6ExmVV9bhVaUQk
 1j3yzNd9BLmGL+iaoVA/vY7bgFgqbxJc3kKizAaUPD0td+yDqmowFT8i1BE3YA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=me1Kle+A
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: Add post release
 runtime fixes
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 23 Jul 2022 11:54:36 +0200
Petr Vorel <pevik@seznam.cz> wrote:

> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Backport various post 20220527 release runtime fixes:
> * The concept of max runtime
> * tst_test.sh: Cleanup getopts usage
> * mountns0[1-3]: wait for umount completed in thread_b
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...fs05_make_tree-Restore-5-min-timeout.patch |  31 ++++
>  ...igrate_pages03-restore-runtime-to-5m.patch |  44 +++++
>  ...ait-for-umount-completed-in-thread_b.patch |  63 +++++++
>  ...0007-netstress-Restore-runtime-to-5m.patch |  53 ++++++
>  ...x-usage-of-variables-from-tst_net.sh.patch | 154 ++++++++++++++++++
>  ...-Fix-usage-of-PAGESIZE-from-memcg_li.patch | 121 ++++++++++++++
>  6 files changed, 466 insertions(+)
>  create mode 100644 package/ltp-testsuite/0004-nfs05_make_tree-Restore-5-min-timeout.patch
>  create mode 100644 package/ltp-testsuite/0005-syscalls-migrate_pages03-restore-runtime-to-5m.patch
>  create mode 100644 package/ltp-testsuite/0006-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
>  create mode 100644 package/ltp-testsuite/0007-netstress-Restore-runtime-to-5m.patch
>  create mode 100644 package/ltp-testsuite/0008-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
>  create mode 100644 package/ltp-testsuite/0009-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
