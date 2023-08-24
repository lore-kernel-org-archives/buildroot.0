Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDEAC6FA8F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 477E341D9E;
	Thu, 24 Aug 2023 21:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 477E341D9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flIvB4DS5vx4; Thu, 24 Aug 2023 21:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7721141DBD;
	Thu, 24 Aug 2023 21:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7721141DBD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E20971BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9B54838CC
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9B54838CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iM7mVSR4PjvV for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:42:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B8038385D
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B8038385D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99F3C40002;
 Thu, 24 Aug 2023 21:41:58 +0000 (UTC)
Date: Thu, 24 Aug 2023 23:41:57 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230824234157.566450cf@windsurf>
In-Reply-To: <20230718093616.48126-1-giulio.benetti@benettiengineering.com>
References: <20230718112050.6d453ad0@windsurf>
 <20230718093616.48126-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692913319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJKF6E51+g/PHmVTUPxhQ+RJIraiXN0oIgMi6ACIYf4=;
 b=CxP9MA9MI4dntD9rKZCihsOyisNMJcmaSrx+Drv8WxSXkbngbkI6zQMFI+NsVQBLjzK4rI
 PKlkiti/cxobVO9O4SbEGZgqlpb7xW1pxtlwUY4w2/N/+7+41ccMNIc0q/lIAkhVStftzq
 nBNtBLJuHqHsTTFKQzP224OEgMJf7e0in9lA6ZXLT55+g8MFpE+WqNb7tzLGmtR1emMuU0
 Oi9ly/Xfi17gB5CODAAwnro+toyQySTSX0Vtto29fWOQvTpCB+F/0/NatNmsl2UoJtO5wj
 knZRs5yhk1cTX9VwBa4k6y0yEJO1wGnc/pKFPjq/xTMim/bSXQFXwsAdHTPIIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CxP9MA9M
Subject: Re: [Buildroot] [PATCH v2] package/rtl8189fs: fix build with big
 endian
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 18 Jul 2023 11:36:16 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add local patch to allow to override CFLAGS and undefine
> CONFIG_LITTLE_ENDIAN by default and use the correct endianness according
> to target architecture.
> 
> Fixes:
> http://autobuild.buildroot.net/results/fe67db3884573ef750eda9d0dccd5f97b3ae698e
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 41 +++++++++++++++++++
>  package/rtl8189fs/rtl8189fs.mk                |  6 ++-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

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
