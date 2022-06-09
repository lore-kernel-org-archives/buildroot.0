Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F28EC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 19:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1645384223;
	Thu,  9 Jun 2022 19:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dpal9X6M0AVD; Thu,  9 Jun 2022 19:30:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49B00840B3;
	Thu,  9 Jun 2022 19:30:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64DAF1BF2EC
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 19:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 537D741D19
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 19:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Pi3-Aqqoi4G for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 19:30:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 114A041D0F
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 19:30:38 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82A531BF205;
 Thu,  9 Jun 2022 19:30:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzNrW-002IwF-HN; Thu, 09 Jun 2022 21:30:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220518211200.431651-1-fontaine.fabrice@gmail.com>
Date: Thu, 09 Jun 2022 21:30:34 +0200
In-Reply-To: <20220518211200.431651-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 18 May 2022 23:12:00 +0200")
Message-ID: <87edzx1vol.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: fix pam build with
 musl and libressl
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following musl build failure raised with pam and libressl:
 > auth-pam.c: In function 'pam_server':
 > auth-pam.c:894:23: error: 'PATH_MAX' undeclared (first use in this
 > function); did you mean 'AF_MAX'?
 >   894 |     char ac_file_name[PATH_MAX];
 >       |                       ^~~~~~~~
 >       |                       AF_MAX
 > auth-pam.c:894:23: note: each undeclared identifier is reported only
 > once for each function it appears in
 > auth-pam.c:894:10: warning: unused variable 'ac_file_name' [-Wunused-variable]
 >   894 |     char ac_file_name[PATH_MAX];
 >       |          ^~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c8834fa5ddcac6fd22fc9406e10221e64cdb8856

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
