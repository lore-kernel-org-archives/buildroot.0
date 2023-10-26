Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA0DC25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48F3D42463;
	Thu, 26 Oct 2023 16:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48F3D42463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n16K5h1lBt3O; Thu, 26 Oct 2023 16:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1387E41D7C;
	Thu, 26 Oct 2023 16:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1387E41D7C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 155811BF976
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D419740CC9
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D419740CC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1KmdcJDjT-O for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:08:07 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5D1641D18
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5D1641D18
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F32D20002;
 Thu, 26 Oct 2023 16:08:02 +0000 (UTC)
Date: Thu, 26 Oct 2023 18:08:02 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231026180802.2a5d22c5@booty>
In-Reply-To: <20231020114236.4129636-8-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
 <20231020114236.4129636-8-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698336483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mCvbkzBD94IYXm+summLNCvuSL8ZlX2bC6E1nbGmk2I=;
 b=eaF3VB28MAJdQSzLvOdIJiCxNQtGCvlTHlaZ25IxbfM6vHGztcQ80iqyIfvf9EwflYTemv
 4V4Vubrx7SbwbTHTBFGCIEul9VXg3vLVSTVqaH9kDLMtzDzWxFH2Z8RWEHm9FY+nSTd2rT
 JICyqtKE1RI35oukLNt2TUhulML6tKsPJAgxbGkVUzUvZHyDF8tTmI/11fz00UvGlz6N1i
 TSkYNTbRIWFidyPThqwEZ2srBVSxykcm+QB3TVw2YEXiQO6VxbguLuqwrdWwlgJ1qe6CPL
 DZF8me/rEL2WAlBqbn8xEL5GP3+b639xtuc7bIB+2k91Kq5y4lU8u4oI/OOBfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eaF3VB28
Subject: Re: [Buildroot] [PATCH v6 08/10] boot/versal-firmware: new boot
 firmware
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 20 Oct 2023 12:42:34 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new boot firmware to buildroot for building the versal plm
> and psmfw.  It requires the toolchain-bare-metal package that includes a
> bare-metal binutils, gcc and newlib which can be built for the microblaze
> architecture.
> 
> Patches are required to enable parallel building of the versal plm and psmfw
> applications.  These two patches have been submitted upstream internally at
> AMD / Xilinx and will be included with the 2023.2 release of the embeddedsw
> repository.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
