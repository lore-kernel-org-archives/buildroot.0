Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF8DC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 22:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8252360E2C;
	Tue,  2 Aug 2022 22:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8252360E2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQ1BUA31jk-X; Tue,  2 Aug 2022 22:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8BA60ABF;
	Tue,  2 Aug 2022 22:08:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC8BA60ABF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 524E11BF48B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F4AF80BDC
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F4AF80BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKDJBcSVo9D3 for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 22:08:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E202180BD0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E202180BD0
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 22:08:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A84B240002;
 Tue,  2 Aug 2022 22:08:44 +0000 (UTC)
Date: Wed, 3 Aug 2022 00:08:43 +0200
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20220803000843.7adbecf5@windsurf>
In-Reply-To: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
References: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659478126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MX4tP12DooBc8LgRvhqQwpeBrSAg8U/+EPEj9RXW/jE=;
 b=dlL4EbTDHk2dIwS0blBtbj603Ax526cKBOJ0qHyfbFeER8Szbk1B/qK06D+PNqtxw8SFM8
 9PycBhPJARFB8Q/VfPCa8jZdzbk+c0Ds2Qfmvys2YcpvTemazr5XFTs8mK3uDg7D206g2C
 AUHV9os+CAME9a8j5ANM7U6i8PmokBkNUZcCfhqGo6t76IDmLOjkGQBjQVbudKS4Y1MMZZ
 cspqI7ZdSPBMVzYZxkagUVCEDQUObN3bMkJgLhtaGyJ7b0FZk7eAibny8BMuw/AoACst6/
 GOEkPDv9D5efvZ9aBSvRVe6+844rcuU9zIiWDdT/l3owZYzDHWS3Yz1OjOKMEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dlL4EbTD
Subject: Re: [Buildroot] [PATCH v2 0/4] Add support for FDPIC binaries on ARM
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ben,

On Tue,  2 Aug 2022 16:21:38 -0400
Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:

> Introduces support for the FDPIC binary format on ARM. FDPIC binaries
> enable more efficient use of memory on no-MMU systems.
> 
> The first patch reverts the removal of general FDPIC support, while the
> second adds support for FDPIC specifically on ARM. The last two patches
> disable FDPIC when building Linux and U-Boot.

Thanks a lot for this support! Could you comment on which
gcc/binutils/gdb versions have support for FDPIC on ARM?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
