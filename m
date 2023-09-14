Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C561EEAA71
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B66004191B;
	Thu, 14 Sep 2023 21:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B66004191B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLhIRIeGARSL; Thu, 14 Sep 2023 21:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D9F441854;
	Thu, 14 Sep 2023 21:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D9F441854
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE1AB1BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 862C560E7C
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 862C560E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9oUqlAKKQG8m for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:34:12 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1F8F612E5
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1F8F612E5
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9FC3240006;
 Thu, 14 Sep 2023 21:34:09 +0000 (UTC)
Date: Thu, 14 Sep 2023 23:34:08 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230914233408.6036bb74@windsurf>
In-Reply-To: <20230914210448.439577-1-fontaine.fabrice@gmail.com>
References: <20230914210448.439577-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694727250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cWiprVmimZnLEvCKeJMOqqVebocMd5sA/lRTJaBEFk=;
 b=MhPwHAEsFZKO28h2GvKmV17KHzxnMr8f50mIlR82uvkPXwPByWIqWcnC5DKoiXN8jFg+qw
 uV3JpI0cigkfBboR9F1BM09bdvB4u3yyKB5UKoqhCIJK+phPmXel+8clqEbilfMMIWJGLU
 to8rVFFrV6aMVHIrByaRZwhFcd8pzR1MYAl5+LBtNTbINAw+J5ITLOWonaqQ0GqZxK5pBQ
 qDLQr7sd3QT0U/KLDe6mDEavvNTyJMcyuN14X8Eu2o0Mwmx60bHFKlUlY7Iip6VFO6F52v
 nHgu+0vp7HOVCVa6SpBrgSxrlOYt3MnuBQJV68ndNFGbJlLuV12UFqi+fnQ17g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MhPwHAEs
Subject: Re: [Buildroot] [PATCH 1/1] package/libspdm: fix legal info
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
Cc: Alistair Francis <alistair@alistair23.me>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 14 Sep 2023 23:04:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Hash of license file is wrong since the addition of the package in
> commit a837a609a83428b56fa03e18c439b3878d14fdb6
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2f9007ee40126cd57753bc97ae2d81c922d9f9f2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libspdm/libspdm.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Wow, with the number of iteration lispdm has gone through, I'm amazed
that such a simple mistake has fallen through the cracks. Anyway,
thanks for fixing it! Applied to master, of course.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
