Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A916BEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63F1C60E4A;
	Sun, 10 Sep 2023 16:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63F1C60E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EBZYOIn2l0Jo; Sun, 10 Sep 2023 16:36:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7F0060BF0;
	Sun, 10 Sep 2023 16:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7F0060BF0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E14651BF263
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B92A8409A8
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B92A8409A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-xTRShcgoh8 for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:36:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32AD64099B
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 16:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32AD64099B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B26B1C0008;
 Sun, 10 Sep 2023 16:36:09 +0000 (UTC)
Date: Sun, 10 Sep 2023 18:36:08 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230910183608.246a96a5@windsurf>
In-Reply-To: <20230910041001.1356119-1-james.hilliard1@gmail.com>
References: <20230910041001.1356119-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694363770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qn8RvynNg512xD+K1Z2GFMAdKku1DTaWRJxbdIeK/l4=;
 b=TK+ugCn27DeZ343pmrDzKsu0vxnRai0+pi518ycNeKlVBevEaHOuEooIJdOI2dAcbDfoBC
 Nj5VJR0b3O0KzdlC6snJihfPcU0AffvP89JQxZtJCqN+vL630mL/fXAnQxsT2AMx/7RVcf
 HhAwDz12lzd+DpqBNReSwkPDbCgeCAx0XeoxuMnlGfnxTjVJbVqRHc7Qo+PqnrLstCowvm
 GofubqgDaCxcvMZnTyY210Q7/UpMrXXD3png7rni88N7Cyfzw8Xqc8qyakEei5gnB/ef+z
 71mcSaVcu/OmU5BHn2eGEddaYQjWTUu4om3ucplA+2Kv+u0pTBdiDrpsXml4BQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TK+ugCn2
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2023.05
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

On Sat,  9 Sep 2023 22:10:01 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> ISC license hash changed due to text update:
> https://github.com/sbabic/swupdate/commit/d217a9b10e7b25296db4899beabc2de2b379c921
> 
> Set new HAVE_LIBEBGENV and HAVE_LIBUBOOTENV env variables.
> 
> Apply latest updates to swupdate-usb@.service from:
> https://github.com/sbabic/meta-swupdate/commit/d5f84e74aada1212ed877509bdc546dca468451b
> https://github.com/sbabic/meta-swupdate/commit/dac7b2d10ec84b2b6de9afadc12419398ea73615
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/swupdate/swupdate-usb@.service | 10 ++++++----
>  package/swupdate/swupdate.hash         |  4 ++--
>  package/swupdate/swupdate.mk           |  8 +++++++-
>  3 files changed, 15 insertions(+), 7 deletions(-)

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
