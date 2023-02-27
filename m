Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB35C64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 14:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26B4A40A20;
	Mon, 27 Feb 2023 14:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26B4A40A20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybCl6sX98Mfi; Mon, 27 Feb 2023 14:47:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DCC4409D9;
	Mon, 27 Feb 2023 14:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DCC4409D9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A2DF1BF2A2
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1458481EE0
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1458481EE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tf5jLH_4DRjU for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 14:47:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FB2E81EDC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FB2E81EDC
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 14:47:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C53194000D;
 Mon, 27 Feb 2023 14:47:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pWemQ-009FP1-V2; Mon, 27 Feb 2023 15:47:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230226135503.112605-1-fontaine.fabrice@gmail.com>
Date: Mon, 27 Feb 2023 15:47:06 +0100
In-Reply-To: <20230226135503.112605-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 26 Feb 2023 14:55:03 +0100")
Message-ID: <875ybnnp1x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libpjsip: fix CVE-2022-235{3,
 4}7
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > https://github.com/pjsip/pjproject/security/advisories/GHSA-9pfh-r8x4-w26w
 > https://github.com/pjsip/pjproject/security/advisories/GHSA-cxwq-5g9x-x7fr

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  ...ull-request-from-GHSA-9pfh-r8x4-w26w.patch | 99 +++++++++++++++++++
 >  package/libpjsip/libpjsip.mk                  |  6 ++
 >  2 files changed, 105 insertions(+)
 >  create mode 100644 package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch

..

 > +# 0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
 > +LIBPJSIP_IGNORE_CVES += CVE-2022-23537
 > +
 > +# 0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
 > +LIBPJSIP_IGNORE_CVES += CVE-2022-23547

Did you forget to git add the patch for
0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
