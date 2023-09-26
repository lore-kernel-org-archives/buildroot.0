Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3478E7D0C5
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 05:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 635E94178A;
	Tue, 26 Sep 2023 05:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 635E94178A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPWP0tjuD4Jh; Tue, 26 Sep 2023 05:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF66641786;
	Tue, 26 Sep 2023 05:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF66641786
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 941CB1BF33A
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 05:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E8BF60EC6
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 05:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E8BF60EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6812lBjqQYkK for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 05:47:30 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8587D60D51
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 05:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8587D60D51
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4D47E0005;
 Tue, 26 Sep 2023 05:47:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ql0ur-002xp9-Rh; Tue, 26 Sep 2023 07:47:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jens Maus via buildroot <buildroot@buildroot.org>
References: <20230917202917.1391442-1-mail@jens-maus.de>
Date: Tue, 26 Sep 2023 07:47:25 +0200
In-Reply-To: <20230917202917.1391442-1-mail@jens-maus.de> (Jens Maus via
 buildroot's message of "Sun, 17 Sep 2023 22:29:17 +0200")
Message-ID: <87r0mlbi4y.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/fio: remove native build to fix
 crashes
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
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Jens Maus <mail@jens-maus.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jens" == Jens Maus via buildroot <buildroot@buildroot.org> writes:

 > Per default, the fio package uses the "-march=native" GCC option. This,
 > however can result in "illegal instructions" when fio is compiled in a
 > cross compile environment where the target machine will have a different
 > cpu feature set than the compilation environment. Thus we make sure fio
 > will not use that compiler option by adding --disable-native to
 > FIO_OPTS.

 > Signed-off-by: Jens Maus <mail@jens-maus.de>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
