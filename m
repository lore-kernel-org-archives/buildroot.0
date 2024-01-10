Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CAEC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CC494379D;
	Wed, 10 Jan 2024 20:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CC494379D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QX9cm1b5OXW9; Wed, 10 Jan 2024 20:03:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4248D437A5;
	Wed, 10 Jan 2024 20:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4248D437A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24D531BF296
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F23EE61533
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F23EE61533
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDU6_0kdM2jM for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:03:21 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D79F960757
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D79F960757
Received: by mail.gandi.net (Postfix) with ESMTPSA id 221EFC0003;
 Wed, 10 Jan 2024 20:03:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNenG-008lxH-1D;
 Wed, 10 Jan 2024 21:03:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240101210511.10AB483AE6@busybox.osuosl.org>
Date: Wed, 10 Jan 2024 21:03:18 +0100
In-Reply-To: <20240101210511.10AB483AE6@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Mon, 1 Jan 2024 21:37:48 +0100")
Message-ID: <87frz59cs9.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/x11r7/xserver_xorg-server:
 security bump to version 21.1.10
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=9b62f5905e9f9d47363983a5bd7ef8672b21cca6
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues:

 > 1) CVE-2023-6377: X.Org server: Out-of-bounds memory write in XKB button actions

 > A device has XKB button actions for each button on the device.  When a
 > logical device switch happens (e.g.  moving from a touchpad to a mouse), the
 > server re-calculates the information available on the respective master
 > device (typically the Virtual Core Pointer).  This re-calculation only
 > allocated enough memory for a single XKB action rather instead of enough for
 > the newly active physical device's number of button.  As a result, querying
 > or changing the XKB button actions results in out-of-bounds memory reads and
 > writes.

 > This may lead to local privilege escalation if the server is run as root or
 > remote code execution (e.g. x11 over ssh).

 > 2) CVE-2023-6478: X.Org server: Out-of-bounds memory read in
 > RRChangeOutputProperty and RRChangeProviderProperty

 > This fixes an OOB read and the resulting information disclosure.

 > Length calculation for the request was clipped to a 32-bit integer.  With
 > the correct stuff->nUnits value the expected request size was truncated,
 > passing the REQUEST_FIXED_SIZE check.

 > The server then proceeded with reading at least stuff->nUnits bytes
 > (depending on stuff->format) from the request and stuffing whatever it finds
 > into the property.  In the process it would also allocate at least
 >stuff-> nUnits bytes, i.e.  4GB.

 > See also CVE-2022-46344 where this issue was fixed for other requests.

 > For more details, see the advisory:
 > https://lists.x.org/archives/xorg-announce/2023-December/003435.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
