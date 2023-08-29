Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257B3C83F14
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 16:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B31D7414B9;
	Tue, 29 Aug 2023 16:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B31D7414B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BDYD52lA__57; Tue, 29 Aug 2023 16:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1ACD04149D;
	Tue, 29 Aug 2023 16:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ACD04149D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5C241BF3EA
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 16:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC6F04149D
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 16:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC6F04149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ra1qdRCsc6am for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 16:58:08 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55A294023F
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 16:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55A294023F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3925340009;
 Tue, 29 Aug 2023 16:58:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qb22W-008Ll7-2R; Tue, 29 Aug 2023 18:58:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230722080313.3515304-1-bernd@kuhls.net>
Date: Tue, 29 Aug 2023 18:58:03 +0200
In-Reply-To: <20230722080313.3515304-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 22 Jul 2023 10:03:13 +0200")
Message-ID: <87bkep4wh0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-tss: security bump version
 to 3.2.2
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Fixes CVE-2023-22745.
 > Changelog:
 > https://github.com/tpm2-software/tpm2-tss/blob/3.2.x/CHANGELOG.md

 > Changed the ac_cv_prog variables due to an upstream commit which changed
 > the detection of groupadd/useradd:
 > https://github.com/tpm2-software/tpm2-tss/commit/7fde604383c62fc764a1e060dff48fc06f79860b

 > Buildroot commit a85f5f2a412db894fdf548e10d12e7c56eda9107 bumped
 > tpm2-pkcs11 to 1.8.0 which includes a commit bumping the required
 > version of tpm2-tss to >= 3.2
 > https://github.com/tpm2-software/tpm2-pkcs11/commit/940b661e330cac0ecc7d4db5d3626ef828ecdda8

 > Fixes:
 > http://autobuild.buildroot.net/results/6fd/6fddfee6f852ce835c5d1178e6913b6ab1b3fe50/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
