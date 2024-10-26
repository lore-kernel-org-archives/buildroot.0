Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22280D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 15:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD4BC605EA;
	Sat, 26 Oct 2024 15:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xv7XivlbJDJh; Sat, 26 Oct 2024 15:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEC7C60608
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEC7C60608;
	Sat, 26 Oct 2024 15:44:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 202D65C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED5DA40363
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7OgEawTzHUe for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 15:44:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88F11403B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88F11403B8
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88F11403B8
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:44:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54C8440005;
 Sat, 26 Oct 2024 15:44:52 +0000 (UTC)
Date: Sat, 26 Oct 2024 17:44:51 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>, Asaf Kahlon
 <asafka7@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <20241026174451.0b1e2c89@windsurf>
In-Reply-To: <20240917021332.3838579-1-james.hilliard1@gmail.com>
References: <20240917021332.3838579-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729957492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKL/6rqcUPwCfbWT3YGCuvlRavhgSZysuxVT5zIfB1g=;
 b=bJgJwX9juZxqG6c+heOodA0iA6CksQheqcxt2gMv64ZMo24bLGqP2dnGO5G1Ba4NzyaSwh
 klHNhWgOp8/R9gRvawVA/smqgZB+MvBm0ue7QzZlaOj4MziMMaZIW/x5HOttx81FMzS02v
 taqT6GKtMQTPiMFdRIPy6kL62r+SqVIvucCXJAXwVUmqvp14REmHrqIrRpUo5bYT7Fu/dQ
 AlJ4SqXuQc4rq5Z/ZRQXKgIH3tKKPkL/ktQNHPiOypRxUiAmvD7d/NhW7gPezfcUqMbWe6
 lDMHdCpRs4eqGn6mOj7IYoNLuuCBzH3zeaY6Cnf8AgdHimqfAf2dB8CKEvXS7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bJgJwX9j
Subject: Re: [Buildroot] [PATCH v5 1/3] package/python-numpy: bump to
 version 1.26.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Mon, 16 Sep 2024 20:13:30 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We also need to set the architecture specific longdouble_format
> property as numpy is unable to determine the value for this without
> being able to execute target binaries.

Please document in the .mk file how you could those values. You
explained it in a reply to your v4, but I believe it should be kept in
the package for posterity. More comment on this below.

> +ifeq ($(BR2_arcle),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
> +else ifeq ($(BR2_arceb),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
> +else ifeq ($(BR2_aarch64),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
> +else ifeq ($(BR2_aarch64_be),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
> +else ifeq ($(BR2_arm),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
> +else ifeq ($(BR2_armeb),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
> +else ifeq ($(BR2_armeb),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE

You have armeb twice.

BR2_i386 is not handled.

> +else ifeq ($(BR2_or1k),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE

This one is not in the correct alphabetic ordering (less important).

So, overall, I'm wondering if this shouldn't be handled in the
Config.in machinery, as follows:

# Some good comment here about how those values were found
config BR2_PACKAGE_PYTHON_NUMPY_LONGDOUBLE_FORMAT
	string
	default "IEEE_DOUBLE_LE" if BR2_... || BR2_... || BR2_...
	default "IEEE_DOUBLE_BE" if BR2_... || BR2_...

config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
	bool
	default y if BR2_PACKAGE_PYTHON_NUMPY_LONGDOUBLE_FORMAT != ""

This way we cannot miss any case :-)

Could you have a look into this? I wanted to rework myself, but since
the value is missing for some architectures (i386), I couldn't really
do it easily.

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
