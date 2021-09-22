Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609DEC433FE
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:53:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9FE26135A
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9FE26135A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D30D403AD;
	Wed, 22 Sep 2021 08:53:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DOU3IBGPgna2; Wed, 22 Sep 2021 08:53:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C95402D8;
	Wed, 22 Sep 2021 08:53:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1AA1BF30E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19F91401F5
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mcz9fDIxzKTf for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 08:53:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CC1F40696
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 08:53:26 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DDFDAE0006;
 Wed, 22 Sep 2021 08:53:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mSy0H-0005Ce-RP; Wed, 22 Sep 2021 10:53:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20210920203041.23723-1-peter@korsgaard.com>
Date: Wed, 22 Sep 2021 10:53:21 +0200
In-Reply-To: <20210920203041.23723-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 20 Sep 2021 22:30:39 +0200")
Message-ID: <87mto5q9dq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libcurl: security bump to version
 7.79.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-22945: UAF and double-free in MQTT sending
 >   When sending data to an MQTT server, libcurl could in some circumstances
 >   erroneously keep a pointer to an already freed memory area and both use
 >   that again in a subsequent call to send data and also free it again.

 >   https://curl.se/docs/CVE-2021-22945.html

 > - CVE-2021-22946: Protocol downgrade required TLS bypassed
 >   A user can tell curl to require a successful upgrade to TLS when speaking
 >   to an IMAP, POP3 or FTP server (--ssl-reqd on the command line or
 >   CURLOPT_USE_SSL set to CURLUSESSL_CONTROL or CURLUSESSL_ALL with libcurl).
 >   This requirement could be bypassed if the server would return a properly
 >   crafted but perfectly legitimate response.

 >   This flaw would then make curl silently continue its operations without
 >   TLS contrary to the instructions and expectations, exposing possibly
 >   sensitive data in clear text over the network.

 >   https://curl.se/docs/CVE-2021-22946.html

 > - CVE-2021-22947: STARTTLS protocol injection via MITM
 >   When curl connects to an IMAP, POP3, SMTP or FTP server to exchange data
 >   securely using STARTTLS to upgrade the connection to TLS level, the server
 >   can still respond and send back multiple responses before the TLS upgrade.
 >   Such multiple "pipelined" responses are cached by curl.  curl would then
 >   upgrade to TLS but not flush the in-queue of cached responses and instead
 >   use and trust the responses it got before the TLS handshake as if they
 >   were authenticated.

 >   Using this flaw, it allows a Man-In-The-Middle attacker to first inject
 >   the fake responses, then pass-through the TLS traffic from the legitimate
 >   server and trick curl into sending data back to the user thinking the
 >   attacker's injected data comes from the TLS-protected server.

 >   Over POP3 and IMAP an attacker can inject fake response data.

 >   https://curl.se/docs/CVE-2021-22947.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

7.79.0 unfortunately added a few regressions, which have now been fixed
in 7.79.1:

https://daniel.haxx.se/blog/2021/09/22/curl-7-79-1-patched-up-and-ready/

So I've sent an updated patch for that instead.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
