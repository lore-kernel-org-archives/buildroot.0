Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE05C76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 243E2613B7;
	Mon, 10 Apr 2023 19:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 243E2613B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HcbKo38Vhe3h; Mon, 10 Apr 2023 19:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F96F61399;
	Mon, 10 Apr 2023 19:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F96F61399
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC2261BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0281408CF
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0281408CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuQCjQhbVOrF for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:05:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EC5C408C4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EC5C408C4
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:05:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD486240003;
 Mon, 10 Apr 2023 19:05:55 +0000 (UTC)
Received: from peko by be.duckdns.org with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1plwpu-0038Ie-Jh; Mon, 10 Apr 2023 21:05:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230320171543.1076609-1-fontaine.fabrice@gmail.com>
Date: Mon, 10 Apr 2023 21:05:54 +0200
In-Reply-To: <20230320171543.1076609-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 20 Mar 2023 18:15:43 +0100")
Message-ID: <87ile3woa5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sudo: security bump to version
 1.9.13p3
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

 > - Fix CVE-2023-27320: Sudo before 1.9.13p3 has a double free in the
 >   per-command chroot feature.
 > - Update patch
 > - Update hash of LICENSE.md (year and indentation updated:
 >   https://github.com/sudo-project/sudo/commit/dd934d6a218c05d2df61b5306e38c71edaa6ac59
 >   https://github.com/sudo-project/sudo/commit/e5634ae99184d50afbdcb8a69dd4018b1a14871d)

 > https://www.sudo.ws/security/advisories/double_free
 > https://www.sudo.ws/releases/stable/#1.9.13p3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
