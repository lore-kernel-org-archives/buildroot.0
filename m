Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BFCECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 19:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D381640503;
	Wed, 21 Sep 2022 19:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D381640503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1iols8kWiGz; Wed, 21 Sep 2022 19:55:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E543B40180;
	Wed, 21 Sep 2022 19:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E543B40180
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 331A11BF3F0
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EBE6826DF
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 19:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EBE6826DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUDC4SuYjFS6 for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 19:55:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA7B1817B5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA7B1817B5
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 19:55:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0CFB560007;
 Wed, 21 Sep 2022 19:55:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ob5of-002MBG-Kp; Wed, 21 Sep 2022 21:55:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <24827_1662976661_631F0295_24827_299_14_6f9b848a35cb9647b133c662924b4d82cf759b19.1662976659.git.yann.morin@orange.com>
 <20220917103829.02943c4c@windsurf>
Date: Wed, 21 Sep 2022 21:55:29 +0200
In-Reply-To: <20220917103829.02943c4c@windsurf> (Thomas Petazzoni's message of
 "Sat, 17 Sep 2022 10:38:29 +0200")
Message-ID: <874jx0ec3y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/mosquitto: add mosquitto group
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Francois Perrad <fperrad@gmail.com>, yann.morin@orange.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Mon, 12 Sep 2022 11:57:39 +0200
 > <yann.morin@orange.com> wrote:

 >> From: "Yann E. MORIN" <yann.morin@orange.com>
 >> 
 >> Since version 2.0.15, and upstream commit 71a90177d7b2 (Systemd: Add
 >> mosquitto group ownership), mosquitto uses its own group rather than
 >> the generic nobody group.
 >> 
 >> This means that mosauitto can now no longer start ona  systemd-based
 >> system.
 >> 
 >> Change our mosquitto user definition to specify a mosquitto group.
 >> 
 >> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 >> Cc: Peter Korsgaard <peter@korsgaard.com>
 >> Cc: Titouan Christophe <titouanchristophe@gmail.com>
 >> Cc: Francois Perrad <fperrad@gmail.com>
 >> ---
 >> package/mosquitto/mosquitto.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Applied to master, thanks.

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
