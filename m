Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F6CC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 13:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5363C610C6;
	Sat, 11 Nov 2023 13:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5363C610C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BNTJ9gYiU9_Y; Sat, 11 Nov 2023 13:43:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8D1B60AA5;
	Sat, 11 Nov 2023 13:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8D1B60AA5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91BF21BF577
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 13:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A48A40C01
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 13:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A48A40C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljGFYCbD-KbI for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 13:42:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3854B40A45
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 13:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3854B40A45
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3226FF805;
 Sat, 11 Nov 2023 13:42:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r1oGF-006U3D-0v;
 Sat, 11 Nov 2023 14:42:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Oleg Lyovin via buildroot <buildroot@buildroot.org>
References: <20231107132323.3324587-1-ovlevin@salutedevices.com>
Date: Sat, 11 Nov 2023 14:42:55 +0100
In-Reply-To: <20231107132323.3324587-1-ovlevin@salutedevices.com> (Oleg Lyovin
 via buildroot's message of "Tue, 7 Nov 2023 16:23:23 +0300")
Message-ID: <87bkc0iexs.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package: dhcpcd: fix dhcpcd binary not
 stripped
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
Cc: John Stile <johns@msli.com>, olegartys@gmail.com,
 Oleg Lyovin <ovlevin@salutedevices.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Oleg" == Oleg Lyovin via buildroot <buildroot@buildroot.org> writes:

 > By default dhcpcd installed with 555 permissions as it is
 > configured in its Makefile.inc. Since 'w' bit is missing,
 > strip fails and dhcpcd binary installed non-stripped.

 > On ARM GCC 12 glibc configuration strip saves over 1MB of disk space.

 > Signed-off-by: Oleg Lyovin <ovlevin@salutedevices.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
