Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDCCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 12:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B678C84CA7;
	Sat, 28 May 2022 12:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_4SHqpgMn2h; Sat, 28 May 2022 12:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D62E484CAB;
	Sat, 28 May 2022 12:59:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF32A1BF20B
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 12:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE50F84CA9
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 12:59:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 97QHEPPr6OPx for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 12:59:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BF3F84CA7
 for <buildroot@buildroot.org>; Sat, 28 May 2022 12:59:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4ACC8100002;
 Sat, 28 May 2022 12:59:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuw2U-003yys-41; Sat, 28 May 2022 14:59:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220508213724.1402946-1-fontaine.fabrice@gmail.com>
Date: Sat, 28 May 2022 14:59:30 +0200
In-Reply-To: <20220508213724.1402946-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 8 May 2022 23:37:24 +0200")
Message-ID: <87bkvhak3x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rust: add host-pkgconf
 dependency
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add host-pkgconf dependency to fix the following build failure raised
 > since commit 4e3be3ae9d4c9f1b0c035eee0c923a724f9a9316:

 >   run pkg_config fail: "Failed to run `\"/nvmedata/autobuild/instance-6/output-1/per-package/host-rust/host/bin/pkg-config\" \"--libs\" \"--cflags\" \"openssl\"`: No such file or directory (os error 2)"

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b046523960079cbf85931b8f67c3b98dd07fbbda

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
