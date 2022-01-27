Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0510CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 16:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A1061037;
	Thu, 27 Jan 2022 16:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUweCUB0igEX; Thu, 27 Jan 2022 16:47:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCB0960AA3;
	Thu, 27 Jan 2022 16:47:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28C6B1C1135
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1729941C6D
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgEB3QAZOrPH for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 16:47:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D571410A0
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 16:47:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C907EC0004;
 Thu, 27 Jan 2022 16:47:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nD7vT-00064v-V1; Thu, 27 Jan 2022 17:47:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220109162602.909E582A93@busybox.osuosl.org>
Date: Thu, 27 Jan 2022 17:47:11 +0100
In-Reply-To: <20220109162602.909E582A93@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 9 Jan 2022 17:31:55 +0100")
Message-ID: <87o83xazxs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] support/scripts/pkg-stats: account for
 unsure CVEs
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=a206bbc5fe3453f8763268261c4a7aa6ba2c275d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The .affects() method of the CVE class in support/scripts/cve.py can
 > return 3 values: CVE_AFFECTS, CVE_DOESNT_AFFECT and CVE_UNKNOWN.

 > We of course properly account for CVEs where .affects() return
 > CVE_AFFECTS, but the ones for which CVE_UNKNOWN is returned are
 > currently ignored, and therefore treated as if they did not affect the
 > package.

 > However CVE_UNKNOWN in fact indicates that the v_start/v_end fields of
 > the CPE entry could not be parsed by
 > distutils.version.LooseVersion(). Instead of ignoring such cases, this
 > commit adds support for the concept of "unsure CVEs", which will be
 > listed next to CVEs known to affect the package, so that we are aware
 > of them and can investigate the version issue.

 > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
