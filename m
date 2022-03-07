Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AD4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 396504016A;
	Mon,  7 Mar 2022 21:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_8mSACYa_cX; Mon,  7 Mar 2022 21:08:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B277403A4;
	Mon,  7 Mar 2022 21:08:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4147E1BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E65D60EAD
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQxsFC2IT46T for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:08:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B0D060EA5
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:08:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EB1BCC0003;
 Mon,  7 Mar 2022 21:08:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRKaJ-001HWH-VK; Mon, 07 Mar 2022 22:08:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <cover.1644506959.git.yann.morin@orange.com>
 <11477_1644506977_62052F61_11477_142_1_1cfdf4aa3ac96d2d2cf246385325f93b451d773b.1644506959.git.yann.morin@orange.com>
Date: Mon, 07 Mar 2022 22:08:03 +0100
In-Reply-To: <11477_1644506977_62052F61_11477_142_1_1cfdf4aa3ac96d2d2cf246385325f93b451d773b.1644506959.git.yann.morin@orange.com>
 (yann morin's message of "Thu, 10 Feb 2022 16:29:28 +0100")
Message-ID: <87ee3d4gjw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 5/5 v3] package/pkg-golang: host-go is also
 a build dependency
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Currently, host-go is a download dependency, because we need go for the
 > vendoring during the download step.

 > However, when using a package in override-srcdir, there is no download
 > step, so host-go is not pulled in as a dependency, which will break the
 > build of a single package from scratch.

 > We fix that by adding host-go as a standard dependency too.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Christian Stewart <christian@paral.in>
 > Cc: Anisse Astier <anisse@astier.eu>
 > Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Reviewed-by: Christian Stewart <christian@paral.in>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
