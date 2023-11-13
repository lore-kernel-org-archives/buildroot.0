Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54EAC4167D
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 13:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80934820A0;
	Mon, 13 Nov 2023 13:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80934820A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id no7UEqs8zMjL; Mon, 13 Nov 2023 13:01:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D328A81ED8;
	Mon, 13 Nov 2023 13:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D328A81ED8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60A051BF476
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 13:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46162418FC
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 13:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46162418FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U334ljMB_ryq for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 13:01:04 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB90F41860
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 13:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB90F41860
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DD70C000E;
 Mon, 13 Nov 2023 13:01:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r2WYl-00BER4-2e;
 Mon, 13 Nov 2023 14:00:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Oleg Lyovin via buildroot <buildroot@buildroot.org>
References: <20231107132323.3324587-1-ovlevin@salutedevices.com>
Date: Mon, 13 Nov 2023 14:00:59 +0100
In-Reply-To: <20231107132323.3324587-1-ovlevin@salutedevices.com> (Oleg Lyovin
 via buildroot's message of "Tue, 7 Nov 2023 16:23:23 +0300")
Message-ID: <87bkbxg644.fsf@48ers.dk>
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

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
