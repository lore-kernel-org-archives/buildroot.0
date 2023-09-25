Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A016CE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 05:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67B281E7A;
	Mon, 25 Sep 2023 05:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D67B281E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J6lqAk8Y6ZBS; Mon, 25 Sep 2023 05:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38787817D3;
	Mon, 25 Sep 2023 05:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38787817D3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 729021BF3BB
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C2934013D
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C2934013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gf5t2ozcJQUu for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 05:40:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4475B40136
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 05:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4475B40136
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06FE940005;
 Mon, 25 Sep 2023 05:40:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkeKS-002FCE-Ee; Mon, 25 Sep 2023 07:40:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230920170711.3901-1-fontaine.fabrice@gmail.com>
Date: Mon, 25 Sep 2023 07:40:20 +0200
In-Reply-To: <20230920170711.3901-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 20 Sep 2023 19:07:11 +0200")
Message-ID: <87il7yerp7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 10.02.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2023-36664: Artifex Ghostscript through 10.01.2 mishandles
 >   permission validation for pipe devices (with the %pipe% prefix or the |
 >   pipe character prefix).
 > - Fix CVE-2023-38559: A buffer overflow flaw was found in
 >   base/gdevdevn.c:1973 in devn_pcx_write_rle() in ghostscript. This
 >   issue may allow a local attacker to cause a denial of service via
 >   outputting a crafted PDF file for a DEVN device with gs.
 > - Fix CVE-2023-38560: An integer overflow flaw was found in
 >   pcl/pl/plfont.c:418 in pl_glyph_name in ghostscript. This issue may
 >   allow a local attacker to cause a denial of service via transforming a
 >   crafted PCL file to PDF format.

 > https://ghostscript.readthedocs.io/en/gs10.02.0/News.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
