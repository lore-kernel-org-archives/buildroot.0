Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E6FC77B7A
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 19:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 813104167F;
	Tue, 30 May 2023 19:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 813104167F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KP1EgeyiY6zf; Tue, 30 May 2023 19:40:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 028CD41615;
	Tue, 30 May 2023 19:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 028CD41615
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93D521BF35F
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A46981FA7
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:40:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A46981FA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgC0DCi2XiUW for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 19:40:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48E3A81F64
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48E3A81F64
 for <buildroot@buildroot.org>; Tue, 30 May 2023 19:40:30 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27295E0004;
 Tue, 30 May 2023 19:40:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q45Cl-009rnL-9R; Tue, 30 May 2023 21:40:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Daniel Lang <dalang@gmx.at>
References: <20230505192743.6844-1-dalang@gmx.at>
Date: Tue, 30 May 2023 21:40:27 +0200
In-Reply-To: <20230505192743.6844-1-dalang@gmx.at> (Daniel Lang's message of
 "Fri, 5 May 2023 21:27:43 +0200")
Message-ID: <87v8g9obf8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ncurses: security bump to
 6.4.20230429
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

>>>>> "Daniel" == Daniel Lang <dalang@gmx.at> writes:

 > Update to 6.4 and use latest snapshot to fix CVE-2023-29491.
 > COPYING has been changed in snapshot 20230107 to update the year [0].
 > Update CVE version to major.minor.snapshot, as NVD uses the snapshot
 > date as patch version [1].

 > [0]:
 > https://github.com/ThomasDickey/ncurses-snapshots/commit/eedb756850fdddcd2767d488ed5ea323d40b37ec
 > [1]:
 > https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:ncurses

 > Signed-off-by: Daniel Lang <dalang@gmx.at>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
