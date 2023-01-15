Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84985C63797
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 20:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 167A761004;
	Sun, 15 Jan 2023 20:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 167A761004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F52ml4NeAAWx; Sun, 15 Jan 2023 20:16:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7273260FFC;
	Sun, 15 Jan 2023 20:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7273260FFC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EE3A1BF25F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 20:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57D4C60FFC
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 20:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57D4C60FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AsmonNySy8td for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 20:16:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E2C60FC7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40E2C60FC7
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 20:16:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 716C51C0002;
 Sun, 15 Jan 2023 20:16:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pH9Qw-005izd-Cs; Sun, 15 Jan 2023 21:16:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230108203403.667276-1-fontaine.fabrice@gmail.com>
Date: Sun, 15 Jan 2023 21:16:50 +0100
In-Reply-To: <20230108203403.667276-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 8 Jan 2023 21:34:03 +0100")
Message-ID: <87cz7f5z9p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libpjsip: security bump to
 version 2.13
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

 > - Fix CVE-2022-39269, CVE-2022-39244 and CVE-2022-31031:
 >   https://github.com/pjsip/pjproject/security/advisories/GHSA-wx5m-cj97-4wwg
 >   https://github.com/pjsip/pjproject/security/advisories/GHSA-fq45-m3f7-3mhj
 >   https://github.com/pjsip/pjproject/security/advisories/GHSA-26j7-ww69-c4qj
 > - Drop patch (already in version)
 > - libuuid configure option is available since
 >   https://github.com/pjsip/pjproject/commit/0b0488f17b41c5323028b522cc7323f2cd9b684c
 > - libupnp is an optional dependency since
 >   https://github.com/pjsip/pjproject/commit/82247cb8c0441d0eafd18cb69e6c7bf55fc6a088
 > - libsrtp is optional since
 >   https://github.com/pjsip/pjproject/commit/fe6cbbc39764cae8ff6789a98f8ef8e85c63445c

 > https://github.com/pjsip/pjproject/releases/tag/2.13

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
