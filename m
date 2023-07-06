Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6A5EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D1174027F;
	Thu,  6 Jul 2023 11:48:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D1174027F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZdN4yTpNNdbS; Thu,  6 Jul 2023 11:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7D0840139;
	Thu,  6 Jul 2023 11:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7D0840139
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 430061BF345
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AFF14069B
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AFF14069B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qFMnzwZcZzg for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:47:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED80C402BE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED80C402BE
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:47:55 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1A246000D;
 Thu,  6 Jul 2023 11:47:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qHNSh-003F7b-RL; Thu, 06 Jul 2023 13:47:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20230624081007.19409-1-ps.report@gmx.net>
Date: Thu, 06 Jul 2023 13:47:51 +0200
In-Reply-To: <20230624081007.19409-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 24 Jun 2023 10:10:07 +0200")
Message-ID: <87sfa11ct4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/mesa3d: fix
 002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Update 002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch to
 > fix an syntax error introduced by commit 'package/{mesa3d, mesa3d-headers}:
 > bump version to 23.1.0' ([1])

 > Fixes:

 >   .../build/mesa3d-23.1.2/src/gallium/drivers/vc4/meson.build:87:76: ERROR:
 >   Trying to compare values of different types (UserFeatureOption, str) using !=.
 >   This was deprecated and undefined behavior previously and is as of 0.60.0 a hard error.

 > [1] https://git.buildroot.net/buildroot/commit/?id=e6203db11ed40122a2d9f29012db5683a7eb10d0

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
