Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B62C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 10:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBD4140395;
	Sun, 18 Dec 2022 10:31:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBD4140395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id at11LYi3ClAb; Sun, 18 Dec 2022 10:31:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 324A240105;
	Sun, 18 Dec 2022 10:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 324A240105
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08E801BF5A9
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 10:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6C5340984
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 10:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C5340984
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RlstgZ_f1JyS for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 10:31:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D71D40983
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D71D40983
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 10:31:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 48A011C0002;
 Sun, 18 Dec 2022 10:31:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p6qxK-003Xsd-8r; Sun, 18 Dec 2022 11:31:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221214222658.14115-1-fontaine.fabrice@gmail.com>
Date: Sun, 18 Dec 2022 11:31:42 +0100
In-Reply-To: <20221214222658.14115-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 14 Dec 2022 23:26:58 +0100")
Message-ID: <87tu1tove9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.28.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following security issues:
 > - Fix potential heap buffer overread and overwrite in DTLS if
 >   MBEDTLS_SSL_DTLS_CONNECTION_ID is enabled and
 >   MBEDTLS_SSL_CID_IN_LEN_MAX > 2 * MBEDTLS_SSL_CID_OUT_LEN_MAX.
 > - An adversary with access to precise enough information about memory
 >   accesses (typically, an untrusted operating system attacking a secure
 >   enclave) could recover an RSA private key after observing the victim
 >   performing a single private-key operation if the window size used for
 >   the exponentiation was 3 or smaller.

 > Drop patch (already in version:
 > https://github.com/Mbed-TLS/mbedtls/commit/9d9d45c6b2aeaedfdfdadfec3d05d168db685968)

 > https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
