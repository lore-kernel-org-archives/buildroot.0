Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF985C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 13:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FDD240286;
	Sun, 21 Nov 2021 13:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iToisVcGQRjp; Sun, 21 Nov 2021 13:57:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 004494044E;
	Sun, 21 Nov 2021 13:57:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAC9D1BF25B
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D65F740124
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 13:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIGh_FSx22n0 for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 13:57:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB8A9400C8
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 13:57:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D8E2140002;
 Sun, 21 Nov 2021 13:57:41 +0000 (UTC)
Date: Sun, 21 Nov 2021 14:57:41 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211121145741.1fa4dffb@windsurf>
In-Reply-To: <20211119175553.2413433-1-fontaine.fabrice@gmail.com>
References: <20211119175553.2413433-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/2] Revert "package/log4cxx: select boost chrono and date-time
 with gcc < 7"
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

On Fri, 19 Nov 2021 18:55:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This reverts commit 3c2245cb65741c965f4bb87d35ac3c64f250a1ae to move
> these selects on boost side as the build failure was raised with gcc >=
> 7 (making this commit a "no-op"). Indeed, the build failure is raised
> with cmake < 3.21.3, because cmake assumed that boost thread depends on
> date-time until
> https://github.com/Kitware/CMake/commit/1ad0c5ae53fc0c4f774166337f0e9c93c578cf9b.

I don't understand why you say this commit is a no-op. It clearly
isn't. In gcc < 7.x configurations, this commit ensures that boost
chrono and boost date-time are selected.

The fact that you realize later that the build failure occurred with
gcc >= 7.x, meaning this commit does not help fixing the issue does not
make this commit a no-op.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
