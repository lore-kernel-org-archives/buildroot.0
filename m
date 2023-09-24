Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EF4CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 19:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1AB560ADE;
	Sun, 24 Sep 2023 19:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1AB560ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_bPd_Ph_mmw; Sun, 24 Sep 2023 19:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0211860E1D;
	Sun, 24 Sep 2023 19:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0211860E1D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FA741BF2A9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3766C40A95
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3766C40A95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cux_xxYSP8Ga for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 19:20:14 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39D75400B9
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 19:20:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39D75400B9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E3A5FF802;
 Sun, 24 Sep 2023 19:20:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkUeI-000GYz-0t; Sun, 24 Sep 2023 21:20:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230915221622.207938-1-fontaine.fabrice@gmail.com>
Date: Sun, 24 Sep 2023 21:20:10 +0200
In-Reply-To: <20230915221622.207938-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 16 Sep 2023 00:16:22 +0200")
Message-ID: <87cyy7idjp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/freerdp: security bump to
 version 2.11.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2023-39350 to CVE-2023-39354, CVE-2023-39356, CVE-2023-40181,
 >   CVE-2023-40186, CVE-2023-40188, CVE-2023-40567, CVE-2023-40569 and
 >   CVE-2023-40589
 > - Drop fourth patch (already in version)

 > https://github.com/FreeRDP/FreeRDP/releases/tag/2.11.0
 > https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-rrrv-3w42-pffh
 > https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-q9x9-cqjc-rgwq
 > https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-whwr-qcf2-2mvj
 > https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-hg53-9j9h-3c8f
 > https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-c3r2-pxxp-f8r6
 > https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-q5v5-qhj5-mh6m
 > https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-mxp4-rx7x-h2g8
 > https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-hcj4-3c3r-5j3v
 > https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-9w28-wwj5-p4xq
 > https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-2w9f-8wg4-8jfp
 > https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-hm8c-rcjg-c8qp
 > https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-gc34-mw6m-g42x

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
