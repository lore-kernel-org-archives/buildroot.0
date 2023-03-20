Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB57C6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 08:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C52FF60BD9;
	Mon, 20 Mar 2023 08:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C52FF60BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ata8WI8qQUFk; Mon, 20 Mar 2023 08:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E97960BDB;
	Mon, 20 Mar 2023 08:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E97960BDB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BB511BF35B
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 08:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E993C408FB
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 08:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E993C408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8ZXXAiB9arQ for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 08:51:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F24E9408E3
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F24E9408E3
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 08:51:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C3BD310002A;
 Mon, 20 Mar 2023 08:51:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1peBEL-007Zrm-Q2; Mon, 20 Mar 2023 09:51:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Zvi Vered <veredz72@gmail.com>
References: <CABRndgw1EVFyDNDcRJ10gOPFfw-gH+7Gqx7P537EiSVr5Wq6Kw@mail.gmail.com>
Date: Mon, 20 Mar 2023 09:51:01 +0100
In-Reply-To: <CABRndgw1EVFyDNDcRJ10gOPFfw-gH+7Gqx7P537EiSVr5Wq6Kw@mail.gmail.com>
 (Zvi Vered's message of "Fri, 17 Mar 2023 06:57:16 +0200")
Message-ID: <875yavx0ui.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] 2023.02 : pty_allocate: openpty: No such file or
 directory
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

>>>>> "Zvi" == Zvi Vered <veredz72@gmail.com> writes:

 > Hello,
 > I built rootfs for aarch64 (little endian) and used it to boot cortex A-53
 > with kernel 4.9.x
 > After login (+password) I ran dropbear (included in buildroot) with:
 > dropbear -F -R -E
 > and got no errors.

 > Upon trying to connect via SSH from ssh client I got:
 > pty_allocate: openpty: No such file or directory
 > No pty was allocated, couldn't execute
 > Exit (root) from <10.0.0.1:51333>: Error reading Connection reset by peer

 > Can you please advise what can be done?

Can you provide some more details, please? Dropbear installs an
initscript so it should normally start up automatically.

The openpty issue sounds like your kernel perhaps doesn't have pty
support. Did you enable CONFIG_UNIX98_PTYS / CONFIG_LEGACY_PTYS in the
kernel configuration?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
