Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0871C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E3E782735;
	Mon,  4 Apr 2022 19:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6XXECwhtxJX; Mon,  4 Apr 2022 19:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82E0782718;
	Mon,  4 Apr 2022 19:42:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7F591BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A44B640201
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:42:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2KSS84x--5Gh for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:42:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E834401DF
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:42:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 72890100002;
 Mon,  4 Apr 2022 19:42:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nbSaP-006dPH-Ul; Mon, 04 Apr 2022 21:42:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220403202202.1583075-1-fontaine.fabrice@gmail.com>
Date: Mon, 04 Apr 2022 21:42:01 +0200
In-Reply-To: <20220403202202.1583075-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Apr 2022 22:22:02 +0200")
Message-ID: <87wng4ws8m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/zlib-ng: fix build on powerpc
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

 > Handle WITH_POWER8 to fix the following build failure with powerpc and
 > libglib2 raised since bump to version 1.9.9-b1 in commit
 > 1f7b12a0b4572d7e763c431a63c22cfb912b8b14 and
 > https://github.com/zlib-ng/zlib-ng/commit/b81f4ee96dcbdf1db34b00727b6f1829a2ba1edb:

 > /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/powerpc-buildroot-linux-musl/11.2.0/../../../../powerpc-buildroot-linux-musl/bin/ld:
 > /home/autobuild/autobuild/instance-9/output-1/host/powerpc-buildroot-linux-musl/sysroot/usr/lib/libz.a(adler32_power8.c.o):
 > in function `adler32_power8':
 > /home/autobuild/autobuild/instance-9/output-1/build/zlib-ng-2.0.6/arch/power/adler32_power8.c:106:
 > undefined reference to `vec_sumsu'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f864a0e2307e25342b45c90a5b4fb57a0f5c1c93

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Don't unconditionally disable power8

Committed to 2021.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
