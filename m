Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08060C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 22:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A16DC60EB6;
	Sun,  7 Jan 2024 22:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A16DC60EB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dTtDF_LxqOH; Sun,  7 Jan 2024 22:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F41B60EA5;
	Sun,  7 Jan 2024 22:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F41B60EA5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EBB31BF33F
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1315082F49
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1315082F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pO2t36vv88zu for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 22:41:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B13D082F0F
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 22:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B13D082F0F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 257E91BF203;
 Sun,  7 Jan 2024 22:41:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rMbpH-006oSe-1h;
 Sun, 07 Jan 2024 23:41:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231221140039.246333-1-peter@korsgaard.com>
Date: Sun, 07 Jan 2024 23:41:03 +0100
In-Reply-To: <20231221140039.246333-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 21 Dec 2023 15:00:39 +0100")
Message-ID: <87y1d0ydfk.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/putty: security bump to version 0.80
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
Cc: Alexander Dahl <post@lespocky.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > As described in the announcement, this fixes a security issue:
 > There is one security fix in this release:

 >  - Fix for a newly discovered security issue known as the 'Terrapin'
 >    attack, also numbered CVE-2023-48795. The issue affects widely-used
 >    OpenSSH extensions to the SSH protocol: the ChaCha20+Poly1305
 >    cipher system, and 'encrypt-then-MAC' mode.

 >    In order to benefit from the fix, you must be using a fixed version
 >    of PuTTY _and_ a server with the fix, so that they can agree to
 >    adopt a modified version of the protocol. Alternatively, you may be
 >    able to reconfigure PuTTY to avoid selecting any of the affected
 >    modes.

 >    If PuTTY 0.80 connects to an SSH server without the fix, it will
 >    warn you if the initial protocol negotiation chooses an insecure
 >    mode to run the connection in, so that you can abandon the
 >    connection. If it's possible to alter PuTTY's configuration to
 >    avoid the problem, then the warning message will tell you how to do
 >    it.

 > https://lists.tartarus.org/pipermail/putty-announce/2023/000037.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
