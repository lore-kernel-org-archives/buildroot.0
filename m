Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02421C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 22:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D36C40294;
	Tue, 16 Jul 2024 22:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVx7g2TRTTBB; Tue, 16 Jul 2024 22:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 882BC40169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 882BC40169;
	Tue, 16 Jul 2024 22:18:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCDDE1BF372
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 22:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9DE340169
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 22:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFEh_jtGq3Gt for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 22:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71ED840129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71ED840129
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71ED840129
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 22:18:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BF511BF204;
 Tue, 16 Jul 2024 22:17:59 +0000 (UTC)
Date: Wed, 17 Jul 2024 00:17:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240717001758.65e4c207@windsurf>
In-Reply-To: <CADvTj4pF77Ci9k+DjaXz63DDqrJRatjSUD8kFdYz56MnP3sHwQ@mail.gmail.com>
References: <20240611152202.951202-1-james.hilliard1@gmail.com>
 <20240611152202.951202-4-james.hilliard1@gmail.com>
 <20240716141755.1bf5473b@windsurf>
 <CADvTj4pA9E8H7=S5HKBHwUhgKq8c_+TcRcu1BAMSBxPNTwTX0Q@mail.gmail.com>
 <20240716214724.62a772d4@windsurf>
 <CADvTj4pF77Ci9k+DjaXz63DDqrJRatjSUD8kFdYz56MnP3sHwQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721168279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ellYBDwX3Wnn4j0C77Mn6j+wfU12wvb73sz8++ngkks=;
 b=LJH9w7jyrsQ4rjL4pWjGlCrWPih1Z42mhRZA9SO/YY0Iac7rw4L5RyO5eza3vjvPkjQifA
 DYUeFb1Y+MYsKsr01GnZ69FRDoUi7vUAHvFiiLk8OhB64CKqtEG6iAJSvNdYRPaFku84a5
 c8ax4M/HuLLQhbuShGqkybrkDAEhkcVacwK00J6LTzFJIKZ9Luy5+9gEtIkEQytRgnfEnC
 eMuv7MiOP+0YqaNYX8gy5DDI/Vux2zao56rNiezuyDggeGqvojddgAI7CDxomOyPlwMdED
 U8//1nQ1ytC2X6LAzXu9LswiN5YmUb4XnsPJaxl6E78iiCH/7qhK/roN8c2xHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LJH9w7jy
Subject: Re: [Buildroot] [PATCH v2 4/4] package/fwupd: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Jul 2024 13:56:56 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> So udevdir is required to be defined if udev is not present due to this:
> https://github.com/fwupd/fwupd/blob/1.9.21/meson.build#L276-L280
> 
> But installation is actually conditional here based on gudev:
> https://github.com/fwupd/fwupd/blob/1.9.21/data/meson.build#L62-L64
> 
> So always setting -Dudevdir=/usr/lib/udev seems to be the best option
> as the build system always wants that defined even when not used.

Thanks for the explanation. Would perhaps be good to submit a bug
upstream, or even better a fix. Makes no sense to have to define
udevdir if it doesn't get used.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
