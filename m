Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E417FC61DB3
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 19:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9243D81DBF;
	Thu, 12 Jan 2023 19:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9243D81DBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCCy1iaJnBp6; Thu, 12 Jan 2023 19:30:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2F47813C7;
	Thu, 12 Jan 2023 19:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2F47813C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2016C1BF281
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EED9A41140
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EED9A41140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jun7XElo-cOY for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 19:29:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E46A141136
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E46A141136
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 19:29:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CCEE8E0004;
 Thu, 12 Jan 2023 19:29:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pG3Gt-003789-Ru; Thu, 12 Jan 2023 20:29:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230108203403.667276-1-fontaine.fabrice@gmail.com>
Date: Thu, 12 Jan 2023 20:29:55 +0100
In-Reply-To: <20230108203403.667276-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 8 Jan 2023 21:34:03 +0100")
Message-ID: <87bkn3a6vg.fsf@dell.be.48ers.dk>
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

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
