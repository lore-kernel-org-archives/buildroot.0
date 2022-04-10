Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12642C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 20:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABBE6415FD;
	Sun, 10 Apr 2022 20:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdS0nGET-QXd; Sun, 10 Apr 2022 20:01:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94128415F4;
	Sun, 10 Apr 2022 20:01:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C306B1BF338
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C04C64014A
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 20:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T-ut0jYB0GGj for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 20:01:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CD5940106
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 20:01:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D9EB660005;
 Sun, 10 Apr 2022 20:01:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nddkT-005Dl6-SW; Sun, 10 Apr 2022 22:01:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220405180944.946684-1-fontaine.fabrice@gmail.com>
Date: Sun, 10 Apr 2022 22:01:25 +0200
In-Reply-To: <20220405180944.946684-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 5 Apr 2022 20:09:44 +0200")
Message-ID: <8735ikogh6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-libav: fix
 build without C++
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

 > Fix the following build failure without C++ raised since bump to version
 > 1.18.0 in commit 15dc48ca9becafec6ba11b08af18453bc0e40c9e:

 > The following exception(s) were encountered:
 > Running
 > "/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++
 > --version" gave "[Errno 2] No such file or directory:
 > '/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++'"

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8ac0ba5eaaf7571857b4d8cfabf1488d640dc59a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
