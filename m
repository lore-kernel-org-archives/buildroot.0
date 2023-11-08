Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F174C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 12:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3F42408DF;
	Wed,  8 Nov 2023 12:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F42408DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-5NHbcB-PTi; Wed,  8 Nov 2023 12:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41F03404A9;
	Wed,  8 Nov 2023 12:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41F03404A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3301BF4E4
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 12:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67C2B8135F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 12:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67C2B8135F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dV09H6dQ9mre for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 12:19:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E84DC8127C
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 12:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E84DC8127C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00BE1240005;
 Wed,  8 Nov 2023 12:19:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0hXH-000HBY-1P;
 Wed, 08 Nov 2023 13:19:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231016180855.69848-1-bernd@kuhls.net>
 <20231101223659.3daf8e1a@windsurf>
Date: Wed, 08 Nov 2023 13:19:55 +0100
In-Reply-To: <20231101223659.3daf8e1a@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 1 Nov 2023 22:36:59 +0100")
Message-ID: <8734xgtp1w.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.19.2
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Mon, 16 Oct 2023 20:08:55 +0200
 > Bernd Kuhls <bernd@kuhls.net> wrote:

 >> Fixes CVE-2023-5568:
 >> Heap buffer overflow with freshness tokens in the Heimdal KDC in Samba 4.19
 >> 
 >> Release notes:
 >> https://www.samba.org/samba/history/samba-4.19.2.html
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 >> ---
 >> package/samba4/samba4.hash | 4 ++--
 >> package/samba4/samba4.mk   | 2 +-
 >> 2 files changed, 3 insertions(+), 3 deletions(-)

 > Applied to master, thanks.

From the looks of it, this only affects 4.19.x and not the 4.18.8 we
have in 2023.02.x / 2023.08.x, right?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
