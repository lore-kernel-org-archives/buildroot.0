Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA74C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:21:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E88CF619E5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E88CF619E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB997823F4;
	Wed, 17 Nov 2021 21:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PDEDw797zPMl; Wed, 17 Nov 2021 21:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 262A6823A7;
	Wed, 17 Nov 2021 21:21:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19AAF1BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 168ED823A7
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gLDm7zv6sTOH for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:21:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8D7E823A0
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:21:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E2FECE0008;
 Wed, 17 Nov 2021 21:21:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mnSMw-00054V-28; Wed, 17 Nov 2021 22:21:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20211110055844.327639-1-bernd.kuhls@t-online.de>
Date: Wed, 17 Nov 2021 22:21:26 +0100
In-Reply-To: <20211110055844.327639-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 10 Nov 2021 06:58:44 +0100")
Message-ID: <877dd6v5pl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.14.10
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://www.samba.org/samba/history/samba-4.14.10.html

 > This is a security release in order to address the following defects:

 > o CVE-2016-2124:  SMB1 client connections can be downgraded to plaintext
 >                   authentication.
 >                   https://www.samba.org/samba/security/CVE-2016-2124.html

 > o CVE-2020-25717: A user on the domain can become root on domain members.
 >                   https://www.samba.org/samba/security/CVE-2020-25717.html
 >                   (PLEASE READ! There are important behaviour changes described)

 > o CVE-2020-25718: Samba AD DC did not correctly sandbox Kerberos tickets issued
 >                   by an RODC.
 >                   https://www.samba.org/samba/security/CVE-2020-25718.html

 > o CVE-2020-25719: Samba AD DC did not always rely on the SID and PAC in Kerberos
 >                   tickets.
 >                   https://www.samba.org/samba/security/CVE-2020-25719.html

 > o CVE-2020-25721: Kerberos acceptors need easy access to stable AD identifiers
 >                   (eg objectSid).
 >                   https://www.samba.org/samba/security/CVE-2020-25721.html

 > o CVE-2020-25722: Samba AD DC did not do suffienct access and conformance
 >                   checking of data stored.
 >                   https://www.samba.org/samba/security/CVE-2020-25722.html

 > o CVE-2021-3738:  Use after free in Samba AD DC RPC server.
 >                   https://www.samba.org/samba/security/CVE-2021-3738.html

 > o CVE-2021-23192: Subsequent DCE/RPC fragment injection vulnerability.
 >                   https://www.samba.org/samba/security/CVE-2021-23192.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
