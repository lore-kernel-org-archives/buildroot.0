Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D57C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CCD581A3B;
	Fri,  7 Jan 2022 18:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pLbjXFhy0xr; Fri,  7 Jan 2022 18:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824A981A15;
	Fri,  7 Jan 2022 18:39:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58EEF1BF291
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55586415F7
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vgr5dcPxS6jl for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:39:47 +0000 (UTC)
X-Greylist: delayed 00:46:56 by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FBC7414E6
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:39:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id CF6B0240002;
 Fri,  7 Jan 2022 18:39:44 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n5u9Q-0005Dg-3D; Fri, 07 Jan 2022 19:39:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20220104181107.3171973-1-fontaine.fabrice@gmail.com>
 <3c9b632e-aae8-5766-c961-42627109d70a@smile.fr>
Date: Fri, 07 Jan 2022 19:39:44 +0100
In-Reply-To: <3c9b632e-aae8-5766-c961-42627109d70a@smile.fr> (Romain Naour's
 message of "Thu, 6 Jan 2022 15:08:08 +0100")
Message-ID: <87iluvl79r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/liburing: new package
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

Hi,

 >> +++ b/package/liburing/Config.in
 >> @@ -0,0 +1,13 @@
 >> +config BR2_PACKAGE_LIBURING
 >> +	bool "liburing"
 >> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h

 > Is any linux-headers dependency (5.0 maybe).

I believe io_uring was added in 5.1:

https://kernelnewbies.org/Linux_5.1

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
