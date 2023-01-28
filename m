Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8281DC636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17E3281E9B;
	Sat, 28 Jan 2023 21:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E3281E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMz7RGR-0FSL; Sat, 28 Jan 2023 21:24:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A7BD81E06;
	Sat, 28 Jan 2023 21:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A7BD81E06
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CAD51BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A1B341703
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A1B341703
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lex2_nKh0ByK for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:23:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4FC241688
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4FC241688
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:23:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D6C39FF802;
 Sat, 28 Jan 2023 21:23:55 +0000 (UTC)
Date: Sat, 28 Jan 2023 22:23:55 +0100
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20230128222355.31ca5f86@windsurf>
In-Reply-To: <cc6ec5647287b0814750a7561f656efa684c354e.1674635820.git.stefan@agner.ch>
References: <cc6ec5647287b0814750a7561f656efa684c354e.1674635820.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674941036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqUSr/eBP9xJSxg9f8aF6r+Zc/XBjmHClUAmosguOgk=;
 b=cgZsgoKQqthXY1lbpI+jIcPPjFZbDTF6HBly3N2XhWkZClXwnrxQ5Is81+hcudQ3zTkYwf
 FvHYBjKMyiTYV9yYJOGleXhFXxtPK8Hnfz90pa67Loy4B+lvRdMcv2zf3wYDvzoOTZmtUC
 sUgM8jSqIM+YHkfmZtCzv1E0ttlOt0Y258AVW7+SrCTDKGxx3HJ5mdMAaHBglG2kl/mXCH
 evT5BCOEHVCKhUlTtqZjF4HOfNWiA1exgYWiZZCrQnolDq8KQsK0u01cpzlFLiOUtf4eNx
 JhDdBEd6CXxYdbd/SjByl/ySeQjRqk7uPtKxwG7JuR0KpIa6BJUYVDNOLXyJTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cgZsgoKQ
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add
 rtl8761b/rtl8761bu firmware
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 25 Jan 2023 09:37:24 +0100
Stefan Agner <stefan@agner.ch> wrote:

> Deploy rtl8761b/rtl8761bu firmwares as well.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/linux-firmware/linux-firmware.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
