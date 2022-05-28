Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A359BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 09:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 502E884CD6;
	Sat, 28 May 2022 09:09:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K1DaQN4wCUUp; Sat, 28 May 2022 09:09:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7799B84CB3;
	Sat, 28 May 2022 09:09:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DE2F1BF5DA
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A29C40B1A
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:09:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f4TfLZnqOXPA for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 09:09:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52A77405B2
 for <buildroot@buildroot.org>; Sat, 28 May 2022 09:09:11 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 44AE5100005;
 Sat, 28 May 2022 09:09:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nusRX-0030ZI-Cy; Sat, 28 May 2022 11:09:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Leger Charlie <c.leger@borea-dental.com>
References: <20220504094006.1541643-1-c.leger@borea-dental.com>
Date: Sat, 28 May 2022 11:09:07 +0200
In-Reply-To: <20220504094006.1541643-1-c.leger@borea-dental.com> (Leger
 Charlie's message of "Wed, 4 May 2022 11:40:06 +0200")
Message-ID: <874k1ac9cc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] linux:linux.mk: Add "firmware-imx"
 dependency if needed
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

>>>>> "Leger" == Leger Charlie <c.leger@borea-dental.com> writes:

 > Since SDMA firmwares for imx[6,7,8] are now provided only by firmware-imx package and not linux-firmware package [1].
 > Linux build can failed if depending on firmware imx, so add firmware-imx dependency on linux if package is checked.

 > [1] http://lists.busybox.net/pipermail/buildroot/2021-January/603807.html

 > Signed-off-by: Leger Charlie <c.leger@borea-dental.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
