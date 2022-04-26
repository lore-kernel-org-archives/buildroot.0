Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477CAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 15:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F01E4610EC;
	Tue, 26 Apr 2022 15:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RNRWKLkXskdS; Tue, 26 Apr 2022 15:44:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 132BE60EC4;
	Tue, 26 Apr 2022 15:44:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09B721BF5A8
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 15:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC0B9417DF
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 15:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cC3Hw9wFQ2ez for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 15:44:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97C6D41817
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 15:44:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 717B740016;
 Tue, 26 Apr 2022 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650987846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMTJb+wL4WK7Chu3wv6hnINs1WD+5vCcylW2uOhXXS4=;
 b=YbwPuzUCn9eZMN68opT9vmjXTc+uCsE24kLUVjHaSV3tb0UfzBXnGquG+uNLf/UKkTRmLZ
 iCrcn8IMBcZ7U+KVIqnRbUOQiHZ1EqAstNEG0/Og/mCi0QQo5Bqfpw8eTsjiX53dBS7bpl
 +1mE0Ic3LpZGXc8Zw71HvgRa0QoPfMGqUhnKiGNPYZ9lJ0IYKgEh/MnlqIjiriFwFnkF7o
 BMDD7nxVIxw0aXqj/cqsOl4BlC7laNOUNrKorAqKNxCJml5b3Q3w1ryAFJJGTBJCdxfafR
 7xPuuLHTLCIOBwgVYubjxK5CvRTD+94cefo1W0UcDof6RILn1lH7y2BLQJBaKA==
Date: Tue, 26 Apr 2022 17:44:05 +0200
To: Buildroot List <buildroot@buildroot.org>
Message-ID: <20220426174405.09a8825a@windsurf>
In-Reply-To: <20220426153726.312870-3-thomas.petazzoni@bootlin.com>
References: <20220426153726.312870-1-thomas.petazzoni@bootlin.com>
 <20220426153726.312870-3-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/binutils: drop version 2.32
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Apr 2022 17:37:25 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Now that recent versions of binutils work with FLAT binaries, we can
> drop the old 2.32 version, which was kept only to keep support FLAT
> binaries.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Sorry, I forgot to drop the hash in binutils.hash on this one. I can
resend a v2 if needed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
