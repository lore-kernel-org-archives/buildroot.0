Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43278EE49AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 18:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D59E4611D1;
	Tue, 22 Aug 2023 18:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D59E4611D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id If-dz1j6GcAm; Tue, 22 Aug 2023 18:30:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD9C60BD3;
	Tue, 22 Aug 2023 18:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BD9C60BD3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 754801BF2BD
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D3E240933
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D3E240933
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFtwHW_0JViV for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 18:30:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC99440930
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 18:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC99440930
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAC0AE0006;
 Tue, 22 Aug 2023 18:30:21 +0000 (UTC)
Date: Tue, 22 Aug 2023 20:30:20 +0200
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20230822203020.6d72c2ed@windsurf>
In-Reply-To: <20230812215446.1458038-1-zgyarmati@zgyarmati.de>
References: <20230812215446.1458038-1-zgyarmati@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692729022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CLDn6rOKkdLncJy+CIALF/n/eLoTnuzVp1O9mvqmrks=;
 b=kMyd7WDm2GcuOoFMCxXZmTvGHaA/wPh9z9yLT502u3kVRLZk6E/WzndAUPb3efiHXC1pJ5
 CJW6epAhI5ZXL3dMx6ymps3HGkC9scx9RPomBChE3HerpV+wCOx2/3UHS0vog8gttM7gyH
 4s0BQau8lVE/+p7i+lBo85QNhSTR+TYGLRzwf4RsXWn7sXtYAB+SMcQdU90mdoKrUh7po/
 znNbGz2b9h9sov7OZSqSfuNQurdOYTVEHBSFyXaLMtQL4bBRxY5RcxSCX6fTef7iACzoLj
 s9yP8fGK1O+3flgZ0JRqTDi4MI+xJTTzGR0wx0ggQT2P/DWONlWstxdADrX/uA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kMyd7WDm
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libusb-compat: bump to 0.1.8
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

On Sat, 12 Aug 2023 23:54:46 +0200
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Removing upstreamed patch and force autoreconf
> 
> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  .../0001-fix-a-build-issue-on-linux.patch     | 32 -------------------
>  package/libusb-compat/libusb-compat.hash      |  2 +-
>  package/libusb-compat/libusb-compat.mk        |  5 ++-
>  3 files changed, 5 insertions(+), 34 deletions(-)
>  delete mode 100644 package/libusb-compat/0001-fix-a-build-issue-on-linux.patch

Applied to next, thanks. You had forgotten to update the
.checkpackageignore file with the patch removed, but I did it when
applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
