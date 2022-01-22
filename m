Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0946C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 16:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3944440921;
	Sat, 22 Jan 2022 16:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id thYXOTAdhp8S; Sat, 22 Jan 2022 16:54:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8579740926;
	Sat, 22 Jan 2022 16:54:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 421E31BF575
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 16:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3089060AC5
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 16:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDhxvvWa4gXh for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 16:54:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E377660A70
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 16:54:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9ED8D100002;
 Sat, 22 Jan 2022 16:54:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nBJf5-0001Ex-PG; Sat, 22 Jan 2022 17:54:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20211216171656.27339-1-peter@korsgaard.com>
Date: Sat, 22 Jan 2022 17:54:47 +0100
In-Reply-To: <20211216171656.27339-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 16 Dec 2021 18:16:55 +0100")
Message-ID: <87bl03zp60.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/xserver_xorg-server: security bump
 to version 21.1.2
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following vulnerabilities:
 > * CVE-2021-4008/ZDI-CAN-14192 SProcRenderCompositeGlyphs out-of-bounds
 >   access

 >   The handler for the CompositeGlyphs request of the Render extension does
 >   not properly validate the request length leading to out of bounds memory
 >   write.

 > * CVE-2021-4009/ZDI-CAN 14950 SProcXFixesCreatePointerBarrier out-of-bounds
 >   access

 >   The handler for the CreatePointerBarrier request of the XFixes extension
 >   does not properly validate the request length leading to out of bounds
 >   memory write.

 > * CVE-2021-4010/ZDI-CAN-14951 SProcScreenSaverSuspend out-of-bounds access

 >   The handler for the Suspend request of the Screen Saver extension does not
 >   properly validate the request length leading to out of bounds memory
 >   write.

 > * CVE-2021-4011/ZDI-CAN-14952 SwapCreateRegister out-of-bounds access

 >   The handlers for the RecordCreateContext and RecordRegisterClients
 >   requests of the Record extension do not properly validate the request
 >   length leading to out of bounds memory write.

 > For details, see the advisory:
 > https://lists.x.org/archives/xorg-announce/2021-December/003122.html

 > Builds without systemd unfortunately got broken.  Add a patch fixing that
 > from an upstream merge request:
 > https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/827

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

In the mean time xserver 1.20.14 has been released with the same
security fixes, so I've used that for 2021.02.x / 2021.11.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
