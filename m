Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3E4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 17:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAF3D60C13;
	Fri, 28 Jan 2022 17:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02qo718BOOlx; Fri, 28 Jan 2022 17:03:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AE0E60782;
	Fri, 28 Jan 2022 17:03:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8C97D1BF271
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ADB1409B1
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoGM4xVUrl3r for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 17:03:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67A23409AA
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 17:03:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0DBB02000A;
 Fri, 28 Jan 2022 17:03:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nDUek-0006FH-CF; Fri, 28 Jan 2022 18:03:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220114103825.1529-1-peter@korsgaard.com>
Date: Fri, 28 Jan 2022 18:03:26 +0100
In-Reply-To: <20220114103825.1529-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 14 Jan 2022 11:38:24 +0100")
Message-ID: <87wnij7py9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to version
 14.18.3
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > Improper handling of URI Subject Alternative Names (Medium)(CVE-2021-44531)

 > Accepting arbitrary Subject Alternative Name (SAN) types, unless a PKI is
 > specifically defined to use a particular SAN type, can result in bypassing
 > name-constrained intermediates.  Node.js was accepting URI SAN types, which
 > PKIs are often not defined to use.  Additionally, when a protocol allows URI
 > SANs, Node.js did not match the URI correctly.

 > Certificate Verification Bypass via String Injection (Medium)(CVE-2021-44532)

 > Node.js converts SANs (Subject Alternative Names) to a string format.  It
 > uses this string to check peer certificates against hostnames when
 > validating connections.  The string format was subject to an injection
 > vulnerability when name constraints were used within a certificate chain,
 > allowing the bypass of these name constraints.

 > Incorrect handling of certificate subject and issuer fields (Medium)(CVE-2021-44533)

 > Node.js did not handle multi-value Relative Distinguished Names correctly.
 > Attackers could craft certificate subjects containing a single-value
 > Relative Distinguished Name that would be interpreted as a multi-value
 > Relative Distinguished Name, for example, in order to inject a Common Name
 > that would allow bypassing the certificate subject verification.

 > Prototype pollution via console.table properties (Low)(CVE-2022-21824)

 > Due to the formatting logic of the console.table() function it was not safe
 > to allow user controlled input to be passed to the properties parameter
 > while simultaneously passing a plain object with at least one property as
 > the first parameter, which could be __proto__.  The prototype pollution has
 > very limited control, in that it only allows an empty string to be assigned
 > numerical keys of the object prototype.

 > For details, see the advisory:
 > https://nodejs.org/en/blog/vulnerability/jan-2022-security-releases/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.11.x, thanks.

For 2021.02.x I will instead bump to 12.22.9 which contains the same
fixes.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
