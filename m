Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100D2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 18:17:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1FA6610E6
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 18:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1FA6610E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0FD860AF4;
	Tue, 14 Sep 2021 18:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1vhUQSa6Ajz; Tue, 14 Sep 2021 18:17:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A6860AEB;
	Tue, 14 Sep 2021 18:17:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43FB81BF59A
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 18:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 500A4605C4
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 18:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFjDT4ccgvhb for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 18:09:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 548FD607C7
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 18:09:54 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9F0E9C0007
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 18:09:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mQCsS-0007TU-3l
 for buildroot@buildroot.org; Tue, 14 Sep 2021 20:09:52 +0200
Resent-To: buildroot@buildroot.org
Resent-From: Peter Korsgaard <peter@korsgaard.com>
Resent-Date: Tue, 14 Sep 2021 20:09:52 +0200
Resent-Message-ID: <87pmtbuiz3.fsf@dell.be.48ers.dk>
X-From-Line: nobody Tue Sep 14 08:12:46 2021
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210913204424.3896484-1-fontaine.fabrice@gmail.com>
Date: Tue, 14 Sep 2021 08:12:46 +0200
In-Reply-To: <20210913204424.3896484-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 13 Sep 2021 22:44:24 +0200")
Message-ID: <87a6kfvg69.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gd: security bump to version
 2.3.3
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2021-40145: ** DISPUTED ** gdImageGd2Ptr in gd_gd2.c in the GD
 >   Graphics Library (aka LibGD) through 2.3.2 has a double free. NOTE:
 >   the vendor's position is "The GD2 image format is a proprietary image
 >   format of libgd. It has to be regarded as being obsolete, and should
 >   only be used for development and testing purposes."
 > - Drop patch (already in version)
 > - Update hash of COPYING (duplicate merged and title added with
 >   https://github.com/libgd/libgd/commit/82d260950589563a1af9c56f4ce5fde843a695ae
 >   https://github.com/libgd/libgd/commit/6013c7bcf6eb795dba584f92d3824ebd3ae60202)

 > https://github.com/libgd/libgd/releases/tag/gd-2.3.3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
