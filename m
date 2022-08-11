Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9166C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B30C41830;
	Thu, 11 Aug 2022 11:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B30C41830
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDle7yygBx6r; Thu, 11 Aug 2022 11:45:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22EB0417E6;
	Thu, 11 Aug 2022 11:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22EB0417E6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3647E1BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 123A260F3E
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 123A260F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8IfKx67f6QX4 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:45:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAEB960AA5
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAEB960AA5
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:45:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 091F9200003;
 Thu, 11 Aug 2022 11:45:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oM6dE-002r85-HI; Thu, 11 Aug 2022 13:45:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220626084517.970430-1-fontaine.fabrice@gmail.com>
Date: Thu, 11 Aug 2022 13:45:44 +0200
In-Reply-To: <20220626084517.970430-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 26 Jun 2022 10:45:17 +0200")
Message-ID: <87y1vvknpz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bayer2rgb-neon: fix build
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
Cc: Eloi Bail <eloi.bail@savoirfairelinux.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure:
 > /home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/10.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld:
 > ./.libs/libbayer2rgb3.so: undefined reference to
 > `__bayer2rgb_missing_convert_dumb_implementation'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/69a637b7f1422ce2bf04dda573abb09388b9a02d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
