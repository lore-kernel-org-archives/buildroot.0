Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4C7C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 13:43:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A86D61139
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 13:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A86D61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C5D440828;
	Tue,  5 Oct 2021 13:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FcwgS4ndUCKo; Tue,  5 Oct 2021 13:43:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B5724081E;
	Tue,  5 Oct 2021 13:43:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D352A1BF2A5
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 13:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D027183D8A
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 13:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gjjdDZpwHgO2 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 13:43:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 848A883D72
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 13:43:15 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6ACBF100012;
 Tue,  5 Oct 2021 13:43:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXkiu-0006wy-N8; Tue, 05 Oct 2021 15:43:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210917201944.3760710-1-yann.morin.1998@free.fr>
Date: Tue, 05 Oct 2021 15:43:12 +0200
In-Reply-To: <20210917201944.3760710-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 17 Sep 2021 22:19:44 +0200")
Message-ID: <87v92bd1u7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] fs/ext2: fix namespace for variables
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In filesystems, variables must be prefixed with ROOTFS_, to avoid
 > ckashing with packages of the same name.

 > We do not have a package named 'ext2', so we currently have no clash,
 > but it is still ebtter that the variables be properly namespaced.

s/ebtter/better/ ;)

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Kory Maincent <kory.maincent@bootlin.com>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
