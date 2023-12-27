Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F2DC46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 16:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C85A7409C3;
	Wed, 27 Dec 2023 16:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C85A7409C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jA5fTMPI5nFD; Wed, 27 Dec 2023 16:22:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14FB54161A;
	Wed, 27 Dec 2023 16:22:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14FB54161A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 972D41BF3E1
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 16:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D69B41621
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 16:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D69B41621
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v61CQrhrTnOj for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 16:22:04 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B65640210
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 16:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B65640210
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6757E0003;
 Wed, 27 Dec 2023 16:22:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rIWfP-002Quj-33;
 Wed, 27 Dec 2023 17:21:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231223195510.18755-1-thomas.petazzoni@bootlin.com>
Date: Wed, 27 Dec 2023 17:21:59 +0100
In-Reply-To: <20231223195510.18755-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sat, 23 Dec 2023 20:55:09
 +0100")
Message-ID: <87a5pvr4yg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/x11r7/xwayland: security bump to
 23.2.3
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > According to
 > https://lists.x.org/archives/xorg-announce/2023-December/003437.html:

 >   This release contains the fixes for CVE-2023-6377 and CVE-2023-6478
 >   in today's security advisory:
 >   https://lists.x.org/archives/xorg-announce/2023-December/003435.html

 > The release has only 10 commits compared to 23.2.2, all of which being
 > fixes, two of them being the security fixes. So it seems like bumping
 > the version is a reasonable trade-off vs. backporting the security
 > fixes.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

Xserver 21.1.10 has been released with the same fixes, so I have sent a
patch for that.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
