Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F21C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80F2760A85;
	Fri,  7 Jan 2022 17:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-yhqxbGAgWh; Fri,  7 Jan 2022 17:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA1A960A78;
	Fri,  7 Jan 2022 17:46:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 965821BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D47060A78
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cH70lgXKmyHr for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:46:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CCEB60A76
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:46:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D16931BF203;
 Fri,  7 Jan 2022 17:46:43 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n5tK7-0003Ra-0S; Fri, 07 Jan 2022 18:46:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220105180453.388499-1-fontaine.fabrice@gmail.com>
Date: Fri, 07 Jan 2022 18:46:42 +0100
In-Reply-To: <20220105180453.388499-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 5 Jan 2022 19:04:53 +0100")
Message-ID: <87czl3moal.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mdadm: disable -Werror
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

 > Disable -Werror by setting CWFLAGS to ""
 > This will avoid the following build failure raised since bump to version
 > 4.2 in commit b03fc7974536378ba102418451ba7e9801bc6251:

 > mdadm.c: In function 'main':
 > mdadm.c:156:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
 >   154 |    if (mode == ASSEMBLE || mode == BUILD ||
 >       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c0f216b7aadb794110409d03dcef7fa58e833cd4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
