Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C146C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2518481AF3;
	Mon,  5 Dec 2022 12:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2518481AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uGfW_t3WSxk; Mon,  5 Dec 2022 12:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68BA681A2B;
	Mon,  5 Dec 2022 12:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68BA681A2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55AF21BF4E2
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 12:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E8BC415DA
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 12:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E8BC415DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLFBLM3A7Q_3 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 12:40:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8832B415D0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8832B415D0
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 12:40:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 37622E0012;
 Mon,  5 Dec 2022 12:39:56 +0000 (UTC)
Date: Mon, 5 Dec 2022 13:39:55 +0100
To: duan <duanzhiwei@loongson.cn>
Message-ID: <20221205133955.4ad67e6a@windsurf>
In-Reply-To: <7ac3c7b8-7110-eaef-a070-d321611e8238@loongson.cn>
References: <7ac3c7b8-7110-eaef-a070-d321611e8238@loongson.cn>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670243997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYZZKyIkT8Pxylu4jvMn5l9Czjca7Kaoxo353Mfrogw=;
 b=P+hPpD6WfQPE33g/k4sxESIbgRbfOkk0XGQMwnvuCu4iZgfRusUk1J+Stbs6l1KDkWxd9U
 M3s8ZcBFzjhgRbUF6nfTQMhGRTt81N9FkfZMX7FAXmnQET8QUEzLLZaSShvMSIhajb7XN0
 TD3sp8ji7xs7fvRONOxD9O2G55p/Z6jOgSkIPfvfGJXjOLPhEskdby0/2oXQFwJYKF4j9a
 zBlMYxhZtUUJkRCldQDE08Wknp2anq6yaudB/wMIHaEteQSX3nb0B///nmVW7XZ5FAlzz+
 CzylpfsXSDUNIlfL1W6cKZR46kICcsnR4Cfw0uPz/lpfDtDcLkWhZfAEnLtjTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P+hPpD6W
Subject: Re: [Buildroot] [PATCH v2] buildroot: Add basic support for
 LoongArch architecture (toolchain only)
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

Hello,

On Mon, 5 Dec 2022 17:37:46 +0800
duan <duanzhiwei@loongson.cn> wrote:

> From: Zhiwei Duan <duanzhiwei@loongson.cn>
> 
> 
> With this patch, the buildroot can compile the rootfs of the loongarch 
> architecture.
> 
> Both external toolchain and buildroot toolchain can compile rootfs.
> 
> Signed-off-by: Zhiwei Duan <duanzhiwei@loongson.cn>

Thanks for this patch, glad to see your work on this new architecture.

Could you resend your patch with "git send-email"? Indeed your patch
has been badly damaged by your e-mail client.

Also, could you comment on which gcc, binutils, gdb and uclibc versions
have support for LoongArch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
