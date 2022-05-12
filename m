Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B71BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 08:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 366CF417A9;
	Thu, 12 May 2022 08:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IV-8ev6RQvnY; Thu, 12 May 2022 08:48:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32D66419B0;
	Thu, 12 May 2022 08:48:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FA5B1BF84C
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E83460A71
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:48:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sfHS6H2VhMdV for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 08:48:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDED060757
 for <buildroot@buildroot.org>; Thu, 12 May 2022 08:48:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D30881C0009;
 Thu, 12 May 2022 08:48:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1np4Uj-007h0n-Rk; Thu, 12 May 2022 10:48:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220511100707.1477883-1-peter@korsgaard.com>
Date: Thu, 12 May 2022 10:48:25 +0200
In-Reply-To: <20220511100707.1477883-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 11 May 2022 12:07:06 +0200")
Message-ID: <87czgj9lwm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libcurl: security bump to version
 7.83.1
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2022-27778: curl removes wrong file on error
 >   https://curl.se/docs/CVE-2022-27778.html

 > - CVE-2022-27779: cookie for trailing dot TLD
 >   https://curl.se/docs/CVE-2022-27779.html

 > - CVE-2022-27780: percent-encoded path separator in URL host
 >   https://curl.se/docs/CVE-2022-27780.html

 > - CVE-2022-27781: CERTINFO never-ending busy-loop
 >   https://curl.se/docs/CVE-2022-27781.html

 > - CVE-2022-27782: TLS and SSH connection too eager reuse
 >   https://curl.se/docs/CVE-2022-27782.html

 > - CVE-2022-30115: HSTS bypass via trailing dot
 >   https://curl.se/docs/CVE-2022-30115.html

 > Drop now upstreamed 0001-mbedtls-fix-compile-when-h2-enabled.patch

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
