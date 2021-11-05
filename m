Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE08C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 15:04:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C709E60EBC
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 15:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C709E60EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97109404CB;
	Fri,  5 Nov 2021 15:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eJhP0iYys0V3; Fri,  5 Nov 2021 15:04:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AB51404A7;
	Fri,  5 Nov 2021 15:04:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 121A21BF304
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 15:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3327616F4
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 15:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WA28R7WyqsTi for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 15:04:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E58AA61668
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 15:04:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 934D4C000B;
 Fri,  5 Nov 2021 15:04:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mj0l7-0005wA-TR; Fri, 05 Nov 2021 16:04:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211104231210.2027405-1-fontaine.fabrice@gmail.com>
 <20211104231210.2027405-2-fontaine.fabrice@gmail.com>
Date: Fri, 05 Nov 2021 16:04:01 +0100
In-Reply-To: <20211104231210.2027405-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 5 Nov 2021 00:12:08 +0100")
Message-ID: <87v916hcf2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/4] package/dahdi-linux: needs CRC CCITT
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > dahdi-linux needs a linux with CRC CCITT since the addition of the
 > package in commit d959966b41bd88a36664c733a8a8d2b6809e4fc2 as stated in
 > the README:

 > - CONFIG_CRC_CCITT must be enabled ('y' or 'm'). On 2.6 kernels this can
 >   be selected These can be selected from the "Library Routines" submenu
 >   during kernel configuration via "make menuconfig".

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
