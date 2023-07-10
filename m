Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34F2EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 20:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CF5640B98;
	Mon, 10 Jul 2023 20:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CF5640B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9URwjfYq62X; Mon, 10 Jul 2023 20:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B93EE40B93;
	Mon, 10 Jul 2023 20:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B93EE40B93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A79CA1BF3A1
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61EAC61005
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 20:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61EAC61005
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oT5TQsCU5LeP for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 20:01:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08A2C60E2E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08A2C60E2E
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 20:01:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3362BC0008;
 Mon, 10 Jul 2023 20:01:55 +0000 (UTC)
Date: Mon, 10 Jul 2023 22:01:54 +0200
To: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Message-ID: <20230710220154.1244535c@windsurf>
In-Reply-To: <20230626131714.4bef3bde@booty>
References: <20230620172305.4176-1-ckhardin@gmail.com>
 <20230626131714.4bef3bde@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689019315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8ow9DtKXwWSENBxfkZDqYtk2FxH3Darfk/mVjnBSv4=;
 b=psQdAyVKRqQr3Kgo0u7NsIV94CkNRdAuWqJkihFEMKJ4zX2+s6qBRf4bSN8rth1qnFUz+k
 70lVzk9c+phZ6mXFwtugMp0hnkKH8oVwLI49FB8syG/8xwMc43lUiQi+qlD/v9ZxIBbelm
 93TbkbD4QS9xmiBV8OjmSSE/KQsULzH0AUk38vUA5G9rkq9ZUL5AxHzX/Y3QBiSsJVay87
 lGl9aAdROGIfqidiip2mBjl+PlPdu2XBBZJ2rlI/AVKpMYB0JR2s2hoE33bSBOWWnSlBRH
 KPhgIUeIBAVuvys0Uxf/tJy+5IAZJRdQRNTB4jmbI9SkjeiCB1erkMhpWsfUBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=psQdAyVK
Subject: Re: [Buildroot] [PATCH 1/1] package/unzip: configure with
 LARGE_FILE_SUPPORT by default
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

On Mon, 26 Jun 2023 13:17:14 +0200
Luca Ceresoli via buildroot <buildroot@buildroot.org> wrote:

> > +# unzip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
> > +# necessary, redefining it on the command line causes some warnings.  
> 
> "causes some warnings" -> "causes extraction errors"?

Actually no, the comment was correct. What causes the extraction error
is the large of -DLARGE_FILE_SUPPORT (which is a unzip specific thing).

The thing is that when -DLARGE_FILE_SUPPORT is passed, the unzip build
system defines on its own _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE,
which causes a redefinition warning by gcc. So undefining
_LARGEFILE_SOURCE and _LARGEFILE64_SOURCE does not solve the extraction
error: it only avoids the redefinition warning from gcc.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
