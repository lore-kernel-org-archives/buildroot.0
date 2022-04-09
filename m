Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9440C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 10:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DE3D60F5C;
	Sat,  9 Apr 2022 10:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wbu9S5gnJDKO; Sat,  9 Apr 2022 10:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB04760BC1;
	Sat,  9 Apr 2022 10:31:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B403F1BF5A8
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 10:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2124844A9
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 10:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLAasxaDtyjG for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 10:31:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83C89844BF
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 10:31:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B921F2000A;
 Sat,  9 Apr 2022 10:31:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nd8Ni-001t3A-PD; Sat, 09 Apr 2022 12:31:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220402130049.453518-1-fontaine.fabrice@gmail.com>
Date: Sat, 09 Apr 2022 12:31:50 +0200
In-Reply-To: <20220402130049.453518-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 2 Apr 2022 15:00:49 +0200")
Message-ID: <87sfqmsg2x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libkrb5: fix BR2_SHARED_STATIC_LIBS build
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
Cc: =?utf-8?Q?Andr=C3=A9?= Zwing <nerv@dawncrow.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with BR2_SHARED_STATIC_LIBS raised since
 > the addition of the package in commit
 > 7ae94b51ed5d51fb9fa3f5a931bb8435bcbfaa42 and
 > https://github.com/krb5/krb5/commit/bd13166a4098198832d921b8e50b97008b714b7b

 > configure: error: --enable-static must be specified with --disable-shared

 > Fixes:
 >  - http://autobuild.buildroot.org/results/dadbf9f77ffdcc4d4e48c6d7e6beb5da303a8074

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Fix patch number

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
