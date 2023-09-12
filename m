Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7737FCA0EC3
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 06:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CABD761060;
	Tue, 12 Sep 2023 06:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CABD761060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbaLXkn05yKF; Tue, 12 Sep 2023 06:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27F5660B0B;
	Tue, 12 Sep 2023 06:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27F5660B0B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB3581BF3A3
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92CC581F62
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:06:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92CC581F62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GysoNrmZ20qv for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 06:06:08 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1836481F5D
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 06:06:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1836481F5D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2979BE001D;
 Tue, 12 Sep 2023 06:05:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfwWD-00G07R-6x; Tue, 12 Sep 2023 08:05:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexey Roslyakov <alexey.roslyakov@gmail.com>
References: <20230812050845.1551717-1-alexey.roslyakov@gmail.com>
Date: Tue, 12 Sep 2023 08:05:01 +0200
In-Reply-To: <20230812050845.1551717-1-alexey.roslyakov@gmail.com> (Alexey
 Roslyakov's message of "Sat, 12 Aug 2023 13:08:45 +0800")
Message-ID: <87h6o07wqa.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] board/raspberrypi: enable hdmi console
 for systemd
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

>>>>> "Alexey" == Alexey Roslyakov <alexey.roslyakov@gmail.com> writes:

 > Most of the users use HDMI console on RPi and with increasing popularity
 > of systemd they face a trouble.
 > systemd doesn't use /etc/inittab, enable getty@tty1.service instead.

 > Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
