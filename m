Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025B4C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 12:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B663A6FAB9;
	Thu,  8 Feb 2024 12:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKBrKZKk84_O; Thu,  8 Feb 2024 12:57:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D19E96FAC5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D19E96FAC5;
	Thu,  8 Feb 2024 12:57:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE2A51BF403
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 12:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7D86405FA
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 12:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_DiXhMVwx2e for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 12:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3518E40104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3518E40104
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3518E40104
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 12:57:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAE32C0002;
 Thu,  8 Feb 2024 12:57:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rY3yK-002xpV-0o;
 Thu, 08 Feb 2024 13:57:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240208070939.493203-1-peter@korsgaard.com>
Date: Thu, 08 Feb 2024 13:57:44 +0100
In-Reply-To: <20240208070939.493203-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 8 Feb 2024 08:09:39 +0100")
Message-ID: <87h6ijyuyf.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: security bump to version
 2.42.5
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > https://webkitgtk.org/security/WSA-2024-0001.html

 > - CVE-2024-23222: Processing maliciously crafted web content may lead to
 >   arbitrary code execution.  Apple is aware of a report that this issue may
 >   have been exploited.  Description: A type confusion issue was addressed
 >   with improved checks.

 > - CVE-2024-23206: A maliciously crafted webpage may be able to fingerprint
 >   the user.  Description: An access issue was addressed with improved access
 >   restrictions.

 > - CVE-2024-23213: Processing web content may lead to arbitrary code execution.
 >   Description: The issue was addressed with improved memory handling.

 > - CVE-2023-40414: Processing web content may lead to arbitrary code
 >   execution.  Description: A use-after-free issue was addressed with
 >   improved memory management.

 > - CVE-2023-42833: Processing web content may lead to arbitrary code execution.
 >   Description: A correctness issue was addressed with improved checks.

 > - CVE-2014-1745: Processing a file may lead to a denial-of-service or
 >   potentially disclose memory contents.  Description: The issue was
 >   addressed with improved checks.

 > https://webkitgtk.org/security/WSA-2023-0012.html

 > - CVE-2023-42883: Processing a SVG image may lead to a denial-of-service.
 >   Description: The issue was addressed with improved memory handling.

 > - CVE-2023-42890: Processing web content may lead to arbitrary code
 >   execution.  Description: The issue was addressed with improved memory
 >   handling.

 > https://webkitgtk.org/security/WSA-2023-0011.html

 > - CVE-2023-42916: Processing web content may disclose sensitive information.
 >   Apple is aware of a report that this issue may have been actively
 >   exploited.  Description: An out-of-bounds read was addressed with improved
 >   input validation.

 > - CVE-2023-42917: Processing web content may lead to arbitrary code
 >   execution.  Apple is aware of a report that this issue may have been
 >   actively exploited.  Description: A memory corruption vulnerability was
 >   addressed with improved locking.

 > Add an upstream post-2.42.5 patch to fix an issue with an invalid backport
 > causing a build issue.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
