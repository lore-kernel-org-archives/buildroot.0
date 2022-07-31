Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36383C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 06:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE49860E08;
	Sun, 31 Jul 2022 06:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE49860E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqzD0FT1CyFX; Sun, 31 Jul 2022 06:20:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC59A60BBE;
	Sun, 31 Jul 2022 06:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC59A60BBE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17E831BF5A0
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 06:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0024060AE9
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 06:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0024060AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CeC1UXLP1GuR for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 06:18:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D3A6605A0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D3A6605A0
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 06:18:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2F28C60002;
 Sun, 31 Jul 2022 06:18:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oI2Hj-004inW-GX; Sun, 31 Jul 2022 08:18:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220708071718.115323-1-peter@korsgaard.com>
 <87let38iaf.fsf@dell.be.48ers.dk>
Date: Sun, 31 Jul 2022 08:18:43 +0200
In-Reply-To: <87let38iaf.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 08 Jul 2022 22:24:08 +0200")
Message-ID: <87mtcppzy4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 1.1.1q
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
 >> Fixes the following security issues:
 >> AES OCB fails to encrypt some bytes (CVE-2022-2097)
 >> ===================================================

 >> Severity: MODERATE

 >> AES OCB mode for 32-bit x86 platforms using the AES-NI assembly optimised
 >> implementation will not encrypt the entirety of the data under some
 >> circumstances.  This could reveal sixteen bytes of data that was
 >> preexisting in the memory that wasn't written.  In the special case of
 >> "in place" encryption, sixteen bytes of the plaintext would be revealed.

 >> Since OpenSSL does not support OCB based cipher suites for TLS and DTLS,
 >> they are both unaffected.

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
