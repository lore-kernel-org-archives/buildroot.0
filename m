Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C6FC47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 22:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E1CB60EC2;
	Sun,  7 Jan 2024 22:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E1CB60EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oieBS51it6Bg; Sun,  7 Jan 2024 22:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDBC860EAB;
	Sun,  7 Jan 2024 22:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDBC860EAB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7A561BF33F
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE01B60EAB
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE01B60EAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GySjAVckkGeb for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 22:42:45 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE73360EA5
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 22:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE73360EA5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C488C0004
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 22:42:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rMbqs-006pch-1R
 for buildroot@buildroot.org; Sun, 07 Jan 2024 23:42:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231221142249.327382-1-peter@korsgaard.com>
Date: Sun, 07 Jan 2024 23:42:42 +0100
In-Reply-To: <20231221142249.327382-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 21 Dec 2023 15:22:49 +0100")
Message-ID: <87ttnoydct.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libssh: security bump to version
 0.10.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2023-6004: Command Injection using malicious hostname in expanded proxycommand
 >   https://www.libssh.org/security/advisories/CVE-2023-6004.txt

 > - CVE-2023-48795: Avoid potential downgrade attacks by implementing strict kex
 >   https://www.libssh.org/security/advisories/CVE-2023-48795.txt

 > - CVE-2023-6918: Avoid potential use of weak keys in low memory conditions
 >   by systematically checking return values of MD functions.
 >   https://www.libssh.org/security/advisories/CVE-2023-6918.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
