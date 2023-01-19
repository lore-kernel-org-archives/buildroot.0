Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A53C38142
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4624F60C16;
	Thu, 19 Jan 2023 10:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4624F60C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vI71vvdf-OIF; Thu, 19 Jan 2023 10:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E10860A68;
	Thu, 19 Jan 2023 10:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E10860A68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63E391BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CA5D82241
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CA5D82241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P16o_XeoPBja for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:04:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9990821E1
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9990821E1
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:04:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E71E410000E;
 Thu, 19 Jan 2023 10:04:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pIRmH-009ln2-RG; Thu, 19 Jan 2023 11:04:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
References: <20230119095842.445227-1-bagasdotme@gmail.com>
Date: Thu, 19 Jan 2023 11:04:13 +0100
In-Reply-To: <20230119095842.445227-1-bagasdotme@gmail.com> (Bagas Sanjaya's
 message of "Thu, 19 Jan 2023 16:58:42 +0700")
Message-ID: <87cz7aden6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/git: prefer OpenSSL SHA-1 and
 SHA-256 implementation
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bagas" == Bagas Sanjaya <bagasdotme@gmail.com> writes:

 > Git is shipped with its own implementation of SHA-1 and SHA-256.
 > However, when OpenSSL is available (BR2_PACKAGE_OPENSSL=y), it is
 > preferable to leverage the OpenSSL version of these hash algorithm
 > instead. --with-openssl configure flag doesn't enable that, though.

 > Set OPENSSL_{SHA1,SHA256} make variable when OpenSSL package is
 > selected.

 > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

What is the added value of doing this? Size? Speed? Why is it not the
upstream default?

A quick search for git + OPENSSL_SHA1 lead me to:

https://www.spinics.net/lists/git/msg125401.html

Which is old, but argued for not using the openssl implementation
because of performance concerns.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
