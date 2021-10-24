Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B02C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 15:20:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B328660F21
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 15:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B328660F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CC2F607D0;
	Sun, 24 Oct 2021 15:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 40LHmRDRAA6A; Sun, 24 Oct 2021 15:20:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2ACE60764;
	Sun, 24 Oct 2021 15:20:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2D9B1BF36E
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 15:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDFAA60764
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 15:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqx4aggrkGpL for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 15:20:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 650AC605AD
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 15:20:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C2FE8100002;
 Sun, 24 Oct 2021 15:20:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mefIU-0004Id-UB; Sun, 24 Oct 2021 17:20:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, fontaine.fabrice@gmail.com
References: <20211021064029.31168-1-peter@korsgaard.com>
 <20211024161541.3258ff38@windsurf> <87zgqyxxwi.fsf@dell.be.48ers.dk>
Date: Sun, 24 Oct 2021 17:20:30 +0200
In-Reply-To: <87zgqyxxwi.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 24 Oct 2021 17:09:17 +0200")
Message-ID: <87v91mxxdt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.21.1
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
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >>> Fixes the following security issues:

 >> I have applied to master, but what's quite worrying is that there were
 >> 0 CVEs affecting asterisk in version 16.14.1 according to
 >> http://autobuild.buildroot.net/stats/master.html. Does this mean that
 >> the Asterisk community is not submitting CVEs for their security
 >> vulnerabilities ?

 > Looks like it. I also didn't find any CVE references in the description
 > of the issues I listed :/

Looking closer, there are in fact CVEs for some of the issues, E.G.:

https://downloads.asterisk.org/pub/security/AST-2021-001.html

But that refers to a digium:asterisk CPE rather than the
asterisk:open_source one we look for.

Looking at the CPE database, we should probably use that CPE identifier
instead as it looks much more actively used (1154 entries vs 61):

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adigium%3Aasterisk%3A*%3A*%3A*%3A*%3A*%3A*%3A*%3A*

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aasterisk%3Aopen_source%3A*%3A*%3A*%3A*%3A*%3A*%3A*%3A*

Fabrice, you added the CPE variables for asterisk. Any specific reason
to use asterisk/open_source?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
