Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505B0C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12E6C60E7F;
	Wed, 28 Feb 2024 16:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DG6kddG9YsPf; Wed, 28 Feb 2024 16:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32DCC60E89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32DCC60E89;
	Wed, 28 Feb 2024 16:43:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 333181BF2B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 207BC60E7F
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IaoVIklg65lE for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:43:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E638F60E6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E638F60E6B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E638F60E6B
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:43:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF646FF805;
 Wed, 28 Feb 2024 16:43:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfN1c-001muh-0f;
 Wed, 28 Feb 2024 17:43:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240126135747.2407552-1-peter@korsgaard.com>
 <ZbVmT0V0pDW6IegC@landeda> <87wmrtzy9i.fsf@48ers.dk>
Date: Wed, 28 Feb 2024 17:43:20 +0100
In-Reply-To: <87wmrtzy9i.fsf@48ers.dk> (Peter Korsgaard's message of "Sun, 28
 Jan 2024 08:56:57 +0100")
Message-ID: <87y1b4o7yv.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/darkhttpd: security bump to version
 1.15
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> Peter, All,
 >> On 2024-01-26 14:57 +0100, Peter Korsgaard spake thusly:
 >>> Fixes the following security issues:
 >>> 
 >>> CVE-2024-23770: Local Leak of Authentication Parameter in Process List
 >>> 
 >>> CVE-2024-23771: Basic Auth Timing Attack
 >>> 
 >>> https://security.opensuse.org/2024/01/22/darkhttpd-basic-auth-issues.html
 >>> 
 >>> Notice that CVE-2024-23770 is only documented as a known weakness, not
 >>> fixed.
 >>> 
 >>> Also change the license logic to use the dedicated COPYING file available
 >>> since 1.14:
 >>> 
 >>> https://github.com/emikulic/darkhttpd/commit/a8ae2b1de069588cad23d79a5392445ee9590fcd
 >>> 
 >>> This license is ISC, not MIT - So adjust DARKHTTPD_LICENSE to match.

 >> This means the licensing stuff should be backported to the maintenance
 >> branches, and should thus have been a separate patch prior to the
 >> version bump.

 >> But since this is a security fix, I guess you'll want to backport the
 >> version bump too. And since the odlest stable, 2023.02, already had
 >> darkhttpd 1.14, it is possibe to backport the version bump to all
 >> maintenance branches.

 >> Thus, I considered splitting, got slightly cat-distracted, and pushed
 >> without splitting.

 > Hehe ;) That was indeed also the reason why I didn't do the effort to
 > split it in multiple patches.

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
