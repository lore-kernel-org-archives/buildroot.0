Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3129EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 19:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7BC760C2F;
	Sun, 23 Jan 2022 19:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pk1QEk3fFGco; Sun, 23 Jan 2022 19:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C44C60C2A;
	Sun, 23 Jan 2022 19:49:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 064701BF406
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5F1C81A2B
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 19:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DrnhsbVyimL8 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 19:49:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADA1281A0D
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 19:49:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6AD1D20002;
 Sun, 23 Jan 2022 19:49:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nBirv-0006He-PV; Sun, 23 Jan 2022 20:49:43 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20211222174246.26822-1-peter@korsgaard.com>
Date: Sun, 23 Jan 2022 20:49:43 +0100
In-Reply-To: <20211222174246.26822-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 22 Dec 2021 18:42:45 +0100")
Message-ID: <87zgnmw7u0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] pakage/apache: security bump to version
 2.4.52
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

 > Fixes the following security issues:
 >   *) SECURITY: CVE-2021-44790: Possible buffer overflow when parsing
 >      multipart content in mod_lua of Apache HTTP Server 2.4.51 and
 >      earlier (cve.mitre.org)
 >      A carefully crafted request body can cause a buffer overflow in
 >      the mod_lua multipart parser (r:parsebody() called from Lua
 >      scripts).
 >      The Apache httpd team is not aware of an exploit for the
 >      vulnerabilty though it might be possible to craft one.
 >      This issue affects Apache HTTP Server 2.4.51 and earlier.
 >      Credits: Chamal

 >   *) SECURITY: CVE-2021-44224: Possible NULL dereference or SSRF in
 >      forward proxy configurations in Apache HTTP Server 2.4.51 and
 >      earlier (cve.mitre.org)
 >      A crafted URI sent to httpd configured as a forward proxy
 >      (ProxyRequests on) can cause a crash (NULL pointer dereference)
 >      or, for configurations mixing forward and reverse proxy
 >      declarations, can allow for requests to be directed to a
 >      declared Unix Domain Socket endpoint (Server Side Request
 >      Forgery).
 >      This issue affects Apache HTTP Server 2.4.7 up to 2.4.51
 >      (included).

 > For more details, see the changes file:
 > https://downloads.apache.org/httpd/CHANGES_2.4.52

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
