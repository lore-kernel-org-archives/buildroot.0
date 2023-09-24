Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8A0CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 09:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6FA541775;
	Sun, 24 Sep 2023 09:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6FA541775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7V5tx5lftD5P; Sun, 24 Sep 2023 09:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D037A41776;
	Sun, 24 Sep 2023 09:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D037A41776
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0B491BF403
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 09:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA8BB408C0
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 09:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA8BB408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HYgLdwI9po6W for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 09:54:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E58540297
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 09:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E58540297
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFD161C0003;
 Sun, 24 Sep 2023 09:54:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkLob-0002Ib-In; Sun, 24 Sep 2023 11:54:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230923092414.4075194-1-peter@korsgaard.com>
 <20230924090226.GF1469982@scaer>
Date: Sun, 24 Sep 2023 11:54:13 +0200
In-Reply-To: <20230924090226.GF1469982@scaer> (Yann E. MORIN's message of
 "Sun, 24 Sep 2023 11:02:26 +0200")
Message-ID: <874jjjrj5m.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libpjsip: security bump to version
 2.13.1
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2023-09-23 11:24 +0200, Peter Korsgaard spake thusly:
 >> Fixes the following security vulnerability:
 >> 
 >> - CVE-2023-27585: Heap buffer overflow when parsing DNS packet
 >> https://github.com/pjsip/pjproject/security/advisories/GHSA-q9cp-8wcq-7pfr
 >> 
 >> Drop now upstreamed security fixes for CVE-2022-23537 and CVE-2022-23547.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> ...ull-request-from-GHSA-9pfh-r8x4-w26w.patch | 99 -------------------
 >> ...ull-request-from-GHSA-cxwq-5g9x-x7fr.patch | 54 ----------

 >     $ make check-package
 >     .checkpackageignore:743: ignored file package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch is missing
 >     .checkpackageignore:744: ignored file package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch is missing

 > Applied to master with the above fixed, thanks.

Argh, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
