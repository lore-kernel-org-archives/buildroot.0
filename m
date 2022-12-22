Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAD2C4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 21:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07ED54046B;
	Thu, 22 Dec 2022 21:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07ED54046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jfw-ksz7RP00; Thu, 22 Dec 2022 21:23:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BECA403C8;
	Thu, 22 Dec 2022 21:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BECA403C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94E941BF2BE
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 21:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7604941694
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 21:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7604941694
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3GuLR2yQirON for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 21:23:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBF7041619
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBF7041619
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 21:23:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 81153FF805;
 Thu, 22 Dec 2022 21:23:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p8T1o-002g2G-HR; Thu, 22 Dec 2022 22:23:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221222152506.8310-1-fontaine.fabrice@gmail.com>
Date: Thu, 22 Dec 2022 22:23:00 +0100
In-Reply-To: <20221222152506.8310-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 22 Dec 2022 16:25:06 +0100")
Message-ID: <87lemzkua3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/exfat-utils: add CPE variables
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

 > cpe:2.3:a:exfat_project:exfat is a valid CPE identifier for this
 > package:

 >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aexfat_project%3Aexfat

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/exfat-utils/exfat-utils.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
 > index d13ec6bab8..704641dd0a 100644
 > --- a/package/exfat-utils/exfat-utils.mk
 > +++ b/package/exfat-utils/exfat-utils.mk
 > @@ -8,6 +8,8 @@ EXFAT_UTILS_VERSION = 1.3.0
 >  EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
 >  EXFAT_UTILS_LICENSE = GPL-2.0+
 >  EXFAT_UTILS_LICENSE_FILES = COPYING
 > +EXFAT_CPE_ID_VENDOR = exfat_project
 > +EXFAT_CPE_ID_PRODUCT = exfat

From check-package:

package/exfat-utils/exfat-utils.mk:11: possible typo: EXFAT_CPE_ID_VENDOR -> *EXFAT_UTILS*
package/exfat-utils/exfat-utils.mk:12: possible typo: EXFAT_CPE_ID_PRODUCT -> *EXFAT_UTILS*

Was this supposed to be for package/exfat instead?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
