Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E54AC47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36F05615F8;
	Thu,  4 Jan 2024 21:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36F05615F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0RImkmZMOPb8; Thu,  4 Jan 2024 21:31:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9812A61B35;
	Thu,  4 Jan 2024 21:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9812A61B35
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D9101BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 142048452E
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 142048452E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lhn-v6KgIyv6 for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:30:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04FF18452C
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04FF18452C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 335C6FF80A;
 Thu,  4 Jan 2024 21:30:49 +0000 (UTC)
Date: Thu, 4 Jan 2024 22:30:48 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240104223048.191bf429@windsurf>
In-Reply-To: <20240103181826.875567-1-fontaine.fabrice@gmail.com>
References: <20240103181826.875567-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704403849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hre7eYzA/PaYAtHlmsQpY43J4Dn+/Ntj348RjuswJUw=;
 b=Fxr2f8sLqVjvQIbB9VfFVCDju/ksjZOPbx+d/R8dA7zsMdQo5FcCcMGctIqqcwVGwrxcA5
 FWxYduAr2VxK2lBGvgbSx8Jlm8HlupTAkmduq7RJUqcVfOxbfOatKn+5HZy1tsK72ZbfoA
 beu1vi9vmDsXTxnobgKN1zsR6TwSa8+Bfp0Abbstd94kkAcBwZp+EuDMY7yWEV5opolkdv
 DpDrRuWhb4oGdXbyH5/to7maw+AQqMTGW5mq6YVWDDD0/Pn7q+QjfFI5b/a4077ZpFImgS
 Tro3DfUrGU797qPPHbzLPt85QduZ79EQJbea6N81JBBuTL4MNM6k2/jMOCPbvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fxr2f8sL
Subject: Re: [Buildroot] [PATCH 1/1] package/utf8proc: bump to version 2.9.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Jan 2024 19:18:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use official tarball
> 
> https://github.com/JuliaStrings/utf8proc/blob/v2.9.0/NEWS.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/utf8proc/utf8proc.hash | 2 +-
>  package/utf8proc/utf8proc.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
