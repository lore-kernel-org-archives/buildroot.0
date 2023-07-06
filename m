Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03108EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D4F64024A;
	Thu,  6 Jul 2023 11:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D4F64024A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nt_PLCQjyaus; Thu,  6 Jul 2023 11:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB2C4022B;
	Thu,  6 Jul 2023 11:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB2C4022B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 340FC1BF345
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C65E240228
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C65E240228
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtZMdzlbRJnb for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:33:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E45D9417BB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E45D9417BB
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:33:06 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C416DFF802;
 Thu,  6 Jul 2023 11:33:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qHNEM-003ETx-PL; Thu, 06 Jul 2023 13:33:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230619143220.210438-1-peter@korsgaard.com>
Date: Thu, 06 Jul 2023 13:33:02 +0200
In-Reply-To: <20230619143220.210438-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 19 Jun 2023 16:32:20 +0200")
Message-ID: <87ilax2s29.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to version
 16.20.0
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2023-23918: Node.js Permissions policies can be bypassed via
 >   process.mainModule (High)

 > - CVE-2023-23919: Node.js OpenSSL error handling issues in nodejs crypto
 >   library (Medium)

 > - CVE-2023-23920: Node.js insecure loading of ICU data through ICU\_DATA
 >   environment variable (Low)

 > - CVE-2023-23936: Fetch API in Node.js did not protect against CRLF
 >   injection in host headers (Medium)
 >   https://github.com/nodejs/undici/security/advisories/GHSA-5r9g-qh6m-jxff

 > - CVE-2023-24807: Regular Expression Denial of Service in Headers in Node.js
 >   fetch API (Low)
 >   https://github.com/nodejs/undici/security/advisories/GHSA-r6ch-mqf9-qc9w

 > For more details, see the advisory:
 > https://nodejs.org/en/blog/vulnerability/february-2023-security-releases

 > Update LICENSE hash after an update of the openssl license snippet:
 > https://github.com/nodejs/node/commit/e7ed56f501389978e4619ab697a812631c4061ff

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
