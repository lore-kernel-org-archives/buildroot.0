Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9ECC6FA82
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 21:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11EDF843E1;
	Sat, 17 Sep 2022 21:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11EDF843E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhwYxaFlh1wC; Sat, 17 Sep 2022 21:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31AD2843B6;
	Sat, 17 Sep 2022 21:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31AD2843B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6C441BF3CE
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90D5960ADE
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D5960ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPWcG2SL6oLU for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 21:35:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6850E60AC0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6850E60AC0
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 21:35:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F1AC40002;
 Sat, 17 Sep 2022 21:35:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZfTg-009bF8-PO; Sat, 17 Sep 2022 23:35:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Lang Daniel via buildroot <buildroot@buildroot.org>
References: <VI1P190MB0493923502DA9C7C7BD25EFC9F449@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Date: Sat, 17 Sep 2022 23:35:56 +0200
In-Reply-To: <VI1P190MB0493923502DA9C7C7BD25EFC9F449@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 (Lang Daniel via buildroot's message of "Mon, 12 Sep 2022 06:11:05
 +0000")
Message-ID: <87h715y98j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 4/4] package/polkit: bump to version 121
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
Cc: Lang Daniel <d.lang@abatec.at>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Lang" == Lang Daniel via buildroot <buildroot@buildroot.org> writes:

 > https://gitlab.freedesktop.org/polkit/polkit/-/blob/121/NEWS.md
 > Highlights:
 > - new versioning
 > - duktape added as backend JS engine
 > - autotools build system removed
 > - new translations

 > Signed-off-by: Daniel Lang <d.lang@abatec.at>
 > ---

> +++ b/package/polkit/polkit.mk
 > @@ -4,14 +4,14 @@
 >  #
 >  ################################################################################
 
 > -POLKIT_VERSION = a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
 > -POLKIT_SITE = https://gitlab.freedesktop.org/polkit/polkit/-/archive/$(POLKIT_VERSION)
 > +POLKIT_VERSION = 121
 > +POLKIT_SITE = https://www.freedesktop.org/software/polkit/releases
 >  POLKIT_LICENSE = GPL-2.0
 >  POLKIT_LICENSE_FILES = COPYING
 >  POLKIT_CPE_ID_VENDOR = polkit_project
 >  POLKIT_INSTALL_STAGING = YES
 
 > -# Fix was comitted in a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
 > +# Fix was comitted in version 121
 >  POLKIT_IGNORE_CVES += CVE-2021-4034

The issue is indeed fixed in release 121, so we need to contact
nvd@nist.gov to get them to correct the CVE entry so the configuration
lists <= 120.

See https://nvd.nist.gov/vuln/detail/CVE-2021-26720 for an example.

Committed with the _IGNORE_CVES line removed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
