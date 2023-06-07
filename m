Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00544C7EE43
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 20:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B613832C9;
	Wed,  7 Jun 2023 20:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B613832C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-DnEtF-d0mZ; Wed,  7 Jun 2023 20:21:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E48183276;
	Wed,  7 Jun 2023 20:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E48183276
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EA7D1BF3D0
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 20:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 283FD610E5
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 20:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 283FD610E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otVzti1J9TbJ for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 20:21:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E7B60FE7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8E7B60FE7
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 20:21:38 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F6A11C0005;
 Wed,  7 Jun 2023 20:21:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q6zew-00G0GH-5h; Wed, 07 Jun 2023 22:21:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230607171708.595774-1-bernd.kuhls@t-online.de>
Date: Wed, 07 Jun 2023 22:21:34 +0200
In-Reply-To: <20230607171708.595774-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 7 Jun 2023 19:17:08 +0200")
Message-ID: <874jnj3twx.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libdeflate: force arm mode
 instead of Thumb mode
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fix the following build failure:
 > /tmp/ccGKQdKj.s: Assembler messages:
 > /tmp/ccGKQdKj.s:199: Error: invalid constant (7) after fixup
 > /tmp/ccGKQdKj.s:327: Error: invalid constant (0) after fixup
 > /tmp/ccGKQdKj.s:338: Error: invalid constant (1) after fixup
 > /tmp/ccGKQdKj.s:345: Error: invalid constant (20) after fixup
 > /tmp/ccGKQdKj.s:354: Error: invalid constant (20) after fixup
 > /tmp/ccGKQdKj.s:372: Error: invalid constant (20) after fixup
 > /tmp/ccGKQdKj.s:528: Error: invalid constant (3f) after fixup
 > /tmp/ccGKQdKj.s:531: Error: invalid constant (3f) after fixup
 > /tmp/ccGKQdKj.s:202: Error: invalid constant (20000) after fixup
 > /tmp/ccGKQdKj.s:482: Error: invalid constant (20000) after fixup
 > /tmp/ccGKQdKj.s:549: Error: invalid constant (20000) after fixup

 > Fixes:
 > http://autobuild.buildroot.net/results/0103d64a4a6a9b0a708bfb77bf1714edc7acc714/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
