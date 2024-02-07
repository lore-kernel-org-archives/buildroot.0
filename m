Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983FCC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 08:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42190837D2;
	Wed,  7 Feb 2024 08:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SimSuR_Ht3hA; Wed,  7 Feb 2024 08:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60000838DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60000838DB;
	Wed,  7 Feb 2024 08:38:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 744DC1BF350
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 611CC421D2
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 08:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CSVvavt82lfk for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 08:38:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3201E42156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3201E42156
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3201E42156
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 08:38:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6B30C0007;
 Wed,  7 Feb 2024 08:38:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXdRy-00EuOZ-10;
 Wed, 07 Feb 2024 09:38:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@aperture.us>
References: <20240207023225.2572189-1-christian@aperture.us>
Date: Wed, 07 Feb 2024 09:38:34 +0100
In-Reply-To: <20240207023225.2572189-1-christian@aperture.us> (Christian
 Stewart's message of "Tue, 6 Feb 2024 18:32:25 -0800")
Message-ID: <8734u43bzp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/1] package/runc: bump version to v1.1.12
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
Cc: Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@aperture.us> writes:

 > https://github.com/opencontainers/runc/releases/tag/v1.1.12

As clearly stated in the release notes this is a security fix (for
https://github.com/advisories/GHSA-xr7r-f8xq-vfvv), so I've marked it as
such and committed, thanks.

> Signed-off-by: Christian Stewart <christian@aperture.us>
 > ---
 >  package/runc/runc.hash | 2 +-
 >  package/runc/runc.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/runc/runc.hash b/package/runc/runc.hash
 > index 5ffd21a5dd..d6eb27d352 100644
 > --- a/package/runc/runc.hash
 > +++ b/package/runc/runc.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed
 > -sha256  509993674481aad7e14aedfb280e0eb160f3a34c0b77e2e98c4b3c0b1df76894  runc-1.1.9.tar.gz
 > +sha256  be31b07d6a54a8f234016501c300ad04b6c428c56588e7eca8c3b663308db208  runc-1.1.12.tar.gz
 >  sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
 > diff --git a/package/runc/runc.mk b/package/runc/runc.mk
 > index 62e117685a..273509b860 100644
 > --- a/package/runc/runc.mk
 > +++ b/package/runc/runc.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -RUNC_VERSION = 1.1.9
 > +RUNC_VERSION = 1.1.12
 >  RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 >  RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 >  RUNC_LICENSE_FILES = LICENSE
 > -- 

 > 2.43.0


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
