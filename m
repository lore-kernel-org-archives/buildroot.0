Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47AFDC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 17:50:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E25EA60FED
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 17:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E25EA60FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5DEA60607;
	Tue, 14 Sep 2021 17:50:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZEajAJ2H9Di; Tue, 14 Sep 2021 17:50:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 217BA60676;
	Tue, 14 Sep 2021 17:50:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A83141BF995
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 17:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9791D403B2
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 17:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPNYDFVlBN9w for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 17:50:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C492C400DA
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 17:50:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id E71A6CF159
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 17:44:17 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 85F95240004
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 17:44:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mQCTb-00072K-T9
 for buildroot@buildroot.org; Tue, 14 Sep 2021 19:44:11 +0200
Resent-To: buildroot@buildroot.org
Resent-From: Peter Korsgaard <peter@korsgaard.com>
Resent-Date: Tue, 14 Sep 2021 19:44:11 +0200
Resent-Message-ID: <87wnnj128k.fsf@dell.be.48ers.dk>
X-From-Line: nobody Mon Sep 13 15:26:29 2021
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20210829024632.682029-1-james.hilliard1@gmail.com>
 <20210829024632.682029-6-james.hilliard1@gmail.com>
Date: Mon, 13 Sep 2021 15:26:29 +0200
In-Reply-To: <20210829024632.682029-6-james.hilliard1@gmail.com> (James
 Hilliard's message of "Sat, 28 Aug 2021 20:46:30 -0600")
Message-ID: <874kao1u9m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 6/8] package/swupdate: add webserver
 config option
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

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Since the website depends on the webserver being enabled we should
 > add a config option for it and make the website depend on that.

 > We should also ensure that the mongoose(webserver) config is present.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
