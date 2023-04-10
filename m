Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E240C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 21:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E78408DA;
	Mon, 10 Apr 2023 21:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6E78408DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oG3WhJ_MnKR0; Mon, 10 Apr 2023 21:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF8DE408CF;
	Mon, 10 Apr 2023 21:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF8DE408CF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 212A31C38E2
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 077A940912
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 21:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 077A940912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26399fJ3VpEb for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 21:31:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0408F4056B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0408F4056B
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 21:31:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D4DE81BF203;
 Mon, 10 Apr 2023 21:31:16 +0000 (UTC)
Received: from peko by be.duckdns.org with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1plz6Z-005ZnX-RY; Mon, 10 Apr 2023 23:31:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20230404190807.250768-1-christian@paral.in>
 <87r0syjd6c.fsf@dell.be.48ers.dk>
Date: Mon, 10 Apr 2023 23:31:15 +0200
In-Reply-To: <87r0syjd6c.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 05 Apr 2023 22:18:19 +0200")
Message-ID: <87r0srs9uk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 1.19.8
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
 >> go1.19.8 (released 2023-04-04) includes security fixes to the go/parser,
 >> html/template, mime/multipart, net/http, and net/textproto packages, as well as
 >> bug fixes to the compiler, the linker, the runtime, and the time package.

 >> Fixes security vulnerabilities:

 >> go/parser: infinite loop in parsing (CVE-2023-24537)

 >> html/template: backticks not treated as string delimiters (CVE-2023-24538)

 >> net/http, net/textproto: denial of service from excessive memory
 >> allocation (CVE-2023-24534)

 >> net/http, net/textproto, mime/multipart: denial of service from excessive
 >> resource consumption (CVE-2023-24536)

 >> https://go.dev/doc/devel/release#go1.19.8
 >> https://github.com/golang/go/issues?q=milestone%3AGo1.19.8+label%3ACherryPickApproved

 >> Signed-off-by: Christian Stewart <christian@paral.in>

 > Committed, thanks.

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
